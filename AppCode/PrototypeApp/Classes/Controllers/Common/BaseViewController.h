//
//  BaseViewController.h
//  MaloneGC
//
//  Created by Michael Miscampbell on 01/05/2012.
//  Copyright (c) 2012 MiscampbellAppDesign. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewSelectionFactory.h"

#import "JSAnimatedImagesView.h"

//  Aninmation Processing
#import "TransitionManager.h"

@interface BaseViewController : UIViewController <CLLocationManagerDelegate, UISearchBarDelegate, UISearchDisplayDelegate, JSAnimatedImagesViewDataSource, UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) NSString *searchString;
@property (strong, nonatomic) NSArray *filteredList;

@property (nonatomic, retain) NSArray *photos;
@property (nonatomic, retain) NSArray *animatedBackgroundImages;

@property (nonatomic, strong) TransitionManager *transitionManager;

#pragma mark Access LocationManager
- (CLLocationManager *) locationManager;
- (void) setLocatonManager:(CLLocationManager *)locatonManager;

#pragma mark Process Notification
- (void) processNotification:(NSNotification *) notification;

@end
