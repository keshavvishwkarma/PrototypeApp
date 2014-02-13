//
//  SocialMediaTableViewController.h
//  FleadhMobile
//
//  Created by Michael Miscampbell on 02/05/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "BaseTableViewController.h"
#import "SocialMediaTableCell.h"

#import <LBYouTubeView/LBYouTubePlayerController.h>
#import "VideoPlayerViewController.h"

@interface SocialMediaTableViewController : BaseTableViewController <LBYouTubePlayerControllerDelegate>

@property (nonatomic, retain) UIViewController *mainViewController;

//@property (nonatomic) kSocialMediaFeedTypes selectedFeedType;
@property (nonatomic, retain) NSString *selectedAccountName;

- (void) setupPullToRefresh:(UITableView *)tableView;

@end
