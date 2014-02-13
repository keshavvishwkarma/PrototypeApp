//
//  ViewSelectionFactory.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 29/04/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "ViewSelectionFactory.h"


typedef enum  {
    TEST_VIEW
} kViewSelectionTypes;

#define kViewSelectionTypesArray [NSArray arrayWithObjects:nil]

@implementation ViewSelectionFactory

+ (void)processSegueToViewControllerRequired:(NSNumber *)selectedCategoryId  contentId:(NSNumber *)contentId withSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    return [self findViewRequiredForCategoryId:selectedCategoryId contentId:contentId withSegue:segue sender:sender];
}

+ (void) findViewRequiredForCategoryId:(NSNumber *)categoryId contentId:(NSNumber *)contentId withSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSArray *viewSelectionTypesArray = kViewSelectionTypesArray;
    
    for (NSString *viewRequired in viewSelectionTypesArray) {
        
        NSString *segueString = [viewRequired stringByAppendingString:@"Segue"];

        if ([[segue identifier] isEqualToString:segueString]) {
            [self processViewRequiredFor:viewRequired withCategoryId:categoryId contentId:contentId withSegue:segue sender:sender];
        }
    }    
}

+ (void) processViewRequiredFor:(NSString *)viewRequired withCategoryId:(NSNumber *)categoryId contentId:(NSNumber *)contentId withSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    @try {

    }
    @catch (NSException *exception) {
        DDLogError(@"%s Exception: %@", __func__, exception);
    }
}

@end