//
//  ViewController.m
//  PP练习
//
//  Created by tens04 on 16/8/29.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"
#import "Draw.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Draw *mian = [[Draw alloc] initWithFrame:self.view.bounds];
    
    mian.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:mian];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
