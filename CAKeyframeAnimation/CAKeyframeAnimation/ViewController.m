//
//  ViewController.m
//  CAKeyframeAnimation
//
//  Created by tens04 on 16/8/26.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"
#define SW [UIScreen mainScreen].bounds.size.width
#define SH [UIScreen mainScreen].bounds.size.height
@interface ViewController (){
    
    CALayer *aniLayer;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    aniLayer  = [CALayer layer];
    aniLayer.bounds = CGRectMake(0, 0, 100, 100);
    aniLayer.position = CGPointMake(SW/2, 50);
    aniLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"SelfieCity_20160703165723_save"].CGImage);
    aniLayer.cornerRadius = 50;
    aniLayer.masksToBounds = YES;
    [self.view.layer addSublayer:aniLayer];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [aniLayer addAnimation:[self keyframe] forKey:nil];
}

-(CAAnimation *) keyframe{
    
    CAKeyframeAnimation * keyf = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    
    NSValue * point_1 = [NSValue valueWithCGPoint:CGPointMake(SW/2, 50)];
    NSValue * point_2 = [NSValue valueWithCGPoint:CGPointMake(SW-50, SH/2)];
    NSValue * point_3 = [NSValue valueWithCGPoint:CGPointMake(SW/2,SH - 50)];
    NSValue * point_4 = [NSValue valueWithCGPoint:CGPointMake(50,SH /2)];
    NSValue * point_5 = [NSValue valueWithCGPoint:CGPointMake(SW/2, 50)];
    // values:设置关键帧(多个目标点)
    keyf.values = @[point_1,point_2,point_3,point_4,point_5];
    // 设置每一帧所在的时间比例
    //keyf.keyTimes = @[@0.1,@0,@0.5,@0.2,@0.9];
    
    
    /* 插值计算模式：
     kCAAnimationLinear  关键帧之间进行插值计算（线性的）
     kCAAnimationDiscrete 关键帧之间不进行插值计算（离散的）
     kCAAnimationPaced 关键帧之间匀速切换，keyTimes\timingFunctions的设置将不起作用
     kCAAnimationCubic 关键帧进行圆滑曲线相连后插值计算
     kCAAnimationCubicPaced 匀速并且关键帧进行圆滑曲线相连后插值计算
     */
    keyf.calculationMode = kCAAnimationLinear ;
    keyf.repeatCount = HUGE_VALF;
    keyf.duration = 2;
    return keyf;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
