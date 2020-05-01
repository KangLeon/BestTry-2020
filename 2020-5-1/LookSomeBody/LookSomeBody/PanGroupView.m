//
//  PanGroupView.m
//  LookSomeBody
//
//  Created by JY on 2020/5/1.
//  Copyright © 2020 JY. All rights reserved.
//

#import "PanGroupView.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

#define ImageWidth 334
#define ImageHeight 500
#define ImageScale 0.1 //每张图片初始化缩小尺寸
#define ImageSpace 10 //每张图片底部距离

#define Animation_time 0.45

@interface PanGroupView ()
@property(nonatomic,strong)NSMutableArray *data_array;//存放照片数据的池

@property(nonatomic,strong)NSMutableArray *picture_array;//用来放照片view的池

@property(nonatomic,assign)NSInteger current_index;

@property (nonatomic, strong) UIImageView *topCard; //最上面
@property (nonatomic, strong) UIImageView *bottomCard; //最底部
@end

@implementation PanGroupView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addUI];
    }
    return self;
}
#pragma mark -- 添加UI
-(void)addUI{
    self.data_array=[NSMutableArray arrayWithObjects:@"图片1.png",@"图片2.png",@"图片3.png",@"图片4.png", nil];
    
    //添加视图
    for (int i=0; i<4; i++) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ImageWidth, ImageHeight)];
        imageView.contentMode=UIViewContentModeScaleAspectFill;
        
        UIImage *image=[UIImage imageNamed:self.data_array[i]];
        imageView.image=image;
        
        imageView.tag = 100 + i;
        
        int index = i;
        if (index == 3) {
            index = 2;
        }
        
        imageView.center = CGPointMake(ScreenW/2, ScreenH/2 + (ImageHeight*ImageScale*index/2) + ImageSpace*index);
        imageView.transform = CGAffineTransformMakeScale(1-ImageScale*index, 1-ImageScale*index);
        
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHandle:)];
        [imageView addGestureRecognizer:pan];
        
        [self addSubview:imageView];
        [self sendSubviewToBack:imageView];
        
        [self.picture_array addObject:imageView];
        
        imageView.userInteractionEnabled = NO;
        if (i == 0) {
            imageView.userInteractionEnabled = YES;
            self.topCard = imageView;
        }else if (i == 3){
            self.bottomCard = imageView;
        }
    }
    
    //初始化最上面图片的索引
    
    
    //喜欢和不喜欢按钮
    UIButton *like_button=[[UIButton alloc] initWithFrame:CGRectMake(100, 800, 50, 50)];
    like_button.backgroundColor=[UIColor clearColor];
    [like_button setImage:[UIImage imageNamed:@"喜欢"] forState:UIControlStateNormal];
    [like_button addTarget:self action:@selector(likeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:like_button];
    
    UIButton *dislike_button=[[UIButton alloc] initWithFrame:CGRectMake(250, 800, 50, 50)];
    dislike_button.backgroundColor=[UIColor clearColor];
    [dislike_button addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [dislike_button setImage:[UIImage imageNamed:@"不喜欢"] forState:UIControlStateNormal];
    [self addSubview:dislike_button];
}
#pragma mark -- 懒加载
-(NSMutableArray *)data_array{
    if (!_data_array) {
        _data_array=[NSMutableArray array];
    }
    return _data_array;
}
-(NSMutableArray *)picture_array{
    if (!_picture_array) {
        //池里面总共维护4个view就可以了
        _picture_array=[NSMutableArray arrayWithCapacity:4];
    }
    return _picture_array;
}
#pragma mark -- 代理

#pragma mark -- taget action
//返回，出现上张图片
- (void)cancelBtnClick:(UIButton *)sender {
    
    sender.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        //前摇
        self.topCard.center = CGPointMake(ScreenW/2 - 5, ScreenH/2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            self.topCard.center = CGPointMake(ImageWidth+ScreenW, ScreenH/2+50);
            self.topCard.transform = CGAffineTransformMakeRotation(M_PI_4/2);
            for (UIImageView *imageView in self.picture_array) {
                if (imageView.tag != 100 && imageView.tag != 103) {
                    NSInteger index = imageView.tag - 100;
                    imageView.center = CGPointMake(ScreenW/2, ScreenH/2
                                              + ImageHeight*index*ImageScale/2
                                              + ImageSpace*index //原始位置
                                              - ImageSpace
                                              - (ImageHeight*ImageScale*index/2)/index);

                    CGFloat scale = 1-index*ImageScale + ImageScale;
                    imageView.transform = CGAffineTransformMakeScale(scale, scale);
                }
            }
        }completion:^(BOOL finished) {
            sender.userInteractionEnabled = YES;
            [self cardRemove];
        }];
    }];
}

