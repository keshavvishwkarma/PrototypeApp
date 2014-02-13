//
//  DownloadInfo.h
//  ArdsBoroughCouncil
//
//  Created by Michael on 05/02/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadInfo : NSObject

@property (nonatomic, weak) NSString *filename;
@property (nonatomic, weak) NSString *directory;
@property (nonatomic, weak) NSURL *downloadURL;

@end
