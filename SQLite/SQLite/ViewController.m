//
//  ViewController.m
//  SQLite
//
//  Created by tens04 on 16/8/31.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "UserInfo.h"

@interface ViewController (){
    
    sqlite3 *_sqliteDB; // 创建数据库结构体指针
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1、导入系统库：libsqlite3.dylib ，路径：/usr/lib/libsqlite3.dylib
    
    // 2、#import <sqlite3.h>
    
    // 3、设置数据库文件的保存路径
    NSString *path  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataPath = [path stringByAppendingPathComponent:@"data.sqlite"];
    NSLog(@"%@",dataPath);
    
    // 4、创建或者打开数据库，没有时创建，已经有了就直接打开，
    //参数一：数据库文件的保存路径，
    //参数二：sqlite3 结构体指针
    
    int result = sqlite3_open([dataPath UTF8String], &_sqliteDB);
    
    if (result == SQLITE_OK) {
        NSLog(@"创建或打开成功");
    }else{
        NSLog(@"创建或打开失败");
    }
    
//   [self createDatalist];
//    [self inserteData];
//    [self addColumn];
   // [self updataValues];
    [self deleteDate];
    
    //使用完后要关闭数据库，释放资源。
    sqlite3_close(_sqliteDB);

}

#pragma  mark-创建数据库表

-(void)createDatalist{
    
    NSString *sql = @"CREATE TABLE IF NOT EXISTS User ('UserName' TEXT,'UserAge'INTEGER,'UserID'TEXT)";
    
    // sqlite3_exec() 执行 sql 函数
    int result = sqlite3_exec(_sqliteDB, [sql UTF8String], NULL, NULL, NULL);
    if (result ==SQLITE_OK) {
        NSLog(@"创建数据表成功");
    }else{
        
        NSLog(@"创建数据表失败");
    }
}

#pragma  mark- 数据库表中插入数据

-(void)inserteData{
    
    NSString *UserName = @"张大";
    NSString *UserID = @"10001";
    int  age = 23;
    
    // sqlite3_exec() 执行 sql 函数
    NSString *sql =[NSString stringWithFormat:  @"INSERT INTO User('UserName','UserAge','UserID') VALUES('%@',%d,'%@')",UserName,age,UserID];
    int result = sqlite3_exec(_sqliteDB, [sql UTF8String], NULL , NULL, NULL);
    if (result ==SQLITE_OK) {
        NSLog(@"插入成功");
    }else{
        
        NSLog(@"插入失败");
    }
}

#pragma  mark -添加字段 （列）
-(void)addColumn{
    
    NSString *text =@"UserSex TEXT" ;
    NSString *sql = [NSString stringWithFormat: @"ALTER TABLE User ADD COLUMN %@",text];
    
    int result  = sqlite3_exec(_sqliteDB, [sql UTF8String], NULL, NULL, NULL) ;
    
    if (result == SQLITE_OK) {
        NSLog(@"添加成功");
    }else{
        
        NSLog(@"添加失败");
    }
}

#pragma mark -更新数据

-(void)updataValues{
    
    NSString *userName = @"张大";
    NSString *sql = [NSString stringWithFormat: @"UPDATE User SET UserSex = '' WHERE UserName = '%@'",userName ];
    
    int result = sqlite3_exec(_sqliteDB, [sql UTF8String], NULL, NULL, NULL);
    if (result ==SQLITE_OK) {
        NSLog(@"更新成功");
    }else{
        
        NSLog(@"更新失败");
    }
    
}

#pragma mark - 删除数据

-(void)deleteDate{
    
    NSString *delete = @"张大";
    
    NSString *sql = [NSString stringWithFormat: @"DELETE FROM User WHERE UerName = '%@'",delete];
    int result = sqlite3_exec(_sqliteDB, [sql UTF8String], NULL, NULL, NULL);
    if (result ==SQLITE_OK) {
        NSLog(@"删除成功");
    } else{
        NSLog(@"删除失败");
    }
    
}

#pragma  mark -查询数据

-(void)selectData{
    
    //1、创建sql语句结构体指针(可以理解为sql语句对象)
    sqlite3_stmt *_stmt;
    
    NSString *sql = @"SELECT *FROM User WHERE UserName LIKE '张%'";
    int result = sqlite3_prepare_v2(_sqliteDB, [sql UTF8String], -1, &_stmt, NULL);
    
    if (result == SQLITE_OK) {
        NSLog( @"sql语句编译通过");
        
        // 3、执行查询语句，== SQLITE_ROW 表示还有下一条数据
        while (sqlite3_step(_stmt) == SQLITE_ROW) {
            
            /* 4、获取每一行数据对应的字段(列)
             sqlite3_column_text() 对应 TEXT 类型
             sqlite3_column_int（） 对应 INTERER类型
             */
            
            char *userID = (char *) sqlite3_column_text(_stmt, 0);
            char *userName = (char *) sqlite3_column_text(_stmt, 1);
            char *userSex = (char *) sqlite3_column_text(_stmt, 2);
            int userAge = sqlite3_column_int(_stmt, 3);
            
            NSString *userID_str = [NSString stringWithUTF8String:userID];
            NSString *userName_str = [NSString stringWithUTF8String:userName];
            NSString *userSex_str = [NSString stringWithUTF8String:userSex];
            
            // 把查询到的数据保存为 model 对象
            
            UserInfo *user = [UserInfo alloc];
            user.userName = userName_str;
            user.userSex = userSex_str;
            user.userAge = userAge;
            user.userID = userID_str;
            
            NSLog(@"%@, %@, %d,%@",userID_str,userName_str,userAge,userSex_str);
        }
        
    }else{
        NSLog(@"失败");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
