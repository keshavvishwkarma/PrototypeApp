//
//  TableViewUtils.h
//  FleadhMobile
//
//  Created by Michael Miscampbell on 07/05/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewUtils : NSObject

+ (CGFloat) getTableViewCellHeightForContent:(NSString *)content;

+ (CGFloat) getTableViewCellHeightForImage:(UITableView *)tableView;

+ (CGFloat) getTableViewCellHeightForContent:(NSString *)content withFontSize:(CGFloat)requiredFontSize withMarginSize:(CGFloat)marginSize;

+ (CGFloat) getTableViewCellHeightForContentExtension:(NSString *)content withFontSize:(CGFloat)requiredFontSize;

@end
