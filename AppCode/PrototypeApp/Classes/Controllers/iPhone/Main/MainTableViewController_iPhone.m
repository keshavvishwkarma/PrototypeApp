//
//  MainViewController_iPhone.m
//  ArdsBoroughCouncil
//
//  Created by Michael on 17/01/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "MainTableViewController_iPhone.h"

@interface MainTableViewController_iPhone ()

@property (nonatomic, retain) NSArray *devArray;

@end

@implementation MainTableViewController_iPhone

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

@end
