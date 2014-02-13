//
//  BasePageViewController.m
//  PrototypeApp
//
//  Created by App Development on 23/10/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import "BasePageViewController.h"

@interface BasePageViewController ()

@end

@implementation BasePageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.basePageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                                  navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                                options:nil];
    self.basePageViewController.dataSource = self;
    [[self.basePageViewController view] setFrame:[[self view] bounds]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadContentForChapter
{
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    return nil;
}


@end
