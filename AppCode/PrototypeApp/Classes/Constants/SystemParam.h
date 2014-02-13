//
//  SystemParam.h
//  MaloneGC
//
//  Created by Michael Miscampbell on 01/04/2012.
//  Copyright (c) 2012 MiscampbellAppDesign. All rights reserved.
//

#import <Foundation/Foundation.h>

#define VIEW_OFFSET_iPHONE 120.0

#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SHARING_ICON @"AppIcon_iPhone.png"

#define GOOGLE_MAPS_URL @"http://maps.google.com/maps?f=d&hl=en&saddr=%f,%f&daddr=%@,%@&ie=UTF8&0&om=0&output=kml"

/*******    Static Data PList Files ********/
#define STATICDATA_PLIST_FILE @"StaticData-plist"

/*******    PLIST KEY   ********/
#define SECTIONS_KEY @"SECTIONS"
#define CHAPTERS_KEY @"CHAPTERS"
#define CONTENT_KEY @"CONTENT"

/*******    NOTIFICATIONS KEY   ********/
#define FONT_SLIDER_NOTIFICATION @"FontSliderNotification"
#define ALIGNMENT_CHANGE_NOTIFICATION @"AlignmentChangeNotification"
#define BACKGROUND_CHANGE_NOTIFICATION @"BackgroundChangeNotification"
#define SHARE_CONTENT_NOTIFICATION @"ShareContentNotification"

#define DISABLE_TAP_GESTURE_NOTIFICATION @"DisableTapGestureNotification"

