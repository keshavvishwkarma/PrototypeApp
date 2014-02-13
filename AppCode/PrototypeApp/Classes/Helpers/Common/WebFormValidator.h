//
//  WebFormValidator.h
//  PFDNI
//
//  Created by Michael Miscampbell on 07/03/2013.
//  Copyright (c) 2013 Ecom Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebFormValidator : NSObject

+ (void) submitWebFormRequest: (NSString *)recipient subject:(NSString *)subject body:(NSString *)body sendEmail:(BOOL)sendEmail;


@end
