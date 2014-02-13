//
//  FileChecker.m
//  ArdsBoroughCouncil
//
//  Created by Michael on 31/01/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "FileChecker.h"

@implementation FileChecker

+ (BOOL) checkFileNameExistsAtPath:(NSString *)fileName directoryName:(NSString *)directoryLocation;
{
    BOOL fileExists = NO;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *documentPaths = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
//    NSLog(@"Document Paths %@", documentPaths);
    
    directoryLocation = [[[documentPaths objectAtIndex:0] path] stringByAppendingPathComponent:directoryLocation];
    
    if ([self checkDirectoryExists:directoryLocation]) {
        NSString *fullFilePath = [directoryLocation stringByAppendingPathComponent:fileName];
        
        if ([fileManager fileExistsAtPath:fullFilePath]) {
//            NSLog(@"Full File Path %@", fullFilePath);
            fileExists = YES;
        }
    }
        
    return fileExists;
    
}

+ (BOOL) checkDirectoryExists: (NSString *) fullDirectoryPath {
    
//    NSLog(@"Full Directory Path: %@", fullDirectoryPath);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL pathExists = [fileManager fileExistsAtPath:fullDirectoryPath isDirectory:&isDirectory];
    
    return pathExists & isDirectory;
}

//NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

+ (BOOL) deleteFileAtPath:(NSString *)fileName directoryName:(NSString *)directoryLocation
{
    BOOL fileDeleted = NO;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *documentPaths = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
    //    NSLog(@"Document Paths %@", documentPaths);
    
    directoryLocation = [[[documentPaths objectAtIndex:0] path] stringByAppendingPathComponent:directoryLocation];
    
    if ([self checkDirectoryExists:directoryLocation]) {
        NSString *fullFilePath = [directoryLocation stringByAppendingPathComponent:fileName];
        
        if ([fileManager fileExistsAtPath:fullFilePath]) {
            //            NSLog(@"Full File Path %@", fullFilePath);
            NSError *error = nil;
            [fileManager removeItemAtPath:fullFilePath error:&error];
            if (error) {
#ifdef DEBUG
                NSLog(@"File Delete Error %@", error);
#endif
            }
        }
        
        if (![self checkFileNameExistsAtPath:fileName directoryName:directoryLocation]) {
            return YES;
        }
    }
    
    return fileDeleted;
    
}

@end
