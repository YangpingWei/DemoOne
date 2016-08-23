//
//  TSButton.h
//  Block 触发事件
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HandBlock)();
@interface TSButton : UIButton

-(void)buttonHandle:(HandBlock)handle;

@end
