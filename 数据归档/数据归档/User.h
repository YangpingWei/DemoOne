//
//  User.h
//  数据归档
//
//  Created by tens04 on 16/8/30.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

@end
