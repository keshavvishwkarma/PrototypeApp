//
//  Utils.m
//  MaloneGC
//
//  Created by Michael Miscampbell on 15/04/2012.
//  Copyright (c) 2012 MiscampbellAppDesign. All rights reserved.
//

#import "Utils.h"
#import "SystemParam.h"
#import "AppDelegate.h"

@implementation Utils

+ (UIAlertView *)showAlert:(NSString *)string1 string2:(NSString *)string2;
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:string1
                                                    message:string2 
                                                   delegate:self
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil, nil];
    return alert;
}

+ (NSDictionary *) createEmailPropertyDictionaryWith:(NSArray *)toRecipients subject:(NSString *)subject body:(NSString *)body imageAttachment:(UIImage *)imageAttachment {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    if (toRecipients != nil) {
        [dictionary setObject:toRecipients forKey:@"toRecipients"];
    }
    if (subject != nil) {
        [dictionary setObject:subject forKey:@"subject"];
    }
    if (body != nil) {
        [dictionary setObject:body forKey:@"body"];
    }
    if (imageAttachment != nil) {
        [dictionary setObject:imageAttachment forKey:@"imageAttachment"];
    }
    
    return dictionary;
}

+ (void)openInSafari:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url];
}

+ (NSObject *)loadCustomObjectWithKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSObject * obj;
    
    if ([defaults objectForKey:key] != nil) {
        
        NSData * myEncodedObject = [defaults objectForKey: key];
        
        obj = (NSObject *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    }
    
    return obj;
}

+ (NSString *) processHTMLToString:(id)objectToProcess {
    NSMutableString *stringToParse = objectToProcess;
    
    return [self flattenHtml:[stringToParse stringByConvertingHTMLToPlainText]];
}

+ (NSString *)flattenHtml: (NSString *) html {
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString: html];
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString: @"<" intoString: NULL];
        
        // find end of tag
        [theScanner scanUpToString: @">" intoString: &text];
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat: @"%@>", text]
                                               withString: @""];
    } // while //
    
    return html;
}

+ (NSDate *) getCurrentYear {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy"];
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:now];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    [components setDay:0];
    [components setMonth:0];
    
    NSDate *currentYear = [calendar dateFromComponents:components];
//    NSLog(@"Current Year %@ Testing", currentYear);
    return currentYear;
    
}

+ (NSDictionary *)parseDateToDictionary:(NSString *) dateToParse {
//    1/8/2010 12:00:00 AM
    
    NSArray *splitArray = [dateToParse componentsSeparatedByString:@"/"];
    
    NSMutableDictionary *dateDictionary = [[NSMutableDictionary alloc] init];
    
//    for (NSString *output in splitArray)
//    {
//        
//        [dateDictionary setValue:<#(id)#> forKey:<#(NSString *)#>]
//        NSLog(@"Output: %@", output);
//    }
    
    if ([splitArray objectAtIndex:0] != nil) {
        [dateDictionary setValue:[splitArray objectAtIndex:0] forKey:@"month"];
    }
    
    if ([splitArray objectAtIndex:1] != nil) {
        [dateDictionary setValue:[splitArray objectAtIndex:1] forKey:@"day"];
    }
    
    if ([splitArray objectAtIndex:2] != nil) {
        if ([[splitArray objectAtIndex:2] length] > 4) {
            [dateDictionary setValue:[[splitArray objectAtIndex:2] substringToIndex:4] forKey:@"year"];
        }
    }

    
    return dateDictionary;
}

+ (NSString *)convertMonthToString:(NSNumber *)monthInteger {
    
    NSInteger value = [monthInteger integerValue];
    
    switch (value) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            return @"-";
            break;
    }
    
    return @"TEST";
}

+ (NSString *)convertMonthToSeason:(NSDate *)dateToCheck {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:dateToCheck]; // Get necessary date components
    
    NSString *monthString = [[NSNumber numberWithInteger:[components month]] stringValue];
    
    NSMutableArray *winterArray = [NSMutableArray arrayWithObjects:@"12", @"2", @"3", nil];
    NSMutableArray *summerArray = [NSMutableArray arrayWithObjects:@"6", @"7", @"8", nil];
    NSMutableArray *autumnArray = [NSMutableArray arrayWithObjects:@"9", @"10", @"11", nil];
    NSMutableArray *springArray = [NSMutableArray arrayWithObjects:@"3", @"4", @"5", nil];
    
    NSString *seasonString = @"";
    
    if ([winterArray containsObject:monthString]) {
        seasonString = @"winter";
    } else if ([summerArray containsObject:monthString]) {
        seasonString = @"summer";
    } else if ([autumnArray containsObject:monthString]) {
        seasonString = @"autumn";
    } else if ([springArray containsObject:monthString]) {
        seasonString = @"spring";
    }
    
    return seasonString;
}

+ (NSString *)getCurrentYearString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    
    return yearString;
}