//喜欢
- (void)likeBtnClick:(UIButton *)sender {

    sender.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.1 animations:^{
        //前摇
        self.topCard.center = CGPointMake(ScreenW/2 + 5, ScreenH/2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            self.topCard.center = CGPointMake(-ImageWidth, ScreenH/2+50);
            self.topCard.transform = CGAffineTransformMakeRotation(-M_PI_4/2);
            for (UIImageView *imageView in self.picture_array) {
                if (imageView.tag != 100 && imageView.tag != 103) {
                    NSInteger index = imageView.tag - 100;
                    imageView.center = CGPointMake(ScreenW/2, ScreenH/2
                                              + ImageHeight*index*ImageScale/2
                                              + ImageSpace*index //原始位置
                                              - ImageSpace
                                              - (ImageHeight*ImageScale*index/2)/index);
                    CGFloat scale = 1-index*ImageScale + ImageScale;
                    imageView.transform = CGAffineTransformMakeScale(scale, scale);
                }
            }
        }completion:^(BOOL finished) {
            sender.userInteractionEnabled = YES;
            [self cardRemove];
        }];
    }];
}
-(void)panHandle:(UIPanGestureRecognizer *)pan{
    UIImageView *imageView = (UIImageView *)pan.view;

    if (pan.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始拖动");
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        NSLog(@"正在拖动");
        CGPoint transLcation = [pan translationInView:imageView];
        imageView.center = CGPointMake(imageView.center.x + transLcation.x, imageView.center.y + transLcation.y);
        CGFloat XOffPercent = (imageView.center.x-ScreenW/2.0)/(ScreenW/2.0);
        CGFloat rotation = M_PI_2/10*XOffPercent;
        imageView.transform = CGAffineTransformMakeRotation(rotation);
        [pan setTranslation:CGPointZero inView:imageView];

        [self animationBlowViewWithXOffPercent:fabs(XOffPercent)];
    }else if (pan.state == UIGestureRecognizerStateEnded) {
        NSLog(@"拖动结束");
        //视图在屏幕左侧移除
        if (imageView.center.x < ScreenW/2) {
            [UIView animateWithDuration:Animation_time animations:^{
                imageView.center = CGPointMake(-ScreenW/2, imageView.center.y);
            }];
        } else{//视图在屏幕右侧移除
            [UIView animateWithDuration:Animation_time animations:^{
                imageView.center = CGPointMake(ScreenW+ScreenW/2, imageView.center.y);
            }];
        }

        [self animationBlowViewWithXOffPercent:1];

        [self performSelector:@selector(cardRemove) withObject:imageView afterDelay:Animation_time];
    }
}
- (void)animationBlowViewWithXOffPercent:(CGFloat)XOffPercent {
    for (UIImageView *imageView in self.picture_array) {
        if (imageView != self.topCard && imageView.tag != 103) {
            NSInteger index = imageView.tag-100;
            imageView.center = CGPointMake(ScreenW/2,ScreenH/2
                                      + (ImageHeight*ImageScale*index/2)
                                      + ImageSpace*index  //上面3行是原始位置，下面2行是改变的大小
                                      - XOffPercent*ImageSpace
                                      - (ImageHeight*ImageScale*index/2)*XOffPercent/index);

            CGFloat scale = 1-ImageScale*index + XOffPercent*ImageScale;
            imageView.transform = CGAffineTransformMakeScale(scale, scale);
        }
    }
    
}
-(void)cardRemove{
    
    //滑动结束第一张和放到数组最后
    [self.picture_array removeObject:self.topCard];
    [self.picture_array addObject:self.topCard];

    //重新设置tag
    for (int i = 0 ; i < 4; i++) {
        UIView *card = self.picture_array[i];
        card.tag = 100+i;
    }
    
    //重置第一张和最后一张（第4）
    self.topCard.userInteractionEnabled = NO;
    self.topCard.center = CGPointMake(ScreenW/2, ScreenH/2 + (ImageHeight*ImageScale*2/2) + ImageSpace*2);
    self.topCard.transform = CGAffineTransformMakeScale(1-ImageScale*2, 1-ImageScale*2);
    [self sendSubviewToBack:self.topCard];

    self.bottomCard = self.topCard;

    UIImageView *currentCard = self.picture_array.firstObject;
    currentCard.userInteractionEnabled = YES;
    self.topCard = currentCard;
    
}
#pragma mark -- 布局

#pragma mark -- 网络请求

#pragma mark -- 工具方法

#pragma mark -- 生命周期方法


@end
