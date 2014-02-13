//
//  DeviceUtils.m
//  Share
//
//  Created by Lin Zhang on 11-7-4.
//  Copyright 2011年 www.eoemobile.com. All rights reserved.
//

#import "DeviceUtils.h"


@implementation UIDevice (Utils)

+ (NSString *)systemVersion
{
    return  [[self currentDevice] systemVersion];
}

+ (NSString *)systemName
{
    return  [[self currentDevice] systemName];
}

+ (NSString *)name
{
    return  [[self currentDevice] name];
}

+ (NSString *)model
{
    return  [[self currentDevice] model];
}

+ (NSString *)localeIdentifier
{
    return  [[NSLocale currentLocale] localeIdentifier];
}

+ (BOOL) isIPad {
    BOOL isIPad = NO;
    
    if ([[self model] containsString:@"iPad"]) {
        isIPad = YES;
    }
    
    return isIPad;
}

+ (BOOL) isIPhone {
    BOOL isIPhone = NO;
    
    if ([[self model] containsString:@"iPhone"]) {
        isIPhone = YES;
    }
    
    return isIPhone;
}

+ (BOOL) isOS5 {
    BOOL iOS5 = NO;
    
    float currentVersion = 5.1;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] <= currentVersion)
    {
        iOS5 = YES;
    }
    
    return iOS5;
}

+ (BOOL) isOS6 {
    BOOL iOS6 = NO;
    
    float currentVersion = 6.0;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion)
    {
        iOS6 = YES;
    }
    
    return iOS6;
}

@end
