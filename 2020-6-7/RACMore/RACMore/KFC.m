//
//  KFC.m
//  RACMore
//
//  Created by JY on 2020/6/2.
//  Copyright © 2020 JY. All rights reserved.
//

#import "KFC.h"

@implementation KFC

+ (instancetype)kfcWithDict:(NSDictionary *)dict{
    KFC *kfc=[[KFC alloc] init];
    [kfc setValuesForKeysWithDictionary:dict];
    return kfc;
}

@end
