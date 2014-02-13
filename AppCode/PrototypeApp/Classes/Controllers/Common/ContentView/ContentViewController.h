//
//  ContentViewController.h
//  PrototypeApp
//
//  Created by App Development on 23/10/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import "BaseViewController.h"

@interface ContentViewController : BaseViewController <UIGestureRecognizerDelegate>

@property (nonatomic, retain) NSNumber *selectedContentId;
@property (nonatomic, retain) Content *content;

@property (retain) id delegate;

@end
