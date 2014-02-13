//
//  MainViewController_iPad.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 26/04/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "MainTableViewController_iPad.h"
//#import "SocialMediaTableViewController_iPad.h"

@interface MainTableViewController_iPad ()

@end

@implementation MainTableViewController_iPad

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

@end
