//
//  Section.h
//  PrototypeApp
//
//  Created by App Development on 21/10/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Section : NSManagedObject

@property (nonatomic, retain) id blob_background_frame;
@property (nonatomic, retain) NSString * blob_background_image;
@property (nonatomic, retain) NSNumber * blob_background_image_content_mode;
@property (nonatomic, retain) id cross_background_frame;
@property (nonatomic, retain) NSString * cross_background_image;
@property (nonatomic, retain) id cross_frame;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * title_alignment;
@property (nonatomic, retain) id title_frame;

@end
