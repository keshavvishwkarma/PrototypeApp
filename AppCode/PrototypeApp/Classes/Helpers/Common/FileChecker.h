//
//  FileChecker.h
//  ArdsBoroughCouncil
//
//  Created by Michael on 31/01/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileChecker : NSObject

+ (BOOL) checkFileNameExistsAtPath:(NSString *)fileName directoryName:(NSString *)directoryLocation;
+ (BOOL) checkDirectoryExists:(NSString *)fullDirectoryPath;
+ (BOOL) deleteFileAtPath:(NSString *)fileName directoryName:(NSString *)directoryLocation;

@end
