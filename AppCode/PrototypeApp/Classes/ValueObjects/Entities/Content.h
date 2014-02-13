//
//  Content.h
//  PrototypeApp
//
//  Created by App Development on 21/10/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Content : NSManagedObject

@property (nonatomic, retain) NSNumber * chapter_id;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * id;

@end
