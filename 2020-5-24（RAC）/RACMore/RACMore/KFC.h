//
//  KFC.h
//  RACMore
//
//  Created by JY on 2020/6/2.
//  Copyright © 2020 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KFC : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;

+(instancetype)kfcWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
