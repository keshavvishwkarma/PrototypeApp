//
//  BaseAnnotationView.h
//  FleadhMobile
//
//  Created by Michael Miscampbell on 04/06/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface BaseAnnotationView : MKPinAnnotationView

- (void) setContentId:(NSNumber *)contentId;
- (NSNumber *) contentId;

- (void) setCatId:(NSNumber *)catId;
- (NSNumber *) catId;


@end
