//
//  ViewController.m
//  属性设置
//
//  Created by tens04 on 16/8/30.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

-(void)propertyList{
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"userInfo.pist"];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:@"admin" forKey:@"userName"];
    [userInfo setObject:@"2345678987654@qq.com" forKey:@"email"];
    
    // 1、将字典数据写入plist文件
    BOOL isWrite = [userInfo writeToFile:filePath atomically:YES];
    
    NSString *filePath_array = [docPath stringByAppendingPathComponent:@"infos.plist"];
    NSArray *infos = @[@"1",@"2",@"3"];
    
    //2`将数组数据写入pist文件
    BOOL isWrite_1 = [infos writeToFile:filePath_array atomically:YES];
    if (isWrite_1) {
        NSLog(@"数据写入成功");
    } else {
        
        NSLog(@"写入失败");
    }
    // 3、NSString 、NSNumber、NSdate、NSData、boolean 类型数据同理
    NSLog(@"%@",docPath);
    
    // 4、获取本地路径的plist文件
    NSArray *infos1_ = [NSArray arrayWithContentsOfFile:filePath_array];
    // NSDictionary *userInfos = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"%@",infos1_);
}

#pragma mark - NSUserDefaults
- (void)userDefaults {
    
    // NSUserDefaults 系统提供的plist文件
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 设值
    [userDefaults setObject:@100 forKey:@"id"];
    [userDefaults setBool:YES forKey:@"isLoad"];
    [userDefaults setDouble:3.8408 forKey:@"price"];
    
    //    User *user = [[User alloc] init];
    //    user.userName = @"qwer";
    //    user.password = @"1234567";
    //    [userDefaults setObject:user forKey:@"user"];
    
    
    // 数据同步(即使更新数据)
    [userDefaults synchronize];
    
    // 取值
    id value = [userDefaults objectForKey:@"id"];
    NSLog(@"%@",value);
    
    // 修改
    [userDefaults setObject:@2000 forKey:@"id"];
    [userDefaults synchronize];
    
    
    NSLog(@"%@",NSHomeDirectory());
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
