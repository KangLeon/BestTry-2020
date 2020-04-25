//
//  ViewController.m
//  TextInputDemo
//
//  Created by JY on 2020/4/15.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"
#import "ValidCodeTextField.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *validCode_array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addUI];
}

#pragma mark -- 添加UI
-(void)addUI{
    for (NSInteger i=0; i<6; i++) {
        ValidCodeTextField *textField=[[ValidCodeTextField alloc] initWithFrame:<#(CGRect)#>];
        
    }
}
#pragma mark -- 懒加载

#pragma mark -- 代理

#pragma mark -- taget action

#pragma mark -- 布局

#pragma mark -- 工具方法

@end
