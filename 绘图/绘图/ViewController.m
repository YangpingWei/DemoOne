//
//  ViewController.m
//  绘图
//
//  Created by tens04 on 16/8/29.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"
#import "BazierLine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BazierLine *bezier = [[BazierLine alloc]initWithFrame:self.view.bounds];
    bezier.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:bezier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
