//
//  UserInfo.h
//  SQLite
//
//  Created by tens04 on 16/8/31.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userSex;
@property (nonatomic, assign) int userAge;

@end
