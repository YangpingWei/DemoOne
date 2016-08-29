//
//  BazierLine.m
//  绘图
//
//  Created by tens04 on 16/8/29.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

#import "BazierLine.h"

@implementation BazierLine


-(void)drawRect:(CGRect)rect{
    
    [self drawline];
    [self drawGraphics];
}

-(void)drawline{
    
    UIBezierPath *line = [UIBezierPath bezierPath];
    
    [line moveToPoint:CGPointMake(30, 50)];
    [line addLineToPoint:CGPointMake(90, 70)];
    [line addLineToPoint:CGPointMake(30, 200)];
    [line closePath];// 闭合路径
    [[UIColor redColor] setStroke];
    [line stroke];
    
    /*
     CGFloat dashs[] = {2,10,2};
     // 5、设置虚线： dashs: 虚线的虚实线的长度，count: 虚线的组成段数， phase: 设置虚线的起始位置
     [path setLineDash:dashs count:3 phase:0];
     */
    
}

-(void)drawGraphics{
    
    CGRect rec = CGRectMake(20, 260, 220, 200);
    //矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rec];
    [[UIColor redColor] setStroke];
    [path stroke];
    //圆角矩形
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:rec cornerRadius:50];
    [[UIColor redColor] setStroke];
    [path1 stroke];
    //内切椭圆
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:rec];
    [[UIColor redColor] setStroke];
    [path2 stroke];
}
-(void)drawArc{
    
    /**
     Center: 圆心
     radius: 半径
     startAngle: 起始弧度
     endAngle: 终点弧度
     clockwise:是否顺时针
     **/
    CGPoint center = self.center;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:90 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    
   //线条宽度
    path.lineWidth = 4;
    [[UIColor blueColor] setStroke];
    [path stroke];
    
    
}

-(void)drawBezierLine{
    UIBezierPath  *path = [UIBezierPath bezierPath];
    CGPoint begainPoint = CGPointMake(0, 300);
    CGPoint endPoint = CGPointMake(100, 300);
    CGPoint controlPoint = CGPointMake(50, 200);
    [path moveToPoint:begainPoint];
    
    [[UIColor redColor] setStroke];
    path.lineWidth = 5;
    // 1、一个控制点的贝塞尔曲线
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    
    
    CGPoint beginPoint_1 = CGPointMake(70, 300);
    CGPoint endPoint_1 = CGPointMake(170, 300);
    CGPoint controlPoint_1 = CGPointMake(95, 400);
    CGPoint controlPoint_2 = CGPointMake(145, 100);
    
    [path moveToPoint:beginPoint_1];
    // 2、两个控制点的贝塞尔曲线
    [path addCurveToPoint:endPoint_1 controlPoint1:controlPoint_1 controlPoint2:controlPoint_2];

    
    
   
    UIBezierPath *subPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(170, 300, 200, 200)];
     // 3、拼接两条路径
    [path appendPath:subPath];
    
    // 4、移除所有的路径
    // [path removeAllPoints];
    
    [path stroke];
    
}

@end
