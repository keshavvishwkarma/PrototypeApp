//
//  PageViewController.m
//  PrototypeApp
//
//  Created by App Development on 23/10/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@property (nonatomic, retain) NSArray *contentArrayForChapter;

//  PageViewController Properties
@property (nonatomic, retain) IBOutlet UILabel *pageViewerTitle;

@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, retain) IBOutlet UIToolbar *topToolabr;
@property (nonatomic, retain) IBOutlet UIToolbar *bottomToolbar;

@property BOOL navigationToggle;

@end

@implementation PageViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    //  Set Toolbar Delegate
    [_topToolabr setDelegate:self];
    
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];
    self.navigationToggle = YES;
    
    Chapter *chapter = [Chapter findFirstByAttribute:@"id" withValue:self.selectedId];
    [self.pageViewerTitle setText:chapter ? chapter.title : @"-"];
    [self.pageViewerTitle setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
    
    
    [self loadContentForChapter];
    [self setupPageViewController];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent];
}

- (void) setupPageViewController {
    //  Configure Sliders
    UITapGestureRecognizer *tapGestureRecogniser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleToolbars:)];
    [_contentView addGestureRecognizer:tapGestureRecogniser];
    [tapGestureRecogniser setDelegate:self];
}

- (void) toggleToolbars:(UITapGestureRecognizer *)gestureRecogniser
{
    [UIView animateWithDuration:1.0 animations:^(void){
        CGRect topToolbarFrame = _topToolabr.frame;
        CGRect bottomToolbarFrame = _bottomToolbar.frame;
        
        if (topToolbarFrame.origin.y < 0)
        {
            topToolbarFrame.origin.y += topToolbarFrame.size.height + 20;
            bottomToolbarFrame.origin.y -= bottomToolbarFrame.size.height;
        }
        else
        {
            topToolbarFrame.origin.y -= topToolbarFrame.size.height + 20;
            bottomToolbarFrame.origin.y += bottomToolbarFrame.size.height;
        }

        [_topToolabr setFrame:topToolbarFrame];
        [_bottomToolbar setFrame:bottomToolbarFrame];
        
    } completion:^(BOOL finished){
        
    }];
}

- (void) loadContentForChapter
{
    _contentArrayForChapter = [Content findAllSortedBy:@"id" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"chapter_id == %@", [NSNumber numberWithInt:0]]];
    self.index = 0;
    if ([_contentArrayForChapter count] > 0)
    {
        //  Setting Initial View Controller
        NSArray *viewControllers = [NSArray arrayWithObject:[self viewControllerAtIndex:self.index]];
        
        [self.basePageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        [self.basePageViewController.view setFrame:self.view.frame];
        [self addChildViewController:self.basePageViewController];
        
        [self.contentView addSubview:self.basePageViewController.view];
//        [self.view sendSubviewToBack:self.basePageViewController.view];
        
        [self.basePageViewController didMoveToParentViewController:self];
        
//        // Add Touch Gesture Recognise
//        UITapGestureRecognizer *tapGestureRecogniser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleNavigationControls:)];
//        [self.basePageViewController.view addGestureRecognizer:tapGestureRecogniser];
    }
    
}

#pragma mark PageViewController Methods

- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    // Return the data view controller for the given index.
    if (([self.contentArrayForChapter count] == 0) ||
        (index >= [self.contentArrayForChapter count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    UIStoryboard *storyboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
    
    ContentViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:CONTENT_VIEW];
    dataViewController.content = self.contentArrayForChapter[index];
    dataViewController.delegate = self;
    
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(ContentViewController *)viewController
{
    return [_contentArrayForChapter indexOfObject:viewController.content];
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerBeforeViewController:
(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
                        (ContentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
                        (ContentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.contentArrayForChapter count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

- (IBAction)onDismissView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Toolbar Delegate

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
    if ([bar isEqual:_topToolabr])
    {
        return UIBarPositionTopAttached;
    }
    return UIBarPositionAny;
}

@end
