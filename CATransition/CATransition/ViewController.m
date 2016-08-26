//
//  ViewController.m
//  CATransition
//
//  Created by tens04 on 16/8/26.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    CALayer *transitionLayer;
}
@property (weak, nonatomic) IBOutlet UIImageView *views;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    static int index = 0;
    NSString *imageNames = [NSString stringWithFormat:@"large_%d",index];
    
    self.views.image = [UIImage imageNamed:imageNames];
    index ++;
    if (index > 10) {
        index = 0;
    }
    [self.views.layer addAnimation:[self transition] forKey:nil];
}

-(CAAnimation *)transition{
    
    CATransition *transition = [CATransition animation];
    /*
     1. fade     淡出效果
     2. moveIn 进入效果
     3. push    推出效果
     4. reveal   移出效果
     
     // 未公开的
     5. cube   立方体翻转效果
     6. suckEffect  抽走效果
     7. rippleEffect 水波效果
     8. pageCurl    翻开页效果
     9. pageUnCurl 关闭页效果
     10. cameraIrisHollowOpen  相机镜头打开效果
     11.  cameraIrisHollowClose  相机镜头关闭效果
     */
    transition.type =kCATransitionFade;
    
    // transitionAni.type = @"push";
    
    // 转场的方向：`fromLeft', `fromRight', `fromTop'  `fromBottom'
    transition.subtype = kCATransitionFromLeft;
    
    
    // 开始转场和结束转场的进度位置
     transition.startProgress = 0.5;
     transition.endProgress = 1;
    
    
    return transition;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
