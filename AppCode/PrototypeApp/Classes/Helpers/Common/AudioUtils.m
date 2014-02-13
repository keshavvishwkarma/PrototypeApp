//
//  AudioUtils.m
//  ArdsBoroughCouncil
//
//  Created by Michael Miscampbell on 04/03/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "AudioUtils.h"
#import "AppDelegate.h"

@implementation AudioUtils

+ (void)loadAudioPlayerSuperView:(NSArray *)audioFilesToPlay selectedIndex:(NSNumber *)selectedIndex {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate loadAudioPlayerSuperView:audioFilesToPlay selectedIndex:selectedIndex];
}

+ (void)hideAudioOptionPanel:(BOOL)hidden {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate hideAudioOptionPanel:hidden];
}

@end
