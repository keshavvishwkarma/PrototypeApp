//
//  SocialMediaTableViewController.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 02/05/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "SocialMediaTableViewController.h"
#import "AppDelegate.h"

#define MEDIAPLAYER_VIEW_TAG 9999

@interface SocialMediaTableViewController ()

@property (nonatomic, strong) LBYouTubePlayerController* lbYouTubePlayerController;

@property (nonatomic, strong) UIViewController *subView;


@end

@implementation SocialMediaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    UIPanGestureRecognizer* pgr = [[UIPanGestureRecognizer alloc]
//                                   initWithTarget:self
//                                   action:@selector(handlePan:)];
//    [_lbYouTubePlayerController.view addGestureRecognizer:pgr];

    UIPanGestureRecognizer* pgr = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(handlePan:)];
    [_subView.view addGestureRecognizer:pgr];
    
    [self executeFetchedResultsController];
}

- (void)viewWillAppear:(BOOL)animated {
//    if ([SocialMedia countOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"feedType == %@",
//                                                   [FeedAPIEnumUtils socialMediaFeedTypeToString:self.selectedFeedType]]] == 0) {
//        [self.tableView triggerPullToRefresh];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Setup TableViews PullToRefresh

- (void) setupPullToRefresh:(UITableView *)tableView {
    
    self.tableView = tableView;
    
    [self executeFetchedResultsController];
    
//    kSocialMediaFeedTypes selectedFeedType = _selectedFeedType;
//    __weak typeof(self) weakSocialMediaFeedType = self;

//    DDLogInfo(@"SocialMediaTableViewController Selected Feed Type: %u", selectedFeedType);
    
    __weak SocialMediaTableViewController *altSelf = self;

    
    [self.tableView addPullToRefreshWithActionHandler:^{
        DDLogWarn(@"Pull To Refresh Activated.");
//        [[[FeedAPI sharedInstance] socialMediaRepository] findFirst:50 socialMediaFeedType:altSelf.selectedFeedType sendNotification:YES];
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
//        [[[FeedAPI sharedInstance] socialMediaRepository] find:50 socialMediaFeedType:altSelf.selectedFeedType sendNotification:YES];
    }];
}

#pragma mark TableView Delegates

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    //    indexPath = [self mapIndexPathToFetchResultsController:indexPath];
    
//    SocialMedia *obj = [self.fetcher objectAtIndexPath:indexPath];
//    
//    SocialMediaTableCell *customCell = (SocialMediaTableCell *)cell;
//    
//    if (_selectedFeedType == Twitter_FeedType) {
//        [customCell.titleLabel setHidden:YES];
//        [customCell.bodyLabel setHidden:NO];
//
//    } else if (_selectedFeedType == YouTube_FeedType) {
//        [customCell.titleLabel setHidden:NO];
//        [customCell.bodyLabel setHidden:YES];
//    }
//    
//    [customCell.titleLabel setText:obj.title];
//    [customCell.titleLabel sizeToFit];
//    
//    [customCell.bodyLabel setText:[obj.body stringByDecodingHTMLEntities]];
////    [customCell.mainImageView setFrame:CGRectMake(customCell.imageView.frame.origin.x, customCell.imageView.frame.origin.y, 48, 48)];
//    
////    [customCell.mainImageView setFrame:CGRectMake(8, 6, 48, 48)];
//    
//    [customCell.mainImageView setImageWithURL:[NSURL URLWithString:obj.image] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [obj.feedType lowercaseString]]]];
//        
////    __weak UIImageView *imgView = customCell.imageView;
//    
////    [customCell.mainImageView setImageWithURL:[NSURL URLWithString:obj.image] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [obj.feedType lowercaseString]]] success:^(UIImage *image, BOOL cached) {
////        [imgView setFrame:CGRectMake(imgView.frame.origin.x, imgView.frame.origin.y, 48, 48)];
////    } failure:^(NSError *error) {
////        
////    }];
////    customCell.imageView.clipsToBounds = YES;
//    
//    //  Attributed String
//    NSString *feedTypeDateString = [NSString stringWithFormat:@"%@ | %@", [obj.feedType uppercaseString], [Utils convertDateToDurationString:obj.submittedDate]];
//    
//    NSMutableAttributedString* attrStr = [NSMutableAttributedString attributedStringWithString:feedTypeDateString];
//	// for those calls we don't specify a range so it affects the whole string
//	[attrStr setFont:[UIFont systemFontOfSize:12]];
//	[attrStr setTextColor:[UIColor black]];
//
//    [attrStr setTextBold:YES range:[feedTypeDateString rangeOfString:[obj.feedType uppercaseString]]];
//
//    [attrStr setTextColor:[UIColor orangeColor] range:[feedTypeDateString rangeOfString:[obj.feedType uppercaseString]]];
//
//    customCell.feedTypeDateLabel.attributedText = attrStr;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetcher sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    id sectionInfo = [[self.fetcher sections] objectAtIndex:section];
//    return [sectionInfo numberOfObjects];
    
    NSInteger numberOfRows = 0;
    
//    if ([[self.fetcher sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetcher sections] objectAtIndex:section];
        numberOfRows = [sectionInfo numberOfObjects];
//    }
    
//    if (section == 0)
//        numberOfRows++;
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RAISE_UNIMPLEMENTED_EXCEPTION(__func__, __LINE__);
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = SOCIALMEDIA_TABLE_VIEW_CELL;
        
//    if (indexPath.section == 0 && indexPath.row == 0) {
//        UITableViewCell *cell;
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//        cell.textLabel.text = NSLocalizedString(@"Header Cell Content", nil);
//        
//        return cell;
//    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [self configureCell:cell atIndexPath:indexPath];
    // Set up the cell...
    return cell;
}

