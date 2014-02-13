//
//  BaseAnnotation.h
//  FleadhMobile
//
//  Created by Michael Miscampbell on 24/05/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAnnotation : NSObject <MKAnnotation>

- (id)initWithTitle:(NSString *)locationTitle distanceFrom:(NSString *)locationDistance coordinate:(CLLocationCoordinate2D)coordinate contentId:(NSNumber *)contentId catId:(NSNumber *)catId;

- (NSNumber *)contentId;

- (NSNumber *)catId;

@end
