//
//  SencondViewController.m
//  NotificationClose
//
//  Created by 吉腾蛟 on 2020/8/9.
//  Copyright © 2020 jiyoung. All rights reserved.
//

#import "SencondViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface SencondViewController ()

@end

@implementation SencondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"test" object:nil] map:^id _Nullable(NSNotification * _Nullable value) {
        return value.userInfo;
    }] distinctUntilChanged] subscribeNext:^(NSDictionary *  _Nullable x) {
        NSLog(@"%@",[x valueForKey:@"id"]);
    }];
    RACSignal *signal=[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"test" object:nil];
    [signal subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"监听到通知");
    }];
    [signal subscribeCompleted:^{
      NSLog(@"%@", @"通知被移除");
    }];
}
- (IBAction)sendNotifications:(id)sender {
    static NSInteger count=0;
    NSDictionary *dic=@{@"id":@(count+1)};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:nil userInfo:dic];
}
- (IBAction)disMissViewController:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (void)dealloc
{
    NSLog(@"销毁了");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
