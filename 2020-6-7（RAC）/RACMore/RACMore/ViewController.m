//
//  ViewController.m
//  RACMore
//
//  Created by JY on 2020/5/24.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "KFC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self demo1];
    [self demo2];
    [self demo3];
}
-(void)demo1{
    //1.元组
    RACTuple *tuple=[RACTuple tupleWithObjectsFromArray:@[@"我是你爸爸"]];
    NSString *str=tuple[0];
    NSLog(@"%@",str);
}
-(void)demo2{
    //2.RACSequence:用于代替NSArray，NSDictionary，可以使用快速的遍历
    //最常见的应用场景：字典转模型
    //数组
    NSArray *arr=@[@"abc",@"bbb",@123];
    //RAC集合
    RACSequence *sequence=arr.rac_sequence;
    //遍历
    RACSignal *signal=sequence.signal;
    //订阅信号
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    //另一种更简单的写法
    [arr.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}
-(void)demo3{
    NSDictionary *dict=@{@"name":@"hank",@"age":@"18"};
    //字典转集合
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *  _Nullable x) {
//        NSString *key=x[0];
//        NSString *value=x[1];
//        NSLog(@"%@%@",key,value);
        
        //RACTupleUnpack:用来解析元组
        //宏里面的参数，传需要解析出来的变量名称
        //=右边，放需要解析的元组
        RACTupleUnpack(NSString *key,NSString *value) = x;
        NSLog(@"%@ : %@",key,value);
    }];
}
-(void)demo4{
    //解析plist文件
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"kfc.plist" ofType:nil];
    NSArray *dictArr=[NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *arr=[NSMutableArray array];
    
    //订阅信号
    [dictArr.rac_sequence.signal subscribeNext:^(NSDictionary *  _Nullable x) {
        KFC *kfc=[KFC kfcWithDict:x];
        [arr addObject:kfc];
    }];
    
    //更加爽的用法
    NSArray *arr2=[[dictArr.rac_sequence.signal map:^id _Nullable(NSDictionary *  _Nullable value) {
        //返回模型
        return [KFC kfcWithDict:value];
    }] toArray];
}

@end
