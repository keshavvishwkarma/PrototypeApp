//
//  SplashScreenViewController.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 16/05/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "SplashScreenViewController.h"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface SplashScreenViewController ()

@property (nonatomic, retain) IBOutlet UIImageView *splashScreenTopImage;
@property (nonatomic, retain) IBOutlet UIImageView *splashScreenBottomImage;

@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;

@property (nonatomic) BOOL backgroundActivated;

@end

@implementation SplashScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _backgroundActivated = NO;
	// Do any additional setup after loading the view.

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backgroundModeActivated) name:UIApplicationDidEnterBackgroundNotification object:nil];

    
    DDLogInfo(@"Splash Screen Required for season: %@", [Utils convertMonthToSeason:[NSDate date]]);
    
    UIImage *splashScreenRequired;
    
    if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        //do portrait work
        if ([UIDevice isIPad]) {
            splashScreenRequired = [UIImage imageNamed:@"Default-Portrait~ipad.png"];
        } else {
            splashScreenRequired = [UIImage imageNamed:@"Default.png"];
        }
    } else if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        //do landscape work
        if ([UIDevice isIPad]) {
            splashScreenRequired = [UIImage imageNamed:@"Default-Landscape~ipad.png"];
        } else {
            splashScreenRequired = [UIImage imageNamed:@"Default.png"];
        }
    }
    
    if (IS_IPHONE_5) {
        splashScreenRequired = [UIImage imageNamed:@"Default-568h@2x.png"];
    }
    
    [self setupBackgroundImageForCurrentSeason];
    
    
    
//    CGRect backgroundImageViewFrame = _backgroundImageView.bounds;
//    backgroundImageViewFrame.size.height = SCREEN_HEIGHT;
//    
//    DDLogInfo(@"Background Image View Bounds Height: %f", backgroundImageViewFrame.size.height);
//
//    _backgroundImageView.bounds = backgroundImageViewFrame;
    
    [_backgroundImageView setImage:splashScreenRequired];
}

- (void)viewWillAppear:(BOOL)animated {
    [self animateSplashScreen];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupBackgroundImageForCurrentSeason {
    NSString *currentSeason = [Utils convertMonthToSeason:[NSDate date]];
    
    UIImage *splashScreenRequired;
    
    if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        //do portrait work
        if ([UIDevice isIPad]) {
            splashScreenRequired = [UIImage imageNamed:[NSString stringWithFormat:@"%@_portrait_ipad.jpg", currentSeason]];
        } else {
            splashScreenRequired = [UIImage imageNamed:[NSString stringWithFormat:@"%@_iphone.jpg", currentSeason]];
        }
    } else if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        //do landscape work
        if ([UIDevice isIPad]) {
            splashScreenRequired = [UIImage imageNamed:[NSString stringWithFormat:@"%@_landscape_ipad.jpg", currentSeason]];
        } else {
            splashScreenRequired = [UIImage imageNamed:[NSString stringWithFormat:@"%@_iphone.jpg", currentSeason]];
        }
    }
    
    if (IS_IPHONE_5) {
        splashScreenRequired = [UIImage imageNamed:[NSString stringWithFormat:@"%@_iphone5.jpg", currentSeason]];
    }
    
    
    [self.splashScreenTopImage setImage:splashScreenRequired];
    [self.splashScreenBottomImage  setImage:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animateSplashScreen {
    CGRect screen = self.view.frame;
    
    DDLogInfo(@"BEFORE: Top Image y: %f Bottom Image y: %f", self.splashScreenTopImage.frame.origin.y, self.splashScreenBottomImage.frame.origin.y);
    DDLogInfo(@"BEFORE: Top Image Height: %f Bottom Image Height: %f", self.splashScreenTopImage.frame.size.height, self.splashScreenBottomImage.frame.size.height);

    __block CGRect splashScreenTopImageFrame = self.splashScreenTopImage.frame;
    __block CGRect splashScreenBottomImageFrame = self.splashScreenBottomImage.frame;
    
    splashScreenTopImageFrame.origin.y = -screen.size.height;
    splashScreenBottomImageFrame.origin.y = screen.size.height;
    
    splashScreenBottomImageFrame.size.height = screen.size.height;
    splashScreenBottomImageFrame.size.height = screen.size.height;
    
    self.splashScreenTopImage.frame = splashScreenTopImageFrame;
    self.splashScreenBottomImage.frame = splashScreenBottomImageFrame;
    
    DDLogInfo(@"AFTER: Top Image y: %f Bottom Image y: %f", self.splashScreenTopImage.frame.origin.y, self.splashScreenBottomImage.frame.origin.y);
    DDLogInfo(@"AFTER: Top Image Height: %f Bottom Image Height: %f", self.splashScreenTopImage.frame.size.height, self.splashScreenBottomImage.frame.size.height);
    
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         splashScreenTopImageFrame.origin.y += self.splashScreenTopImage.frame.size.height;
                         splashScreenBottomImageFrame.origin.y -= self.splashScreenBottomImage.frame.size.height;
                         
                         self.splashScreenTopImage.frame = splashScreenTopImageFrame;
                         self.splashScreenBottomImage.frame = splashScreenBottomImageFrame;
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             // Do your method here after your animation.
                             [self loadRequiredContent];
                         }
                     }];
    

    
}

- (void)loadRequiredContent {
    self.statusLabel.hidden = NO;
    [self.statusLabel setText:@"Loading..."];
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
}

#pragma mark Notification Processing
- (void) processNotification:(NSNotification *) notification {
    DDLogWarn(@"Notification Received In %@", [self class]);
    
    [super processNotification:notification];
    
    if ([[notification name] isEqualToString:UIApplicationDidBecomeActiveNotification]) {
        DDLogInfo(@"Application Became Active");
        if (_backgroundActivated) {
            [self loadRequiredContent];
        }
        
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        
        UIStoryboard *mainStoryboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
        
        UIViewController *mainViewController = [mainStoryboard instantiateViewControllerWithIdentifier:CENTER_VIEW];
        
        [self presentViewController:mainViewController animated:YES completion:nil];
        
    }
}

//- (void)backgroundModeActivated {
//    _backgroundActivated = YES;
//}

//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
//    [self loadRequiredContent];
//}

@end
