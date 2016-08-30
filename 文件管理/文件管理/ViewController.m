//
//  ViewController.m
//  文件管理
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
    
    
    
}


-(void)createDirectory{
    
    //文件管理 ：用于管理（增、删、改、查）沙盒目录文件
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dataPath = [[self docPath] stringByAppendingPathComponent:@"Datas"];
    
    // 使用NSFileManager创建目录
    BOOL isCrate = [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil];
    if (isCrate) {
        NSLog(@"创建成功");
    }else{
        NSLog(@"创建失败");
    }
}

#pragma mark - 创建文件并写入数据

-(void)createFile{
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self docPath] stringByAppendingPathComponent:@"Datas/info.png" ];
    
    UIImage *image = [UIImage imageNamed:@"足球"];
    NSData *imageData = UIImagePNGRepresentation(image);
    
    // 创建文件
    BOOL isCrate = [fileManager createFileAtPath:filePath contents:imageData attributes:nil];
    
    if (isCrate) {
        NSLog(@"创建成功");
    }else{
        NSLog(@"创建失败");
    }
}

#pragma mark -根据指导的路径移除文件、目录
-(void)removeFile{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self docPath] stringByAppendingPathComponent:@"Datas/info.png"];
    
    // 移除文件
    BOOL isRemove = [fileManager removeItemAtPath:filePath error:nil];
    
    if (isRemove) {
        NSLog(@"移除成功");
    }else{
        NSLog(@"移除失败");
    }
}

#pragma mark - 移动文件

-(void)moveFile{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *filePath = [[self docPath] stringByAppendingPathComponent:@"Datas/info.png"];
    NSString *toPath = [[self libPath] stringByAppendingPathComponent:@"足球.png"];
    
    BOOL moveFile = [fileManager moveItemAtPath:filePath toPath:toPath error:nil];
    //移动文件
    
    if (moveFile) {
        NSLog(@"移动成功");
    }else{
        NSLog(@"移动失败");
    }
    
}

-(NSString *)docPath{
    
    return  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
}
-(NSString *)libPath{
    return  [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject];
    
}

@end
