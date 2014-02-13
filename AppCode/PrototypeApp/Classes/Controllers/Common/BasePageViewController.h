//
//  BasePageViewController.h
//  PrototypeApp
//
//  Created by App Development on 23/10/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, retain) NSNumber *selectedId;

@property (nonatomic, retain) UIPageViewController *basePageViewController;

@property (assign, nonatomic) NSInteger index;

@end
