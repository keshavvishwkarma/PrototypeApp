//
//  BiographyTableCell.h
//  ArdsBoroughCouncil
//
//  Created by Michael Miscampbell on 06/02/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "UITableViewCell+BaseTableViewCell.h"

@interface StandardTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *baseImageView;
@property (nonatomic, retain) IBOutlet UILabel *baseTitle;
@property (nonatomic, retain) IBOutlet UILabel *baseSubTitle;

@property (nonatomic, retain) IBOutlet UILabel *baseContent;

@property (nonatomic, retain) IBOutlet UILabel *baseCreatedDate;

@property (nonatomic, retain) IBOutlet UILabel *idLabel;

@property (nonatomic, retain) IBOutlet UIView *baseBackgroundView;

@property (nonatomic, retain) IBOutlet UIView *baseSeperator;

@property (nonatomic, retain) BaseViewController *delegate;


@end
