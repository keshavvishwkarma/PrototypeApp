//
//  StaticDataUtils.m
//  Discover
//
//  Created by Michael Miscampbell on 15/07/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "StaticDataUtils.h"

@implementation StaticDataUtils

+(void) setupSections {
    [Section truncateAll];
    NSArray *sectionStaticDataArray = [[Utils getContentsFromPropertyListFile:STATICDATA_PLIST_FILE] objectForKey:SECTIONS_KEY];
    
    for (NSDictionary *sectionDictionary in sectionStaticDataArray) {
        Section *section = [Section findFirstByAttribute:@"id"
                                               withValue:[sectionDictionary objectForKey:@"id"]] ?
        nil :
        [Section createEntity];
        
        [section importValuesForKeysWithObject:sectionDictionary];
    }
    
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
}

+ (void) setupChapters {
    [Chapter truncateAll];
    NSArray *chapterStaticDataArray = [[Utils getContentsFromPropertyListFile:STATICDATA_PLIST_FILE] objectForKey:CHAPTERS_KEY];
    
    for (NSDictionary *chapterDictionary in chapterStaticDataArray) {
        Chapter *chapter = [Chapter findFirstByAttribute:@"id"
                                               withValue:[chapterDictionary objectForKey:@"id"]] ? nil : [Chapter createEntity];
        
        [chapter importValuesForKeysWithObject:chapterDictionary];
    }
    
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
}

+ (void) setupContent {
    [Content truncateAll];
    NSArray *contentStaticDataArray = [[Utils getContentsFromPropertyListFile:STATICDATA_PLIST_FILE] objectForKey:CONTENT_KEY];
    
    for (NSDictionary *contentDictionary in contentStaticDataArray) {
        Content *content = [Content findFirstByAttribute:@"id"
                                               withValue:[contentDictionary objectForKey:@"id"]] ? nil : [Content createEntity];
        
        [content importValuesForKeysWithObject:contentDictionary];
    }
    
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
}

@end