#pragma mark NSFetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController {
    if (self.fetcher != nil) {
        return self.fetcher;
    }
    
//    DDLogWarn(@"AssociatedCategoryId: %@", self.associatedApiCategoryId);
//    
//    if ([_selectedAccountName isNotBlank]) {
//        
//        DDLogInfo(@"Account Name: %@", _selectedAccountName);
//        
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"accountName == %@ AND feedType == %@", _selectedAccountName, [FeedAPIEnumUtils socialMediaFeedTypeToString:_selectedFeedType]];
//        
//        self.fetcher = [SocialMedia fetchAllGroupedBy:nil withPredicate:predicate sortedBy:@"apiUniqueId" ascending:NO delegate:self];
//    } else {
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"feedType == %@", [FeedAPIEnumUtils socialMediaFeedTypeToString:_selectedFeedType]];
//        
//        self.fetcher = [SocialMedia fetchAllGroupedBy:nil withPredicate:predicate sortedBy:@"apiUniqueId" ascending:NO delegate:self];
//    }
    
//    self.fetcher = [APIContent fetchAllGroupedBy:nil withPredicate:nil sortedBy:@"id" ascending:YES delegate:self];

    
    return self.fetcher;
}

//- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
//    
//    indexPath = [self mapIndexPathFromFetchedResultsController:indexPath];
//    newIndexPath = [self mapIndexPathFromFetchedResultsController:newIndexPath];
//    
//    [super controller:controller didChangeObject:anObject atIndexPath:indexPath forChangeType:type newIndexPath:newIndexPath];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    indexPath = [self mapIndexPathToFetchResultsController:indexPath];
    
//    SocialMedia *obj = [self.fetcher objectAtIndexPath:indexPath];
    
