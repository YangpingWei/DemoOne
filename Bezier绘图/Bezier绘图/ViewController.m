//
//  ViewController.m
//  Bezier绘图
//
//  Created by tens04 on 16/8/31.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BezierPathView *pathView = [[BezierPathView alloc] initWithFrame:self.view.bounds];
    pathView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:pathView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
