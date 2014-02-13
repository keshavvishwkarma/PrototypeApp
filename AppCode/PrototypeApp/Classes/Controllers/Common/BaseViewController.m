//
//  BaseViewController.m
//  MaloneGC
//
//  Created by Michael Miscampbell on 01/05/2012.
//  Copyright (c) 2012 MiscampbellAppDesign. All rights reserved.
//

#import "BaseViewController.h"

@interface UIViewController (NotificationsProcessing)

- (void) processNotification:(NSNotification *) notification;

@end


@interface BaseViewController ()

@property (nonatomic, retain) IBOutlet JSAnimatedImagesView *animatedImagesView;
@property (nonatomic, retain) CLLocationManager *locatonManager;

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTransitionManager];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [super viewDidAppear:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma TransitionManager Setup
- (void) setupTransitionManager
{
    _transitionManager = [[TransitionManager alloc] init];
}

#pragma mark Location Services
- (CLLocationManager *) locationManager
{
    return _locatonManager;
}

- (void) setLocatonManager:(CLLocationManager *)locatonManager
{
    _locatonManager = locatonManager;
}

#pragma mark JSAnimatedImagesView Methods
- (void)setupBackgroundImagesArray {
        
    if (self.animatedImagesView.dataSource == nil) {
        self.animatedImagesView.dataSource = self;
    }
    
    if (self.animatedBackgroundImages == nil) {
//        self.animatedBackgroundImages = [FeedAPIUtils getValueForKey:ROTATING_IMAGES_KEY fromPropertyListFile:DISCOVER_PLIST_FILE];
    }
    
    if (self.animatedBackgroundImages.count == 0) {
        DDLogError(@"%s WARNING: Please setup all required Animated within the following method", __func__);
    }
    
    [self.animatedImagesView reloadData];
}

- (NSUInteger) animatedImagesNumberOfImages:(JSAnimatedImagesView *)animatedImagesView {
    return [self.animatedBackgroundImages count];
}

- (UIImage *) animatedImagesView:(JSAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index {
    return [UIImage imageNamed:[self.animatedBackgroundImages objectAtIndex:index]];
}


#pragma mark Notification Processing
- (void) processNotification:(NSNotification *) notification {
    
    [super processNotification:notification];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
