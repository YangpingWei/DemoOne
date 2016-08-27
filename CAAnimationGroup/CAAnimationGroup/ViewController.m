//
//  ViewController.m
//  CAAnimationGroup
//
//  Created by tens04 on 16/8/27.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

#define TScreenWidth [UIScreen mainScreen].bounds.size.width

#define TScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *aniImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    self.bgView.layer.delegate = self;
    [self.bgView.layer setNeedsDisplay];
    
    NSLog(@"%@",NSStringFromCGRect(self.aniImageView.frame));
    NSLog(@"%f, %f",TScreenWidth, TScreenHeight);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [self.aniImageView.layer addAnimation:[self animationGroup] forKey:@"group"];
}

- (CAAnimation *)positionAnimation {
    
    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    keyAni.duration = 3.0;
    keyAni.fillMode = kCAFillModeForwards;
    keyAni.removedOnCompletion = NO;
    keyAni.path = [self path].CGPath;
    
    return keyAni;
}


- (CAAnimation *)rotationAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    animation.beginTime = 3.0;
    animation.duration = 2.0;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.byValue = @(2 * M_PI);
    
    return animation;
}

- (CAAnimation *)downAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.beginTime = 3.0;
    animation.duration = 2.0;
    animation.byValue = [NSValue valueWithCGPoint:CGPointMake(-50, TScreenHeight)];
    
    return animation;
}


- (UIBezierPath *)path  {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, TScreenHeight)];
    CGPoint toPoint = CGPointMake(TScreenWidth, 0);
    
    CGPoint controlPoint = CGPointMake(TScreenWidth,TScreenHeight);
    [path addQuadCurveToPoint:toPoint controlPoint:controlPoint];
    
    return path;
}


- (CAAnimation *)animationGroup {
    
    // 创建一个动画组，用于组合多种动画
    CAAnimationGroup * aniGroup = [CAAnimationGroup animation];
    
    // 动画组的完成时间
    aniGroup.duration = 5.0;
    aniGroup.fillMode = kCAFillModeForwards;
    aniGroup.removedOnCompletion = NO;
    // 组合多个动画
    aniGroup.animations = @[[self positionAnimation],[self rotationAnimation],[self downAnimation]];
    return aniGroup;
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    CGContextAddPath(ctx, [self path].CGPath);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextDrawPath(ctx, kCGPathStroke);
}


@end
