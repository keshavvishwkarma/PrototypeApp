//
//  TableViewUtils.m
//  FleadhMobile
//
//  Created by Michael Miscampbell on 07/05/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "TableViewUtils.h"

@implementation TableViewUtils

//+ (void) setTableViewCellSizeForContent:(NSString *)content tableViewLabel:(UILabel *)tableViewLabel {
//    [tableViewLabel setNumberOfLines:0];
//    
//    CGSize constraint;
//    CGSize size;
//    
//    CGFloat width;
//    
//    if ([UIDevice isIPad]) {
//        constraint = CGSizeMake(IPAD_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
//        width = IPAD_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2);
//    } else {
//        constraint = CGSizeMake(IPAD_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
//        width = IPHONE_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2);
//
//    }
//    
//    size = [tableViewLabel.text sizeWithFont:[UIFont systemFontOfSize:GENERAL_DETAILVIEW_FONT_SIZE]
//                           constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
//
//    [tableViewLabel setFrame:CGRectMake(GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN,
//                                        GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN,
//                                        width,
//                                        MAX(size.height, 44.0f))];
//}

+ (CGFloat) getTableViewCellHeightForContent:(NSString *)content withFontSize:(CGFloat)requiredFontSize withMarginSize:(CGFloat)marginSize {
        
    CGSize constraint;
    CGSize size;
    
    if (marginSize == 0) {
        marginSize = GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN;
    }
    
    
    if ([UIDevice isIPad]) {
        //        constraint = CGSizeMake(IPAD_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
        constraint = CGSizeMake(SCREEN_WIDTH - (marginSize * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
        
    } else {
        //        constraint = CGSizeMake(IPHONE_GENERAL_DETAILVIEW_CELL_CONTENT_WIDTH - (GENERAL_DETAILVIEW_CELL_CONTENT_MARGIN * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
        constraint = CGSizeMake(SCREEN_WIDTH - (marginSize * 2), GENERAL_DETAILVIEW_CELL_MAX_HEIGHT);
        
    }
    
    if (requiredFontSize == 0) {
        requiredFontSize = GENERAL_DETAILVIEW_FONT_SIZE;
    }
    
    size = [content sizeWithFont:[UIFont systemFontOfSize:requiredFontSize]
               constrainedToSize:constraint
                   lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    return height + (marginSize * 2);
}

+ (CGFloat) getTableViewCellHeightForContentExtension:(NSString *)content withFontSize:(CGFloat)requiredFontSize {
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
    
    if (requiredFontSize == 0) {
        size = [content sizeWithFont:[UIFont systemFontOfSize:GENERAL_DETAILVIEW_FONT_SIZE]
                           constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    } else {
        size = [content sizeWithFont:[UIFont systemFontOfSize:requiredFontSize]
                   constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    return MAX(size.height, 44.0f);

}




+ (CGFloat) getTableViewCellHeightForContent:(NSString *)content {
    return [self getTableViewCellHeightForContent:content withFontSize:0 withMarginSize:0];
}

+ (CGFloat) getTableViewCellHeightForImage:(UITableView *)tableView {
    
    if ([UIDevice isIPad]) {
        return 165;
    } else {
        CGRect tableViewDimensions = tableView.bounds;
                
        return (tableViewDimensions.size.width / DEFAULT_MAIN_IMAGE_WIDTH) * DEFAULT_MAIN_IMAGE_HEIGHT;
    }
}

@end
