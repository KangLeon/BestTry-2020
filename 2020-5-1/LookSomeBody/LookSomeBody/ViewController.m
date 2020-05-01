//
//  ViewController.m
//  LookSomeBody
//
//  Created by JY on 2020/5/1.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"
#import "PanGroupView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property(nonatomic,strong)PanGroupView *panGroup_view;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addUI];
}
#pragma mark -- 添加UI
-(void)addUI{
    [self.view addSubview:self.panGroup_view];
}
#pragma mark -- 懒加载
-(PanGroupView *)panGroup_view{
    if (!_panGroup_view) {
        _panGroup_view=[[PanGroupView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    }
    return _panGroup_view;
}
#pragma mark -- 代理

#pragma mark -- taget action

#pragma mark -- 布局

#pragma mark -- 网络请求

#pragma mark -- 工具方法

#pragma mark -- 生命周期方法

@end
