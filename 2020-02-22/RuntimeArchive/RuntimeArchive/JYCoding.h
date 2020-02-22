//
//  JYCoding.h
//  RuntimeArchive
//
//  Created by 吉腾蛟 on 2020/2/22.
//  Copyright © 2020 JY. All rights reserved.
//

#import <objc/runtime.h>
#ifndef JYCoding_h
#define JYCoding_h
#define JY_CODEING \
-(void)encodeWithCoder:(NSCoder *)coder{\
    unsigned int outcount = 0;\
    objc_property_t *propertyList=class_copyPropertyList([self class], &outcount);\
    for (int i=0; i<outcount; i++) {\
        objc_property_t property=propertyList[i];\
        NSString *propertyName=[NSString stringWithUTF8String:property_getName(property)];\
        [coder encodeObject:[self valueForKey:propertyName] forKey:propertyName];\
    }\
}\
-(instancetype)initWithCoder:(NSCoder *)deCoder{\
    if (self=[super init]) {\
        unsigned int outcount = 0;\
        objc_property_t *propertyList=class_copyPropertyList([self class], &outcount);\
        for (int i=0; i<outcount; i++) {\
            objc_property_t property=propertyList[i];\
            NSString *propertyName=[NSString stringWithUTF8String:property_getName(property)];\
            id value=[deCoder decodeObjectForKey:propertyName];\
            [self setValue:value forKey:propertyName];\
        }\
    }\
    return self;\
}\
+(BOOL)supportsSecureCoding{\
    return YES;\
}

#endif /* JYCoding_h */
