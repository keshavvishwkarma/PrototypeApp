//
//  MainSidePanelController.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 29/04/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "MainSlidePanelController.h"
#import "UINavigationController+AutoRotation.h"

@interface MainSlidePanelController ()

@end

@implementation MainSlidePanelController

- (void)awakeFromNib {
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    //  Set NavigationBar appearance settings
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [UIColor whiteColor],
//                                                           NSShadowAttributeName: [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
                                                           NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-UltraLight-Bold" size:0.0],
                                                           }];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    UIStoryboard *utilityStoryboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
    
    UIViewController *sideNavController = [utilityStoryboard instantiateViewControllerWithIdentifier:SIDE_NAVIGATION_PANEL_VIEW];
    
    [self setLeftFixedWidth:250];
    
    [self setLeftPanel:sideNavController];
    
    [self setAllowLeftOverpan:NO];
    
    [self setAllowLeftSwipe:NO];
    
    [self setShouldDelegateAutorotateToVisiblePanel:YES];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:
                                                   [utilityStoryboard instantiateViewControllerWithIdentifier:MAIN_VIEW]];
    [navigationController setNavigationBarHidden:YES];
    
    [self setCenterPanel: navigationController];
}

#pragma  mark - UI

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if ([UIDevice isIPhone]) {
        return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    } else {
        return YES;
    }
}

#ifdef __IPHONE_6_0
- (NSUInteger)supportedInterfaceOrientations
{
    if ([UIDevice isIPad]) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }}
#endif

@end
