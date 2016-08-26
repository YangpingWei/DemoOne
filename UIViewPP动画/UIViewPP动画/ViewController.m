//
//  ViewController.m
//  UIViewPP动画
//
//  Created by tens04 on 16/8/26.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    UIView *viewAnimation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    viewAnimation = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 100, 100)];
    viewAnimation.center = self.view.center;
    viewAnimation.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:viewAnimation];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self animation];
}

-(void)animation{
    //简单的动画
    
    [UIView  animateWithDuration:1 animations:^{
        
        viewAnimation.transform = CGAffineTransformScale(viewAnimation.transform, 2, 2);
        viewAnimation.layer.cornerRadius = 50;
        
    }];
    
    //处理动画完成后的操作
    
    [UIView animateWithDuration:1 animations:^{
        
        viewAnimation.transform = CGAffineTransformScale(viewAnimation.transform, 2, 2);
        viewAnimation.layer.cornerRadius = 50;
        
    } completion:^(BOOL finished) {
        
        viewAnimation.transform = CGAffineTransformIdentity;
        viewAnimation.layer.cornerRadius = 0;
        
    }];
    
    // 设置动画的延迟
    /**
     * delay:延迟的秒数  options：动画的线性变化；
     */
    
    [UIView animateKeyframesWithDuration:1 delay:1.5 options:UIViewKeyframeAnimationOptionAutoreverse animations:^{
        
        viewAnimation.transform = CGAffineTransformScale(viewAnimation.transform, 2, 2);
        viewAnimation.layer.cornerRadius = 50;
    } completion:^(BOOL finished) {
        
        viewAnimation.transform = CGAffineTransformIdentity;
        viewAnimation.layer.cornerRadius = 0;
        
    }];
    
    //
    [UIView animateWithDuration:1 delay:1.5 usingSpringWithDamping:0.8
          initialSpringVelocity:1 options:0 animations:^{
        
        viewAnimation.transform = CGAffineTransformScale(viewAnimation.transform, 2, 2);
        viewAnimation.layer.cornerRadius = 50;
        
    } completion:^(BOOL finished) {
        viewAnimation.transform = CGAffineTransformIdentity;
        viewAnimation.layer.cornerRadius = 0;
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
