//
//  ViewController.m
//  CABasicAnimation 基础
//
//  Created by tens04 on 16/8/26.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    CALayer *oneLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    oneLayer = [CALayer layer];
    oneLayer.bounds = CGRectMake(0, 0, 100, 100);
    oneLayer.position = self.view.center;
    oneLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"IMG20160707094726"].CGImage);
    oneLayer.cornerRadius = 50;
    /**
     *  裁减
     */
    oneLayer.masksToBounds = YES;
    
    [self.view.layer addSublayer:oneLayer];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [oneLayer addAnimation:[self position] forKey:nil];
    [oneLayer addAnimation:[self rotation] forKey:nil];
    
}

-(CAAnimation *)position{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 400)];
    animation.duration = 3.0;
    
    
    /* 5、动画的填充模式：
     kCAFillModeForwards
     kCAFillModeBackwards
     kCAFillModeBoth
     kCAFillModeRemoved
     */
    animation.fillMode  =kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    /**
     *  是否有回复效果
     */
    animation.autoreverses = YES;
    /**
     *  循环次数  HUGE_VALF：无限次；
     */
    animation.repeatCount = HUGE_VALF;
    
    
    /* 动画的线性变换(动画速度变化)
     
     kCAMediaTimingFunctionLinear 匀速
     kCAMediaTimingFunctionEaseIn 加速
     kCAMediaTimingFunctionEaseOut 减速
     kCAMediaTimingFunctionEaseInEaseOut 缓慢进入缓慢出去
     kCAMediaTimingFunctionDefault 默认
     */
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    return animation;
}
-(CAAnimation *)rotation{
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.byValue = @(8 * M_PI);
    rotate.duration = 1;
    rotate.fillMode = kCAFillModeForwards;
    rotate.removedOnCompletion = NO;
    rotate.autoreverses = YES;
    rotate.repeatCount = HUGE_VALF;
    
    return rotate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
