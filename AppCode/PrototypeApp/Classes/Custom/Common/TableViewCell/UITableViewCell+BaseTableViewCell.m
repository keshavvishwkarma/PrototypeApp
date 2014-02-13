//
//  UITableViewCell+BaseTableViewCell.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 26/04/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "UITableViewCell+BaseTableViewCell.h"

@implementation UITableViewCell (BaseTableViewCell)

- (void) setImageViewWithBorder:(UIImageView *)imageView
{
    //    imageView.layer.masksToBounds = YES;
    //    imageView.layer.cornerRadius = 10.0;
    imageView.layer.borderWidth = 1.0;
    imageView.layer.borderColor = [[UIColor blackColor] CGColor];
}

- (void)resetCell {
    RAISE_UNIMPLEMENTED_EXCEPTION(__func__, __LINE__);
}

- (void) setTableViewCellSizeForUILabel:(UILabel *)tableViewLabel withContent:(NSString *)content {
    [self setTableViewCellSizeForUILabel:tableViewLabel withContent:content withFontSize:0 useLabelDimensions:NO];
}

- (void) setTableViewCellSizeForUILabel:(UILabel *)tableViewLabel withContent:(NSString *)content withFontSize:(CGFloat)requiredFontSize useLabelDimensions:(BOOL)labelDimensions {    
    [tableViewLabel setNumberOfLines:0];
    if (requiredFontSize == 0) {
        [tableViewLabel setMinimumScaleFactor:GENERAL_DETAILVIEW_FONT_SIZE];
        [tableViewLabel setFont:[UIFont systemFontOfSize:GENERAL_DETAILVIEW_FONT_SIZE]];
    } else {
        [tableViewLabel setMinimumScaleFactor:requiredFontSize];
        [tableViewLabel setFont:[UIFont systemFontOfSize:requiredFontSize]];
    }
    [tableViewLabel setLineBreakMode:NSLineBreakByWordWrapping];
    
    [tableViewLabel setText:content];
    
    CGSize constraint;
    CGSize size;
    
    CGFloat width;
    
    if ([UIDevice isIPad]) {
        //        constraint = CGSizeMake(IPAD_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
        //        width = IPAD_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2);
        
        constraint = CGSizeMake(SCREEN_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
        width = SCREEN_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2);
    } else {
        //        constraint = CGSizeMake(IPHONE_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
        //        width = IPHONE_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2);
        
        constraint = CGSizeMake(SCREEN_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
        width = SCREEN_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2);
        
    }
    
    size = [tableViewLabel.text sizeWithFont:[UIFont systemFontOfSize:GENERAL_DETAILVIEW_FONT_SIZE]
                           constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    if (labelDimensions) {
        [tableViewLabel setFrame:CGRectMake(tableViewLabel.frame.origin.x,
                                            tableViewLabel.frame.origin.y,
//                                            width,
                                            tableViewLabel.frame.size.width,
                                            MAX(size.height, 44.0f))];
    } else {
        [tableViewLabel setFrame:CGRectMake(GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN,
                                            GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN,
                                            width,
                                            MAX(size.height, 44.0f))];
    }
    
}

@end
