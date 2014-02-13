//
//  MainTableViewController.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 01/05/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "MainTableViewController.h"

#import "MainTableViewCell.h"

#define DEFAULT_ROW_HEIGHT 100

@interface MainTableViewController () 

@property (nonatomic, retain) NSArray *mainContentArray;
@property (nonatomic, retain) IBOutlet UIToolbar *mainToolbar;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;

@property (nonatomic, retain) IBOutlet BubbleSpaceView *bubbleView;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    self.tableView.backgroundView = nil;
	// Do any additional setup after loading the view.
    
    CAGradientLayer *glayer = [CAGradientLayer layer];
	glayer.frame = self.view.bounds;
	UIColor *topColor = [UIColor colorWithRed:0.57 green:0.63 blue:0.68 alpha:1.0]; //light blue-gray
	glayer.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], nil];
    [self.view.layer insertSublayer:glayer atIndex:0];
    
    [self loadRelevantData];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.bubbleView reset];
//    [self showBubbles];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void) loadRelevantData {
//    _mainContentArray = [Utils getValueForKey:SECTIONS_KEY fromPropertyListFile:STATICDATA_PLIST_FILE];
    _mainContentArray = [Section findAllSortedBy:@"id" ascending:YES];
    NSInteger count = 0;
    for (Section *section in _mainContentArray)
    {
        float yAxisForNextRow = count * DEFAULT_ROW_HEIGHT;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, yAxisForNextRow, SCREEN_WIDTH, DEFAULT_ROW_HEIGHT)];
        [button setBackgroundColor:[UIColor clearColor]];
        [button setTag:[section.id integerValue]];
        [button addTarget:self action:@selector(showSelectedContent:) forControlEvents:UIControlEventTouchUpInside];
        
        [_scrollView addSubview:button];
        
        NSDictionary *blobBackgroundFrameDictionary = section.blob_background_frame;
        UIImageView *blobBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(
                                                                                             [[blobBackgroundFrameDictionary valueForKey:@"x"] floatValue],
                                                                                             [[blobBackgroundFrameDictionary valueForKey:@"y"] floatValue] + yAxisForNextRow,
                                                                                             [[blobBackgroundFrameDictionary valueForKey:@"width"] floatValue],
                                                                                             [[blobBackgroundFrameDictionary valueForKey:@"height"] floatValue])];
        [blobBackgroundImageView setImage:[UIImage imageNamed:section.blob_background_image]];
        [blobBackgroundImageView setContentMode:[section.blob_background_image_content_mode integerValue]];
        
        CABasicAnimation *theAnimation;
        
        theAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        theAnimation.duration=1.5;
        theAnimation.repeatCount=HUGE_VALF;
        theAnimation.autoreverses=YES;
        theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
        theAnimation.toValue=[NSNumber numberWithFloat:0.5];
        
        [blobBackgroundImageView.layer addAnimation:theAnimation forKey:@"animateOpacity"];
        
        [_scrollView addSubview:blobBackgroundImageView];
        
        NSDictionary *crossBackgroundFrameDictionary = section.cross_background_frame;
        UIImageView *crossBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake([[crossBackgroundFrameDictionary valueForKey:@"x"] floatValue],
                                                                                              [[crossBackgroundFrameDictionary valueForKey:@"y"] floatValue] + yAxisForNextRow,
                                                                                              [[crossBackgroundFrameDictionary valueForKey:@"width"] floatValue],
                                                                                              [[crossBackgroundFrameDictionary valueForKey:@"height"] floatValue])];
        [crossBackgroundImageView setImage:[UIImage imageNamed:section.cross_background_image]];
        
        [_scrollView addSubview:crossBackgroundImageView];
        
        NSDictionary *crossFrameDictionary = section.cross_frame;
        UIImageView *crossImageView = [[UIImageView alloc] initWithFrame:CGRectMake([[crossFrameDictionary valueForKey:@"x"] floatValue],
                                                                                    [[crossFrameDictionary valueForKey:@"y"] floatValue] + yAxisForNextRow,
                                                                                    [[crossFrameDictionary valueForKey:@"width"] floatValue],
                                                                                    [[crossFrameDictionary valueForKey:@"height"] floatValue])];
        [crossImageView setImage:[UIImage imageNamed:@"cross.png"]];
        
        [_scrollView addSubview:crossImageView];
        
        NSDictionary *mainLabelFrameDictionary = section.title_frame;
        UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake([[mainLabelFrameDictionary valueForKey:@"x"] floatValue],
                                                                       [[mainLabelFrameDictionary valueForKey:@"y"] floatValue] + yAxisForNextRow,
                                                                       [[mainLabelFrameDictionary valueForKey:@"width"] floatValue],
                                                                       [[mainLabelFrameDictionary valueForKey:@"height"] floatValue])];
        [mainLabel setText:section.title];
        [mainLabel setTextAlignment:[section.title_alignment integerValue]];
        [mainLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30]];
