//
//  ChapterViewController.m
//  PrototypeApp
//
//  Created by App Development on 29/07/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import "ChapterViewController.h"

@interface ChapterViewController ()

@property (nonatomic, retain) IBOutlet UITextView *textView;

@property (nonatomic, retain) NSArray *chapterArray;

@end

@implementation ChapterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setOpaque:YES];
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    
	// Do any additional setup after loading the view.
    Section *section = [Section findFirstByAttribute:@"id" withValue:_selectedSectionId];

    [self.navigationItem setTitle:section.title];
    
    _chapterArray = [Chapter findAllWithPredicate:[NSPredicate predicateWithFormat:@"section_id == %@", _selectedSectionId]];
    
    UIEdgeInsets edgeInsets = self.tableView.contentInset;
    edgeInsets.top = 64;
    
    [self.tableView setContentInset:edgeInsets];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Delegates

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = STANDARD_TABLE_VIEW_CELL;
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [self configureCell:cell atIndexPath:indexPath];
    // Set up the cell...
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_chapterArray count];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    Chapter *chapter = [_chapterArray objectAtIndex:indexPath.row];
    
    StandardTableViewCell *customCell = (StandardTableViewCell *)cell;
    
    customCell.baseTitle.text = chapter.title;
    [customCell.baseTitle setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight-Bold" size:20]];
    
    [customCell.baseBackgroundView setBackgroundColor:[UIColor clearColor]];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RAISE_UNIMPLEMENTED_EXCEPTION(__func__, __LINE__);
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Chapter *chapter = [_chapterArray objectAtIndex:indexPath.row];
    
    UIStoryboard *storyboard = [Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD];
    PageViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:PAGE_CONTROLLER_VIEW];
    [viewController setSelectedId:chapter.id];
    
    
    [self.navigationController presentViewController:viewController animated:YES completion:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

#pragma mark Header View Section
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    Chapter *chapter = [_chapterArray objectAtIndex:section];
//    Section *sectionObj = [Section findFirstByAttribute:@"id" withValue:chapter.section_id];
//    
//    static NSString *HeaderCellIdentifier = STANDARD_TABLE_VIEW_CELL;
//    
//    StandardTableViewCell *headerCell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
//    
//    [headerCell.baseTitle setText:sectionObj.title];
//    [headerCell.baseTitle setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20]];
//    
//    return headerCell;
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 80;
    return 0;
}



@end
