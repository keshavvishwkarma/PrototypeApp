//
//  Chapter.h
//  PrototypeApp
//
//  Created by App Development on 21/10/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Chapter : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * section_id;
@property (nonatomic, retain) NSString * title;

@end
