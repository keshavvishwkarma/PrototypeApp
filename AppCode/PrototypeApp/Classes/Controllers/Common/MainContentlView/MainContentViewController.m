//
//  MainContentViewController.m
//  PrototypeApp
//
//  Created by App Development on 28/07/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import "MainContentViewController.h"

@interface MainContentViewController ()

@property (nonatomic, retain) UIPageViewController *pageViewController;
@property (nonatomic, retain) NSMutableArray *pages;
@property (nonatomic, retain) IBOutlet UIView *contentView;

@end

@implementation MainContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewController.dataSource = self;
    [[self.pageViewController view] setFrame:[[self contentView] bounds]];
    
    UIStoryboard *storyboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
    ChapterViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ChapterView"];

//    APPChildViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:viewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [[self contentView] addSubview:[self.pageViewController view]];
    [self.pageViewController didMoveToParentViewController:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void) awakeFromNib {
//    [super awakeFromNib];
//    [self createPages];
//    self.dataSource = self;
//    [self setViewControllers:[NSArray arrayWithObject:[self.pages objectAtIndex:0]]
//                                      direction:UIPageViewControllerNavigationDirectionForward
//                                       animated:true
//                                     completion:nil];
//}

- (void) createPages {
    self.pages = [[NSMutableArray alloc] initWithCapacity:4];
    ChapterViewController *viewController;
    
    UIStoryboard *storyboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
    for (int i=0; i < 4; i++) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:@"ChapterView"];
        [self.pages addObject:viewController];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
//    ChapterViewController *view = nil;
//    if ([self.pages objectAtIndex:0] != viewController) {
//        for (int i= 3; i > 0; i--) {
//            if ([self.pages objectAtIndex:i] == viewController) {
//                view = [self.pages objectAtIndex:i+1];
//                break;
//            }
//        }
//    }
//    return view;
    UIStoryboard *storyboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
    
    viewController = [storyboard instantiateViewControllerWithIdentifier:@"ChapterView"];
    
    return viewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
//    ChapterViewController *view = nil;
//    if ([self.pages objectAtIndex:3] != viewController) {
//        for (int i=0; i < 3; i++) {
//            if ([self.pages objectAtIndex:i] == viewController) {
//                view = [self.pages objectAtIndex:i+1];
//                break;
//            }
//        }
//    }
//    return view;
    
    UIStoryboard *storyboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
    
    viewController = [storyboard instantiateViewControllerWithIdentifier:@"ChapterView"];
    
    return viewController;
}

@end
