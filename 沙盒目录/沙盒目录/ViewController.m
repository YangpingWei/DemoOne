//
//  ViewController.m
//  沙盒目录
//
//  Created by tens04 on 16/8/30.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //沙盒目录路径
    NSString *path = NSHomeDirectory();
    
    NSString *documentPath = [path stringByAppendingPathComponent:@"ocuments"];
    NSLog(@"%@",documentPath);
    
    
}
//Documents路径
-(NSString *)documents{
    /**
     *   NSSearchPathForDirectoriesInDomains: 获取文件目录路径
     *
     *  @param NSDocumentDirectory   要获取的目录名称
     *  @param NSUserDomainMask      要查找的目录的主目录(沙盒目录)
     *  @param YES                   是否返回完整的路径
     *
     *  @return <#return value description#>
     */
    return  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

//获取Library路径
-(NSString *)libPath{
    /**
     *   NSSearchPathForDirectoriesInDomains: 获取文件目录路径
     *
     *  @param NSLibraryDirectory   要获取的目录名称
     *  @param NSUserDomainMask      要查找的目录的主目录(沙盒目录)
     *  @param YES                   是否返回完整的路径
     *
     *  @return <#return value description#>
     */
    return  [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}
 //获取缓存目录路径
-(NSString *)cachesPath{
    /**
     *   NSSearchPathForDirectoriesInDomains: 获取文件目录路径
     *
     *  @param NSCachesDirectory   要获取的目录名称
     *  @param NSUserDomainMask      要查找的目录的主目录(沙盒目录)
     *  @param YES                   是否返回完整的路径
     *
     *  @return <#return value description#>
     */
    return  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

//// 获取Tem目录 (零时文件)
-(NSString *)temPath{
    
    return  NSTemporaryDirectory();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
