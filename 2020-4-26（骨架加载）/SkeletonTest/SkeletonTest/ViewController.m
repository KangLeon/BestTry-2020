//
//  ViewController.m
//  SkeletonTest
//
//  Created by JY on 2020/4/25.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "GradientTableViewCell.h"
#import <TABAnimated.h>

static NSString *cell_reuse_gradient=@"cell_reuse_gradient";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSArray *data_array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addUI];
    [self.tableView tab_startAnimation];
    [self requestData];
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
        
        _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:[GradientTableViewCell class] cellHeight:200];
        _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;

    }
    return _tableView;
}
#pragma mark -- 代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data_array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GradientTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cell_reuse_gradient];
    if (!cell) {
        cell=[[GradientTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_reuse_gradient];
    }
    
    NSDictionary *dic=[self.data_array objectAtIndex:indexPath.row];
    
    [cell setContentWithTitle:[dic objectForKey:@"title"] andDetail:[dic objectForKey:@"detail"] andIcon:[dic objectForKey:@"icon"]];
    
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
-(void)requestData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.data_array=@[@{@"title":@"我今天在飞机上，我要去上海了",@"detail":@"上海是我最喜欢的地方，我的女朋友是上海人，我要在上海买房子了",
                            @"icon":@"IMG_2769"
        },@{@"title":@"我今天在飞机上，我要去上海了",@"detail":@"上海是我最喜欢的地方，我的女朋友是上海人，我要在上海买房子了",
                            @"icon":@"IMG_2769"
        },@{@"title":@"我今天在飞机上，我要去上海了",@"detail":@"上海是我最喜欢的地方，我的女朋友是上海人，我要在上海买房子了",
                            @"icon":@"IMG_2769"
        },@{@"title":@"我今天在飞机上，我要去上海了",@"detail":@"上海是我最喜欢的地方，我的女朋友是上海人，我要在上海买房子了",
                            @"icon":@"IMG_2769"
        },@{@"title":@"我今天在飞机上，我要去上海了",@"detail":@"上海是我最喜欢的地方，我的女朋友是上海人，我要在上海买房子了",
                            @"icon":@"IMG_2769"
        },@{@"title":@"我今天在飞机上，我要去上海了",@"detail":@"上海是我最喜欢的地方，我的女朋友是上海人，我要在上海买房子了",
                            @"icon":@"IMG_2769"
        },@{@"title":@"我今天在飞机上，我要去上海了",@"detail":@"上海是我最喜欢的地方，我的女朋友是上海人，我要在上海买房子了",
                            @"icon":@"IMG_2769"
        },@{@"title":@"我今天在飞机上，我要去上海了",@"detail":@"上海是我最喜欢的地方，我的女朋友是上海人，我要在上海买房子了",
                            @"icon":@"IMG_2769"
        },];
        
        [self.tableView reloadData];
        [self.tableView tab_endAnimation];
    });
}
#pragma mark -- 工具方法

#pragma mark -- 生命周期方法


@end
