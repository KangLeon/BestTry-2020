//
//  GirlView.m
//  LookSomeBody
//
//  Created by JY on 2020/5/1.
//  Copyright © 2020 JY. All rights reserved.
//

#import "GirlView.h"

@interface GirlView ()
@property(nonatomic,strong)UIImageView *avatar_imageView;
@property(nonatomic,strong)UIView *mask_view;
@property(nonatomic,strong)UIButton *like_button;
@property(nonatomic,strong)UIButton *dislike_button;
@property(nonatomic,strong)UIView *backBar_view;
@property(nonatomic,strong)UILabel *title_label;
@property(nonatomic,strong)UILabel *sex_label;
@property(nonatomic,strong)UILabel *info_label;
@property(nonatomic,strong)UILabel *descri_label;
@end

@implementation GirlView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self addUI];
    }
    return self;
}
#pragma mark -- 添加UI
-(void)addUI{
    [self addSubview:self.avatar_imageView];
    [self addSubview:self.like_button];
    [self addSubview:self.dislike_button];
    [self addSubview:self.title_label];
    [self addSubview:self.backBar_view];
    [self addSubview:self.sex_label];
    [self addSubview:self.info_label];
    [self addSubview:self.descri_label];
    [self addSubview:self.mask_view];
    
    [self updateConstraintsIfNeeded];
}
#pragma mark -- 懒加载
-(UIImageView *)avatar_imageView{
    if (!_avatar_imageView) {
        _avatar_imageView=[[UIImageView alloc] init];
    }
    return _avatar_imageView;
}
-(UIView *)maskView{
    if (!_mask_view) {
        _mask_view=[[UIView alloc] init];
        _mask_view.backgroundColor=[UIColor blackColor];
        _mask_view.alpha=0.0;
    }
    return _mask_view;
}
-(UIButton *)like_button{
    if (!_like_button) {
        _like_button=[[UIButton alloc] init];
        _like_button
    }
    return _like_button;
}
#pragma mark -- 代理

#pragma mark -- taget action

#pragma mark -- 布局

#pragma mark -- 网络请求

#pragma mark -- 工具方法

#pragma mark -- 生命周期方法

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