//        [mainLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
        
        [mainLabel setNumberOfLines:0];
        [mainLabel setTextColor:[UIColor whiteColor]];
        
        [_scrollView addSubview:mainLabel];
        
        count++;
    }
    
    [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, count * DEFAULT_ROW_HEIGHT)];
    
}

- (void) setupBackgroundImageView
{
    // Set vertical effect
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-10);
    verticalMotionEffect.maximumRelativeValue = @(10);
    
    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-10);
    horizontalMotionEffect.maximumRelativeValue = @(10);
    
    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    [_backgroundImageView addMotionEffect:group];

}

- (IBAction)showSelectedContent:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    UIStoryboard *storyboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
    ChapterViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:CHAPTER_VIEW];
    [viewController setSelectedSectionId:[NSNumber numberWithInteger:button.tag]];
    
    viewController.transitioningDelegate = self;
    viewController.modalPresentationStyle = UIModalPresentationCustom;
    
//    [self.navigationController presentViewController:viewController animated:YES completion:^{
//
//    }];
    [self.navigationController pushViewController:viewController animated:YES];
    
//    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)showSidePanel:(id)sender
{
    [self.sidePanelController toggleLeftPanel:nil];

}

-(void) showBubbles
{
    srand((unsigned)time(NULL));
	int numberOfStaticBubbles = 10;
	for (int i = 0; i < numberOfStaticBubbles; i++) {
		UIImage* image = [UIImage imageNamed:i%2?@"green":@"blue"];
		CGFloat bubbleDiameter = rand() % (135 - 80 + 1) + 80;
		BubbleFloatingView *bubble = [BubbleFloatingView new];
		bubble.image = image;
		bubble.bounds = CGRectMake(0.0f, 0.0f, bubbleDiameter, bubbleDiameter);
        
		int startX = self.bubbleView.bounds.size.width + bubble.bounds.size.width/2;
		CGFloat y = rand()%((int)self.bubbleView.bounds.size.height - (int)bubble.bounds.size.height/2 + 1) + (int)bubble.bounds.size.height/2;
		double speed = rand() % (30 - 8 + 1) + 8;
		bubble.center = CGPointMake(startX, y);
		bubble.destination = CGPointMake(-bubble.bounds.size.width/2, y);
		bubble.speed = speed;
		[self.bubbleView addFloatingView:bubble];
	}
	
	[self.bubbleView startAnimations];
}

#pragma mark - UIVieControllerTransitioningDelegate -

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source{
    self.transitionManager.transitionTo = MODAL;
    return self.transitionManager;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transitionManager.transitionTo = INITIAL;
    return self.transitionManager;
}

#pragma mark UINavigationControllerDelegate methods

- (id <UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController
                                    animationControllerForOperation:(UINavigationControllerOperation)operation
                                                 fromViewController:(UIViewController *)fromVC
                                                   toViewController:(UIViewController *)toVC
{
    self.transitionManager.transitionTo = MODAL;
    return self.transitionManager;
}




//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                  animationControllerForOperation:(UINavigationControllerOperation)operation
//                                               fromViewController:(UIViewController *)fromVC
//                                                 toViewController:(UIViewController *)toVC {
//    // Check if we're transitioning from this view controller to a DSLSecondViewController
//    if (fromVC == self && [toVC isKindOfClass:[DSLSecondViewController class]]) {
//        return [[DSLTransitionFromFirstToSecond alloc] init];
//    }
//    else {
//        return nil;
//    }
//}

@end
