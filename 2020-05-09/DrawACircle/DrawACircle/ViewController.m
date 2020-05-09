//
//  ViewController.m
//  DrawACircle
//
//  Created by JY on 2020/5/9.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIButton *dislike_button;

@property(nonatomic,strong)CAShapeLayer *outLayer;
@property(nonatomic,strong)CAShapeLayer *progressLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dislike_button=[[UIButton alloc] init];
    self.dislike_button.backgroundColor=[UIColor grayColor];
    self.dislike_button.frame=CGRectMake(50, 200, 100, 100);
    self.dislike_button.layer.cornerRadius=50;
    [self.view addSubview:self.dislike_button];
    [self.dislike_button addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    
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



@end
