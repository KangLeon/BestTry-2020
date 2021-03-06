//
//  PersonModel.h
//  RuntimeArchive
//
//  Created by 吉腾蛟 on 2020/2/22.
//  Copyright © 2020 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonModel : NSObject<NSSecureCoding>
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSNumber *age;
@end

NS_ASSUME_NONNULL_END
