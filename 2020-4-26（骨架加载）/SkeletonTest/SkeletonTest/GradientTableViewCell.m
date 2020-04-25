//
//  GradientTableViewCell.m
//  SkeletonViewOC
//
//  Created by JY on 2020/4/24.
//  Copyright © 2020 JY. All rights reserved.
//

#import "GradientTableViewCell.h"
#import <Masonry.h>

@interface GradientTableViewCell ()
@property(nonatomic,strong)UILabel *title_label;
@property(nonatomic,strong)UILabel *detail_label;
@property(nonatomic,strong)UIImageView *icon_imageView;
@end

@implementation GradientTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addUI];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}
#pragma mark -- 添加UI
-(void)addUI{
    [self.contentView addSubview:self.title_label];
    [self.contentView addSubview:self.detail_label];
    [self.contentView addSubview:self.icon_imageView];
    
    [self updateConstraintsIfNeeded];
}
#pragma mark -- 懒加载
-(UIImageView *)icon_imageView{
    if (!_icon_imageView) {
        _icon_imageView=[[UIImageView alloc] init];
        _icon_imageView.contentMode=UIViewContentModeScaleAspectFit;
    }
    return _icon_imageView;
}
-(UILabel *)title_label{
    if (!_title_label) {
        _title_label=[[UILabel alloc] init];
//        _title_label.text=@"今天我要去上海了！";
    }
    return _title_label;
}
-(UILabel *)detail_label{
    if (!_detail_label) {
        _detail_label=[[UILabel alloc] init];
//        _detail_label.text=@"上海是我最喜欢的城市，我要在上海买房，我的女朋友也是上海的";
        _detail_label.numberOfLines=0;
    }
    return _detail_label;
}
#pragma mark -- 代理

#pragma mark -- taget action

#pragma mark -- 布局
-(void)updateConstraints{
    [super updateConstraints];
    [self.icon_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(20);
        make.top.equalTo(self.mas_top).offset(20);
        make.bottom.equalTo(self.mas_bottom).offset(-20);
        make.width.mas_equalTo(100);
    }];
    [self.title_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon_imageView.mas_right).offset(20);
        make.top.equalTo(self.mas_top).offset(40);
        make.height.mas_equalTo(60);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    [self.detail_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon_imageView.mas_right).offset(20);
        make.top.equalTo(self.title_label.mas_bottom).offset(0);
        make.height.mas_equalTo(60);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
}
#pragma mark -- 网络请求

#pragma mark -- 工具方法
-(void)setContentWithTitle:(NSString *)title andDetail:(NSString *)detail andIcon:(NSString *)icon{
    self.title_label.text=title;
    self.detail_label.text=detail;
    self.icon_imageView.image=[UIImage imageNamed:icon];
}
#pragma mark -- 生命周期方法

@end
