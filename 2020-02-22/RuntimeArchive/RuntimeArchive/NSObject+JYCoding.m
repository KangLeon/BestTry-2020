//
//  NSObject+JYCoding.m
//  RuntimeArchive
//
//  Created by 吉腾蛟 on 2020/2/22.
//  Copyright © 2020 JY. All rights reserved.
//

#import "NSObject+JYCoding.h"
#import <objc/runtime.h>

@implementation NSObject (JYCoding)
-(void)jy_encode:(NSCoder *)coder{
    unsigned int outcount = 0;
    objc_property_t *propertyList=class_copyPropertyList([self class], &outcount);
    for (int i=0; i<outcount; i++) {
        objc_property_t property=propertyList[i];
        NSString *propertyName=[NSString stringWithUTF8String:property_getName(property)];
        [coder encodeObject:[self valueForKey:propertyName] forKey:propertyName];
    }
}
-(void)jy_decode:(NSCoder *)decoder{
    unsigned int outcount = 0;
    objc_property_t *propertyList=class_copyPropertyList([self class], &outcount);
    for (int i=0; i<outcount; i++) {
        objc_property_t property=propertyList[i];
        NSString *propertyName=[NSString stringWithUTF8String:property_getName(property)];
        id value=[decoder decodeObjectForKey:propertyName];
        [self setValue:value forKey:propertyName];
    }
}
@end
