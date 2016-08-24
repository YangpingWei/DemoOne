//
//  ViewController.m
//  CAlayer_3D
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *views;
@property (nonatomic,strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 200, 100);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    _layer.position = self.view.center;
    
    [self.view.layer addSublayer:self.layer];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    /**
     *  旋转
     *
     *  @param _layer.transform <#_layer.transform description#>
     *  @param M_2_PI           角度
     *  @param 0                <#0 description#>
     *  @param 1                沿y轴旋转
     *  @param 0                <#0 description#>
     *
     *  @return <#return value description#>
     */
    _layer.transform = CATransform3DRotate(_layer.transform, M_2_PI, 0, 1, 0);
    
    // 放大；
    _layer.transform = CATransform3DScale(_layer.transform, 1.2, 1.2, 1);
    
    /**
     *  平移
     *
     *  @param _layer.transform <#_layer.transform description#>
     *  @param 100              向x轴平移100；
     *  @param 0                y轴平移0；
     *  @param 0                z轴平移0；
     *
     *  @return <#return value description#>
     */
    _layer.transform = CATransform3DTranslate(_layer.transform, 100, 0, 0);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
