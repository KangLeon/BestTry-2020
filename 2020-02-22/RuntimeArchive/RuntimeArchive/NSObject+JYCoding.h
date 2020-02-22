//
//  NSObject+JYCoding.h
//  RuntimeArchive
//
//  Created by 吉腾蛟 on 2020/2/22.
//  Copyright © 2020 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JYCoding)
-(void)jy_encode:(NSCoder *)coder;
-(void)jy_decode:(NSCoder *)decoder;
@end

NS_ASSUME_NONNULL_END
