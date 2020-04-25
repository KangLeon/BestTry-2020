//
//  ViewController.m
//  SkeletonViewOC
//
//  Created by JY on 2020/4/24.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "GradientTableViewCell.h"

static NSString *cell_reuse_gradient=@"cell_reuse_gradient";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addUI];
}

#pragma mark -- 添加UI
-(void)addUI{
    [self.view addSubview:self.tableView];
    
    [self.view updateConstraintsIfNeeded];
}
#pragma mark -- 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] init];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
        [_tableView registerClass:[GradientTableViewCell class] forCellReuseIdentifier:cell_reuse_gradient];
    }
    return _tableView;
}
#pragma mark -- 代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GradientTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cell_reuse_gradient];
    if (!cell) {
        cell=[[GradientTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_reuse_gradient];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
#pragma mark -- taget action

#pragma mark -- 布局
-(void)updateViewConstraints{
    [super updateViewConstraints];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}
#pragma mark -- 网络请求

#pragma mark -- 工具方法

#pragma mark -- 生命周期方法

-(void)addGradientLayer{
    //
    //    //设置颜色值
    //    UIColor *_inputColor0 = [UIColor redColor];
    //    UIColor *_inputColor1 = [UIColor orangeColor];
    //    UIColor *_inputColor2 = [UIColor yellowColor];
    //    //1.创建layer
    //    CAGradientLayer *redLayer2 = [CAGradientLayer new];
    //    //2.可以添加多种颜色，这里只设置两种颜色
    //     redLayer2.colors = @[(__bridge id)_inputColor0.CGColor, (__bridge id)_inputColor1.CGColor,(__bridge id)_inputColor2.CGColor];
    //    //3.设置渐变颜色方向，左上点为(0,0), 右下点为(0,1)
    //    redLayer2.startPoint = CGPointMake(0, 0);
    //    redLayer2.endPoint = CGPointMake(0, 1);
    //    redLayer2.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400);
    //    //4.将layer添加到视图上
    //    [self.view.layer addSublayer:redLayer2];
}

@end
