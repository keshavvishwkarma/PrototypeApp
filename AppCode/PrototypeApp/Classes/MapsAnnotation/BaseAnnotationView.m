//
//  BaseAnnotationView.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 04/06/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "BaseAnnotationView.h"

@interface BaseAnnotationView ()

@property (nonatomic, retain) NSNumber *contentId;
@property (nonatomic, retain) NSNumber *catId;

@end

@implementation BaseAnnotationView

@synthesize contentId = _contentId;
@synthesize catId = _catId;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setContentId:(NSNumber *)contentId {
    _contentId = contentId;
}

- (NSNumber *) contentId {
    return _contentId;
}

- (void) setCatId:(NSNumber *)catId {
    _catId = catId;
}

- (NSNumber *) catId {
    return _catId;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
