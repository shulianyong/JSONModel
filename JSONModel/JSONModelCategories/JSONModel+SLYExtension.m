//
//  JSONModel+SLYExtension.m
//  MeiQiReferrer
//
//  Created by neil on 15/4/13.
//  Copyright (c) 2015年 MeiQi iOS Dev Team. All rights reserved.
//

#import <objc/runtime.h>
#import "JSONModel+SLYExtension.h"

extern const char * kClassPropertiesKey;

@interface JSONModel ()

-(void)__setup__;

@end

@implementation JSONModel (SLYExtension)

//获取所有的属性
- (NSDictionary*)classProperties
{
    NSDictionary* classProperties = objc_getAssociatedObject(self.class, &kClassPropertiesKey);
    if (classProperties)
        return classProperties;
    //if here, the class needs to inspect itself
    [self __setup__];
    return [self classProperties];
}


@end
