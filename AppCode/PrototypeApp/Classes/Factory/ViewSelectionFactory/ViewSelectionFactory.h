//
//  ViewSelectionFactory.h
//  FleadhMobile
//
//  Created by Michael Miscampbell on 29/04/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewSelectionFactory : NSObject

+ (void)processSegueToViewControllerRequired:(NSNumber *)selectedCategoryId  contentId:(NSNumber *)contentId withSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
