//
//  ViewController.m
//  Block 内存管理
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "ViewController.h"

typedef void(^MyBlock)();


@interface ViewController () {
    
    NSObject *_hObject;
}

@property (nonatomic, retain) NSObject *pObject;

@property (nonatomic, copy)MyBlock myblock;

@end

static NSObject *sObject;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *object = [[NSObject alloc] init];
    NSLog(@"object:%ld",[object retainCount]);
    
    _hObject = [[NSObject alloc] init];
    NSLog(@"_hObject: %ld",[_hObject retainCount]);
    
    _pObject = [[NSObject alloc] init];
    NSLog(@"pObject: %ld",[_pObject retainCount]);
    
    //    sObject = [[NSObject alloc] init];
    //    NSLog(@"sObject: %ld",[sObject retainCount]);
    
    self.myblock = ^{
        
        NSLog(@"object:%ld",[object retainCount]); // 内部使用局部的对象时，会对这个对象引用计数 +1
        
        NSLog(@"_hObject: %ld",[_hObject retainCount]); // 内部使用全局的对象，全局变量引用计数不会 +1,但是当前对象(self)的引用计数 +1
        
        NSLog(@"pObject: %ld",[_pObject retainCount]); // 内部使用全局的对象，全局变量引用计数不会 +1,但是当前对象(self)的引用计数 +1
        
        //         NSLog(@"sObject: %ld",[sObject retainCount]);
        
    };
    
    self.myblock();
    
    NSLog(@"self: %ld",[self retainCount]);
}


@end


