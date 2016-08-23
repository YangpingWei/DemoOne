//
//  ViewController.m
//  Block 触发事件
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"
#import "TSButton.h"

@interface ViewController ()

@property(nonatomic,strong) TSButton *button;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.button];
}

-(TSButton *)button{
    if (!_button) {
        _button = [TSButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(20, 90, 200, 50);
        _button.backgroundColor = [UIColor redColor];
        [_button buttonHandle:^{
            NSLog(@"触发点击");
        }];
        
    }
    
    return _button;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
