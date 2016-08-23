//
//  TSButton.m
//  UIPO
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "TSButton.h"
@interface TSButton(){
    
    HandBlock _block;
}
@end
@implementation TSButton

-(void)buttonHandle:(HandBlock)handle{
    
    _block = handle;
    [self addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)buttonAction{
    if (_block) {
        _block();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
