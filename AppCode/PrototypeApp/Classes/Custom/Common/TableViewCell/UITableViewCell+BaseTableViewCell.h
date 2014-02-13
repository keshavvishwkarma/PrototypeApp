//
//  UITableViewCell+BaseTableViewCell.h
//  FleadhMobile
//
//  Created by Michael Miscampbell on 26/04/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface UITableViewCell (BaseTableViewCell)

- (void) setImageViewWithBorder:(UIImageView *)imageView;

- (void)resetCell;

- (void) setTableViewCellSizeForUILabel:(UILabel *)tableViewLabel withContent:(NSString *)content;

- (void) setTableViewCellSizeForUILabel:(UILabel *)tableViewLabel withContent:(NSString *)content withFontSize:(CGFloat)requiredFontSize useLabelDimensions:(BOOL)labelDimensions;


@end
