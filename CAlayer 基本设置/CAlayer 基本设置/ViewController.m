//
//  ViewController.m
//  CAlayer 基本设置
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *layer = [[CALayer alloc]init];
    
    layer.frame = CGRectMake(10, 200, 200, 200);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"20160610_140104"].CGImage);
    
    CATextLayer *text = [[CATextLayer alloc]init];
    text.frame = CGRectMake(10, 20, 200, 70);
    text.foregroundColor = [UIColor yellowColor].CGColor;
    text.string = @"帅哥一枚";
    text.fontSize = 20;
    text.backgroundColor = [UIColor blackColor].CGColor;
    
    text.alignmentMode = @"left";
    [self.view.layer addSublayer:text];
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(7, 20, 90, 30);
    view.layer.borderWidth = 4;
    view.layer.borderColor = [UIColor redColor].CGColor;
    view.layer.cornerRadius = 10;
    view.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor colorWithWhite:1 alpha:1]);
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
