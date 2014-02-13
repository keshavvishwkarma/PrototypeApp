//
//  WebFormValidator.m
//  PFDNI
//
//  Created by Michael Miscampbell on 07/03/2013.
//  Copyright (c) 2013 Ecom Software Limited. All rights reserved.
//

#import "WebFormValidator.h"

@implementation WebFormValidator

+ (void) submitWebFormRequest: (NSString *)recipient subject:(NSString *)subject body:(NSString *)body sendEmail:(BOOL)sendEmail {
//
//    JsonParser *parser = [[JsonParser alloc] init];
//    
////    NSString *post = [NSString stringWithFormat:@"Recipient=%@&Subject=%@&body=%@&SendEmail=%@", recipient, subject, body, @"true"];
//    NSString *truefalseString = @"false";
//    
//    if (sendEmail) {
//        truefalseString = @"true";
////        recipient = [self retrievePFEDEmailAddress:user.getToken];
//    }
//    
//    NSString *post = [NSString stringWithFormat:@"Recipient=%@&Subject=%@&Data=%@&SendEmail=%@", recipient, subject, body, truefalseString];
//
//    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
//    
//    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/apisubmission?token=%@", BASE_URL, APITOKEN]]];
////    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ulsterscots.infoapps.co/api/apisubmission?token=20e33c32-2371-48d7-83c2-138f1414e541"]]];
//
//#ifdef DEBUG
//    NSLog(@"Request URL %@", [request URL]);
//#endif
//    [request setHTTPMethod:@"POST"];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:postData];
//    
//    [request setTimeoutInterval:20.0];
//    
////    [parser getJsonObject:request];
//#ifdef DEBUG
//    NSLog(@"Web Form Submitted");
//    NSLog(@"JSON Response Recevied: %@", [parser getJsonObjectWithURLRequest:request]);
//#endif
}


@end
