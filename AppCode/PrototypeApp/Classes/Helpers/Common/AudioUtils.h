//
//  AudioUtils.h
//  ArdsBoroughCouncil
//
//  Created by Michael Miscampbell on 04/03/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface AudioUtils : NSObject

+ (void)loadAudioPlayerSuperView:(NSArray *)audioFilesToPlay selectedIndex:(NSNumber *)selectedIndex;

+ (void)hideAudioOptionPanel:(BOOL)hidden;

@end
