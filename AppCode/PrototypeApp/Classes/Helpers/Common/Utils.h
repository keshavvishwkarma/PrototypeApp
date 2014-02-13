//
//  Utils.h
//  MaloneGC
//
//  Created by Michael Miscampbell on 15/04/2012.
//  Copyright (c) 2012 MiscampbellAppDesign. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SystemParam.h"

@interface Utils : NSObject

+ (NSDictionary *) createEmailPropertyDictionaryWith:(NSArray *)toRecipients subject:(NSString *)subject body:(NSString *)body imageAttachment:(UIImage *)imageAttachment;

+ (void)openInSafari:(NSString *)urlString;

+ (NSObject *)loadCustomObjectWithKey:(NSString*)key;

+ (NSString *) processHTMLToString:(id)objectToProcess;

+ (NSDate *) getCurrentYear;

+ (NSDictionary *)parseDateToDictionary:(NSString *) dateToParse;

+ (NSString *)convertMonthToString:(NSNumber *)monthInteger;

+ (NSString *)convertMonthToSeason:(NSDate *)dateToCheck;

+ (NSString *)getCurrentYearString;

+ (NSString *)convertTimeFromSeconds:(NSString *)seconds;

+ (id)loadNSUserDefaultObject:(NSString *)objectKey;

+ (void)makePhoneCall:(NSString *) telephoneNumber;

+ (int) intInRangeMinimum:(int)min andMaximum:(int)max;

+ (UIImage *) imageFromColor:(UIColor *)color;

+ (NSString *)flattenHtml: (NSString *) html;

+ (NSDate *)currentDateMinusThreeMonth;

+ (BOOL)isValidUrl:(NSString *)urlString;

+ (BOOL) isValidEmail:(NSString *)checkString;

#pragma mark Storyboard Methods
+ (UIStoryboard *) getStoryboardForDeviceWithIdentifier:(NSString *)storyboardIdentifier;

#pragma mark Segue Identifier Generation
+ (NSString *) generateSegueForContentType:(NSString *)contentType;

#pragma mark Check Dates

+ (BOOL)isSameDayWithDate1:(NSDate*)date1 date2:(NSDate*)date2;

+ (BOOL)locationAuthorized;

+ (id)getValueForKey:(NSString *)key fromPropertyListFile:(NSString *)pListFile;

+ (id)getContentsFromPropertyListFile:(NSString *)pListFile;

@end