+ (NSString *)convertTimeFromSeconds:(NSString *)seconds {
    NSString *result = @"";
    
    int secs = [seconds intValue];
    int tempHour = 0;
    int tempMinute = 0;
    int tempSecond = 0;
    
    NSString *hour = @"";
    NSString *minute = @"";
    NSString *second = @"";
    
    tempHour = secs / 3600;
    tempMinute = secs / 60 - tempHour * 60;
    tempSecond = secs - (tempHour * 3600 + tempMinute * 60);
    
    hour = [[NSNumber numberWithInt:tempHour] stringValue];
    minute = [[NSNumber numberWithInt:tempMinute] stringValue];
    second = [[NSNumber numberWithInt:tempSecond] stringValue];
    
    if (tempHour < 10) {
        hour = [@"0" stringByAppendingString:hour];
    }
    
    if (tempMinute < 10) {
        minute = [@"0" stringByAppendingString:minute];
    }
    
    if (tempSecond < 10) {
        second = [@"0" stringByAppendingString:second];
    }
    
    if (tempHour == 0) {
#ifdef DEBUG
        NSLog(@"Result of Time Conversion: %@:%@", minute, second);
#endif
        result = [NSString stringWithFormat:@"%@%@", minute, second];
    } else {
#ifdef DEBUG
        NSLog(@"Result of Time Conversion: %@:%@:%@", hour, minute, second);
#endif
        result = [NSString stringWithFormat:@"%@:%@:%@", hour, minute, second];
    }
    
    return result;
    
}

+ (id)loadNSUserDefaultObject:(NSString *)objectKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    id obj;
    
    if ([defaults objectForKey:objectKey] != nil) {
        obj = [defaults objectForKey:objectKey];
    }
    
    return obj;
}

+ (void)makePhoneCall:(NSString *) telephoneNumber {
    
    telephoneNumber = [telephoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    DDLogInfo(@"Tel No: %@", telephoneNumber);
    
    NSString *fullNumber = [NSString stringWithFormat:@"telprompt://%@", telephoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:fullNumber]];
}

+ (int) intInRangeMinimum:(int)min andMaximum:(int)max {
    if (min > max) { return -1; }
    int adjustedMax = (max + 1) - min; // arc4random returns within the set {min, (max - 1)}
    int random = arc4random() % adjustedMax;
    int result = random + min;
    return result;
}

+ (UIImage *) imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    //  [[UIColor colorWithRed:222./255 green:227./255 blue: 229./255 alpha:1] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (NSDate *)currentDateMinusThreeMonth {
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:-3]; // note that I'm setting it to -1
    NSDate *endOfWorldWar3 = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    return endOfWorldWar3;
}

+ (BOOL)isValidUrl:(NSString *)urlString{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    return [NSURLConnection canHandleRequest:request];
}

+ (BOOL) isValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

#pragma mark Storyboard Methods

+ (UIStoryboard *) getStoryboardForDeviceWithIdentifier:(NSString *)storyboardIdentifier {
    
    UIStoryboard *storyboard;
    
    if ([storyboardIdentifier isNotBlank]) {
        if ([storyboardIdentifier isEqualToString:MAIN_STORYBOARD]) {
            if ([UIDevice isIPad]) {
                storyboard = [UIStoryboard storyboardWithName:MAIN_STORYBOARD_iPAD bundle:[NSBundle mainBundle]];
            } else {
                storyboard = [UIStoryboard storyboardWithName:MAIN_STORYBOARD_iPHONE bundle:[NSBundle mainBundle]];
            }
        } else if ([storyboardIdentifier isEqualToString:UTILITY_STORYBOARD]) {
            if ([UIDevice isIPad]) {
                storyboard = [UIStoryboard storyboardWithName:UTILITY_STORYBOARD_iPAD bundle:[NSBundle mainBundle]];
            } else {
                storyboard = [UIStoryboard storyboardWithName:UTILITY_STORYBOARD_iPHONE bundle:[NSBundle mainBundle]];
            }
        }
    }
    
    return storyboard;
}

#pragma mark Segue Identifier Generation
+ (NSString *) generateSegueForContentType:(NSString *)contentType {
    return [NSString stringWithFormat:@"%@Segue", contentType];
}

#pragma mark Check Dates

+ (BOOL)isSameDayWithDate1:(NSDate*)date1 date2:(NSDate*)date2 {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    if (date2 == nil) {
        return NO;
    } else {
        return [comp1 day]   == [comp2 day] &&
        [comp1 month] == [comp2 month] &&
        [comp1 year]  == [comp2 year];
    }
}

+ (BOOL)locationAuthorized {
    return ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized);
}

+ (id)getValueForKey:(NSString *)key fromPropertyListFile:(NSString *)pListFile {
    
    id objectToReturn = nil;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:pListFile ofType:@"plist"];
    
    if ([path isBlank] || path == NULL) {
        [NSException raise:@"No FeedAPI-Constants Property List File Detected" format:@"ERROR: No FeedAPI-Constants pList file found."];
    }
    
    @try {
        NSMutableDictionary *dictionaryData = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        
        objectToReturn = [dictionaryData valueForKey:key];
    }
    @catch (NSException *exception) {
        DDLogError(@"Function: %s at Line Number: %d EXCEPTION: %@", __func__, __LINE__, exception);
    }
    return objectToReturn;
}

+ (id)getContentsFromPropertyListFile:(NSString *)pListFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:pListFile ofType:@"plist"];
    
    id objectToReturn = nil;
    
    if ([path isBlank]) {
        [NSException raise:@"No Property List File Detected" format:@"ERROR: No pList file found."];
    }
    
    @try {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
        objectToReturn = dictionary;
    }
    @catch (NSException *exception) {
        DDLogError(@"Function: %s at Line Number: %d EXCEPTION: %@", __func__, __LINE__, exception);
    }
    
    return objectToReturn;
}

@end
