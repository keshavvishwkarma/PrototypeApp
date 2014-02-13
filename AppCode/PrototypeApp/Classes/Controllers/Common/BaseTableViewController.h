//
//  BaseTableViewController.h
//  PFDNI
//
//  Created by Michael on 04/12/2012.
//  Copyright (c) 2012 Michael Miscampbell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StandardTableViewCell.h"

@interface BaseTableViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@property (nonatomic, strong, readwrite) NSFetchedResultsController *fetcher;

//@property (nonatomic, retain) NSNumber *associatedApiCategoryId;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

- (void) executeFetchedResultsController;

- (NSIndexPath *)mapIndexPathFromFetchedResultsController:(NSIndexPath *)indexPath;

- (NSIndexPath *) mapIndexPathToFetchResultsController:(NSIndexPath *)indexPath;


@end
