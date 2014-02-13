//
//  UILabel+MultilineAutoSize.m
//  ArdsBoroughCouncil
//
//  Created by Michael Miscampbell on 26/03/2013.
//  Copyright (c) 2013 Ecom Software. All rights reserved.
//

#import "UILabel+MultilineAutoSize.h"

@implementation UILabel (MultilineAutoSize)

- (void)adjustFontSizeToFit
{
    UIFont *font = self.font;
    CGSize size = self.frame.size;
    
    CGFloat minimumFontSize;

#if __IPHONE_OS_VERSION_MAX_ALLOWED__IPHONE_5_0
    minimumFontSize = self.minimumFontSize;
#else
    minimumFontSize = self.minimumScaleFactor;
#endif
    
    
    for (CGFloat maxSize = self.font.pointSize; maxSize >= minimumFontSize; maxSize -= 1.f)
    {
        font = [font fontWithSize:maxSize];
        CGSize constraintSize = CGSizeMake(size.width, MAXFLOAT);
        CGSize labelSize = [self.text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
        if(labelSize.height <= size.height)
        {
            self.font = font;
            [self setNeedsLayout];
            break;
        }
    }
    // set the font to the minimum size anyway
    self.font = font;
    [self setNeedsLayout];
}

@end
