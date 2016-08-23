//
//  main.m
//  Block变量
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        int value = 3;
        int (^block)(int x,int y) = ^(int x,int y){
            return (x+y) *value;
        };
        NSLog(@"%d",block(2,3));
        
        // block内部要对局部变量修改要使用 __block关键字修饰
        __block int a = 3;
        
        void (^aBlock)() =^(){
            
            a = 5;
        };
        aBlock();
        NSLog(@"%d",a);
         // block内使用局部变量会对局部变量拷贝一份使用，也就是说block中使用的变量和外面的变量不再是同一个了。
        int v = 100;
        void (^vBlock)() = ^(){
            
            NSLog(@"%d",v);
        };
        v = 200;
        vBlock();
        
        
        NSLog(@"%d",v);
        
         // 使用__block修饰后就不会进行拷贝了，内部和外部都是同一个
        __block int n = 100;
        void (^nBlock)() = ^(){
            
            NSLog(@"%d",n);
        };
        n = 200;
        nBlock();
        
        
        NSLog(@"%d",n);
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
