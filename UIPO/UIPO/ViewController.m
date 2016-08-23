//
//  ViewController.m
//  UIPO
//
//  Created by tens04 on 16/8/22.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef void(^SumBlock) (int a,int b);

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self sum_Block:^(int a, int b) {
        NSLog(@"a+b =%d",a+b);
    }];
}
-(void)sum_Block:(SumBlock)sumBlock{
    sumBlock(990,330);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
