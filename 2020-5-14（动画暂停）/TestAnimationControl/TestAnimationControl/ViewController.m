//
//  ViewController.m
//  TestAnimationControl
//
//  Created by JY on 2020/5/14.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIButton *dislike_button;

@property(nonatomic,strong)CAShapeLayer *outLayer;
@property(nonatomic,strong)CAShapeLayer *progressLayer;

@property(nonatomic,strong)UIButton *control_button;

@property(nonatomic,assign)BOOL isClose;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dislike_button=[[UIButton alloc] init];
    self.dislike_button.backgroundColor=[UIColor grayColor];
    self.dislike_button.frame=CGRectMake(50, 200, 100, 100);
    self.dislike_button.layer.cornerRadius=50;
    [self.dislike_button setTitle:@"画圆" forState:UIControlStateNormal];
    [self.view addSubview:self.dislike_button];
    [self.dislike_button addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.control_button=[[UIButton alloc] init];
    self.control_button.backgroundColor=[UIColor grayColor];
    self.control_button.frame=CGRectMake(100, 500, 50, 100);
    [self.control_button setTitle:@"控制" forState:UIControlStateNormal];
    [self.view addSubview:self.control_button];
    [self.control_button addTarget:self action:@selector(controlAction) forControlEvents:UIControlEventTouchUpInside];
    
    //灰色背景圆
    self.outLayer = [CAShapeLayer layer];
    CGRect rect = {2.0 / 2, 2.0 / 2,
    self.dislike_button.frame.size.width - 2.0, self.dislike_button.frame.size.height - 2.0};
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    self.outLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    self.outLayer.lineWidth = 2.0;
    self.outLayer.fillColor =  [UIColor clearColor].CGColor;
    self.outLayer.lineCap = kCALineCapRound;
    self.outLayer.path = path.CGPath;
    [self.dislike_button.layer addSublayer:self.outLayer];
    
    //蓝色进度圆
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = [UIColor blueColor].CGColor;
    self.progressLayer.lineWidth = 2.0;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.path = path.CGPath;
    self.progressLayer.strokeStart =  0.0 / 100.0;
    self.progressLayer.strokeEnd =  0.0 / 100.0;
    [self.dislike_button.layer addSublayer:self.progressLayer];
}

-(void)tapAction{
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:10.0];
    self.progressLayer.strokeEnd =  100.0 / 100.0;
    [CATransaction commit];
}

-(void)controlAction{
    if (self.isClose) {
        [self resumeAnimation];
    }else{
        [self pauseAnimation];
    }
    
    self.isClose=!self.isClose;
}

- (void)pauseAnimation {
    CFTimeInterval pauseTime = [self.progressLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    //2.设置动画的时间偏移量，指定时间偏移量的目的是让动画定格在该时间点的位置
    self.progressLayer.timeOffset = pauseTime;
    //3.将动画的运行速度设置为0， 默认的运行速度是1.0
    self.progressLayer.speed = 0.0;
}

- (void)resumeAnimation {
    //1.将动画的时间偏移量作为暂停的时间点
    CFTimeInterval pauseTime = self.progressLayer.timeOffset;
    //2.计算出开始时间
    CFTimeInterval begin = CACurrentMediaTime() - pauseTime;

    [self.progressLayer setTimeOffset:0];
    [self.progressLayer setBeginTime:begin];
    self.progressLayer.speed = 1.0;
}

@end