//    if (_selectedFeedType == YouTube_FeedType) {
//        
//        _subView = [[UIViewController alloc] init];
//        
//        _subView.view.tag = MEDIAPLAYER_VIEW_TAG;
//        
//        _lbYouTubePlayerController = [[LBYouTubePlayerController alloc] initWithYouTubeURL:[NSURL URLWithString:obj.contentURL] quality:LBYouTubeVideoQualityLarge];
//        _lbYouTubePlayerController.delegate = self;
//        
//        if ([UIDevice isIPad]) {
////            _lbYouTubePlayerController.view.frame = CGRectMake(0.0f, 0.0f, 200.0f, 200.0f);
//            _lbYouTubePlayerController.view.frame = CGRectMake(0.0f, 24.0f, 200.0f, 200.0f);
//
//            [_subView.view setBackgroundColor:[UIColor clearColor]];
//            
//            [_subView.view setFrame:CGRectMake(0.0f, 0.0f, 224.0f, 226.0f)];
//            
//            [_subView.view addSubview:_lbYouTubePlayerController.view];
//            
//            UIButton *closeButton = [[UIButton alloc] initWithFrame: CGRectMake(_subView.view.frame.size.width - 24.0f,
//                                                                                0,
//                                                                                24.0f,
//                                                                                24.0f)];
//            
//            [closeButton addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
//            [closeButton setImage:[UIImage imageNamed:VIDEO_CLOSE_BUTTON] forState:UIControlStateNormal];
//            
//            [_subView.view addSubview:closeButton];
////            [_lbYouTubePlayerController.view addSubview:closeButton];
//            
//        } else {
//            _lbYouTubePlayerController.fullscreen = YES;
//        }
//        
////        _lbYouTubePlayerController.view.center = self.view.center;
//
//        _subView.view.center = self.view.center;
//        
////        [_mainViewController.view addSubview:_lbYouTubePlayerController.view];
//        
////        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        #warning Refactor Required
//        if ([UIDevice isIPad]) {
//            UIWindow* window = [UIApplication sharedApplication].keyWindow;
//            if (!window)
//                window = [[UIApplication sharedApplication].windows objectAtIndex:0];
////            [[[window subviews] objectAtIndex:0] addSubview:_lbYouTubePlayerController.view];
//            [[[window subviews] objectAtIndex:0] addSubview:_subView.view];
//
//        }
//
//        
//    } else {
//        WebViewController *webviewController = [[Utils getStoryboardForDeviceWithIdentifier:UTILITY_STORYBOARD] instantiateViewControllerWithIdentifier:WEBVIEW_VIEW];
//            
//        webviewController.url = [NSURL URLWithString:obj.contentURL];
//        
//        [_mainViewController presentModalViewController:webviewController animated:YES];
//    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - PrepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma mark Notification Processing
- (void) processNotification:(NSNotification *) notification {
    
//    if ([[notification name] isEqualToString:SOCIALMEDIA_PULLTOREFRESH_NOTIFICATION_SUCCESS]) {
//        DDLogWarn(@"Pull To Refresh was successful");
//        [self.tableView.pullToRefreshView stopAnimating];
//    } else if ([[notification name] isEqualToString:SOCIALMEDIA_LOADMORE_NOTIFICATION_SUCCESS]) {
//        DDLogWarn(@"Infinite Scrolling was successful");
//        [self.tableView.infiniteScrollingView stopAnimating];
//    } else     if ([[notification name] isEqualToString:SOCIALMEDIA_PULLTOREFRESH_NOTIFICATION_FAIL]) {
//        DDLogWarn(@"Pull To Refresh was successful");
//        [self.tableView.pullToRefreshView stopAnimating];
//    } else if ([[notification name] isEqualToString:SOCIALMEDIA_LOADMORE_NOTIFICATION_FAIL]) {
//        DDLogWarn(@"Infinite Scrolling was successful");
//        [self.tableView.infiniteScrollingView stopAnimating];
//    }
}

#pragma mark Process SegmentedControl Selection
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    DDLogInfo(@"Selected index %i (via UIControlEventValueChanged)", segmentedControl.selectedSegmentIndex);
    
//    _selectedAccountName = [segmentedControl.sectionTitles objectAtIndex:segmentedControl.selectedSegmentIndex];
//    _selectedFeedType = Twitter_FeedType;
//    
//    self.fetcher = nil;
//    [self.tableView reloadData];
//    
//    [self executeFetchedResultsController];
    
}

//#pragma mark Social Media Feed Type
//- (kSocialMediaFeedTypes) retrieveSocialMediaFeedType {
//    return self.selectedFeedType;
//}

#pragma mark LBYouTubePlayerViewControllerDelegate

-(void)youTubePlayerViewController:(LBYouTubePlayerController *)controller didSuccessfullyExtractYouTubeURL:(NSURL *)videoURL {
    NSLog(@"Did extract video source:%@", videoURL);
}

-(void)youTubePlayerViewController:(LBYouTubePlayerController *)controller failedExtractingYouTubeURLWithError:(NSError *)error {
    NSLog(@"Failed loading video due to error:%@", error);
}

-(void)handlePan:(UIPanGestureRecognizer*)pgr;
{
    if (pgr.state == UIGestureRecognizerStateChanged) {
        CGPoint center = pgr.view.center;
        CGPoint translation = [pgr translationInView:pgr.view];
        center = CGPointMake(center.x + translation.x,
                             center.y + translation.y);
        pgr.view.center = center;
        [pgr setTranslation:CGPointZero inView:pgr.view];
    }
}

- (void) closeView {
    UIView *view = nil;
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    //            [[[window subviews] objectAtIndex:0] addSubview:_lbYouTubePlayerController.view];
        view = [[window subviews] objectAtIndex:0];
    }
    
    for (UIView *views in [window subviews]) {
        DDLogInfo(@"View Tag: %d", views.tag);
        for (UIView *views2 in [views subviews]) {
            DDLogInfo(@"Inner View Tag: %d", views2.tag);
            if (views2.tag == MEDIAPLAYER_VIEW_TAG) {
                [views2 removeFromSuperview];
                [_lbYouTubePlayerController stop];
            }
            
        }
    }    
}

@end
