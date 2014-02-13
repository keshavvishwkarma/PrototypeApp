//
//  UINavigationController+AutoRotation.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 14/06/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "UINavigationController+AutoRotation.h"

@implementation UINavigationController (AutoRotation)

-(BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers lastObject]  preferredInterfaceOrientationForPresentation];
}

- (void) viewDidLoad {
    [super viewDidLoad];
}

@end
