//
//  ViewController.m
//  时钟Demo
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens04.27. All rights reserved.
//

//一秒钟秒针转多少度
#define PreSecondA 6

//一分钟分针转多少度
#define PreMinuteA 6

//一小时时针转多少度
#define PreHourA 30

//每分钟时针转多少度
#define PreHourMinute 0.5

//每秒钟分针转多少度
#define PreMinuteSecond 0.1

#define angle2raditon(a) ((a) / 180.0 * M_PI)

#define BGCENTER _bgLayer.bounds.size.width

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) CALayer *bgLayer;
@property (nonatomic,strong) CALayer *hourLayer;
@property (nonatomic,strong) CALayer *minLayer;
@property (nonatomic,strong) CALayer *secLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    [self bgView];
    [self hourHand];
    [self minuteHand];
    [self secondHand];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    
   [self timeChange];
}

-(void)bgView{
    _bgLayer = [CALayer layer];
    _bgLayer.bounds = CGRectMake(0, 0, 300, 300);
    _bgLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"dial"].CGImage);
    _bgLayer.position = self.view.center;

    
    [self.view.layer addSublayer:self.bgLayer];

}

-(void)hourHand{
    
    _hourLayer = [CALayer layer];
    _hourLayer.bounds = CGRectMake(0, 0,12, 90);
    _hourLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hourHand"].CGImage);
    _hourLayer.anchorPoint = CGPointMake(0.5, 1);
    _hourLayer.position = CGPointMake(BGCENTER/2,BGCENTER/2);
    [_bgLayer addSublayer:self.hourLayer];
}
-(void)minuteHand{
    _minLayer = [CALayer layer];
    _minLayer.bounds = CGRectMake(0, 0, 12, 110);
    _minLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"minuteHand"].CGImage);
    _minLayer.anchorPoint = CGPointMake(0.5, 1);
    _minLayer.position = CGPointMake(BGCENTER/2,BGCENTER/2);
//    _minLayer.transform = CATransform3DRotate(_minLayer.transform, M_PI_4, 0, 0, 1);
    [_bgLayer addSublayer:self.minLayer];
    
    
}
-(void)secondHand{
    _secLayer = [CALayer layer];
    _secLayer.bounds = CGRectMake(0, 0, 10, 125);
    _secLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"secondHand"].CGImage);
    _secLayer.anchorPoint = CGPointMake(0.5, 1);
    _secLayer.position = CGPointMake(BGCENTER/2,BGCENTER/2);
//    _secLayer.transform = CATransform3DRotate(_minLayer.transform, M_PI_4, 0, 0, 1);
    [_bgLayer addSublayer:self.secLayer];
    
}

- (void)timeChange {
    
    //获取当前系统时间
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour  fromDate:[NSDate date]];
    
    //获取秒
    NSInteger second = cmp.second;
    
    //获取分
    NSInteger minute = cmp.minute;
    
    //获取小时
    NSInteger hour = cmp.hour;
    
    //计算秒针转多少度
    CGFloat secondA = second * PreSecondA;
    
    //计算分针转多少度
    CGFloat minuteA = minute * PreMinuteA + second * PreMinuteSecond;
    
    //计算时针转多少度
    CGFloat hourA = hour * PreHourA + minute * PreHourMinute;
    
    //旋转秒针
    _secLayer.transform = CATransform3DMakeRotation(angle2raditon(secondA), 0, 0, 1);
    
    //旋转分针
    _minLayer.transform = CATransform3DMakeRotation(angle2raditon(minuteA), 0, 0, 1);
    
    //旋转时针
    _hourLayer.transform = CATransform3DMakeRotation(angle2raditon(hourA), 0, 0, 1);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
