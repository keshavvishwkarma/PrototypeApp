//
//  BaseAnnotation.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 24/05/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "BaseAnnotation.h"

@interface BaseAnnotation ()

@property (nonatomic, copy) NSString *locationTitle;
@property (nonatomic, copy) NSString *locationDistance;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;
@property (nonatomic, copy) NSNumber *contentId;
@property (nonatomic, copy) NSNumber *catId;

@end

@implementation BaseAnnotation

@synthesize coordinate = _coordinate;

- (id)initWithTitle:(NSString *)locationTitle distanceFrom:(NSString *)locationDistance coordinate:(CLLocationCoordinate2D)coordinate contentId:(NSNumber *)contentId catId:(NSNumber *)catId {
    if ((self = [super init])) {
        self.locationTitle = locationTitle;
        self.locationDistance = locationDistance;
        self.theCoordinate = coordinate;
        self.contentId = contentId;
        self.catId = catId;
    }
    
    return self;
}

- (NSString *)title {
    return _locationTitle;
}

- (NSString *)subtitle {
    return _locationDistance;
}

- (CLLocationCoordinate2D)coordinate {
    return _theCoordinate;
}

- (NSNumber *)contentId {
    return _contentId;
}

- (NSNumber *)catId {
    return _catId;
}

@end
