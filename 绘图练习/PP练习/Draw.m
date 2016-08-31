//
//  Draw.m
//  PP练习
//
//  Created by tens04 on 16/8/29.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "Draw.h"

#define SW [UIScreen mainScreen].bounds.size.width
@interface Draw(){
    
    NSTimer *time;
    
    
}



@end

@implementation Draw


-(void)drawRect:(CGRect)rect{
    
    [self drawWeather];
    [self drawShares];
    [self drawSin];
    [self drawArc];
    [self drawDownload];
    
    
    
}
-(void)drawWeather{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 50)];
    for (int i = 1; i < 8; i++) {

        NSInteger munOne = arc4random()%70+20;
      
            [path addLineToPoint:CGPointMake(50*i, munOne)];
    }
    
    [[UIColor orangeColor] setStroke];
    path.lineWidth = 5;
    [path stroke];
 
}

-(void)drawShares{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 200)];
    for (int i = 1; i < 40; i++) {
        
        NSInteger munOne = arc4random()%100+150;
            [path addLineToPoint:CGPointMake(10*i, munOne)];

    }
    [[UIColor redColor] setStroke];
    path.lineWidth = 2;
    [path stroke];
}
-(void)drawSin{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 300)];
    [path addLineToPoint:CGPointMake(350, 300)];
    
    [[UIColor whiteColor] setStroke];
    [path stroke];
    
    [path moveToPoint:CGPointMake(0, 300)];
    
   
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoint_1 = CGPointMake(150, 100);
    CGPoint controlPoint_2 = CGPointMake(150, 500);
    
    [path addCurveToPoint:endPoint controlPoint1:controlPoint_1 controlPoint2:controlPoint_2];
    [[UIColor whiteColor] setStroke];
    [path stroke];
}
-(void)drawArc{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 320, 200, 200)];
    [[UIColor whiteColor] setStroke];
    path.lineWidth = 0;
    [path stroke];
    UIBezierPath *arc_1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 420)  radius:100 startAngle:0 endAngle:M_PI/5 clockwise:YES];
    [arc_1 addLineToPoint:CGPointMake(100, 420)];
    [arc_1 closePath];
    [[UIColor redColor] setFill];
    [arc_1 fill];
    
    UIBezierPath *arc_2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 420)  radius:100 startAngle:M_PI/5 endAngle:M_PI/4 clockwise:YES];
    [arc_2 addLineToPoint:CGPointMake(100, 420)];
    [arc_2 closePath];
    [[UIColor grayColor] setFill];
    [arc_2 fill];
    
    
    UIBezierPath *arc_3 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 420)  radius:100 startAngle:M_PI/4 endAngle:M_PI/1.5 clockwise:YES];
    [arc_3 addLineToPoint:CGPointMake(100, 420)];
    [arc_3 closePath];
    [[UIColor purpleColor] setFill];
    [arc_3 fill];
    
    UIBezierPath *arc_4 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 420)  radius:100 startAngle:M_PI/1.5 endAngle:1.5*M_PI clockwise:YES];
    [arc_4 addLineToPoint:CGPointMake(100, 420)];
    [arc_4 closePath];
    [[UIColor whiteColor] setFill];
    [arc_4 fill];
    
    UIBezierPath *arc_5 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 420)  radius:100 startAngle:1.5*M_PI endAngle:2*M_PI clockwise:YES];
    [arc_5 addLineToPoint:CGPointMake(100, 420)];
    [arc_5 closePath];
    [[UIColor greenColor] setFill];
    [arc_5 fill];
}

-(void)drawDownload{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200, 400, 100, 100)];
    [[UIColor whiteColor] setStroke];
    [path stroke];
    
   
//    UIBezierPath *arc = [UIBezierPath bezierPathWithArcCenter:CGPointMake(250, 450)  radius:50 startAngle:1.5*M_PI endAngle:2*M_PI clockwise:YES];
//    [arc addLineToPoint:CGPointMake(250, 450)];
//    [arc closePath];
//    [[UIColor greenColor] setFill];
//    [arc fill];
    
    
}




@end
