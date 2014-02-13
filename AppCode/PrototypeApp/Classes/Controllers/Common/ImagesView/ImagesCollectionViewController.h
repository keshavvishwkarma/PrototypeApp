//
//  ImagesTableViewController.h
//  PrototypeApp
//
//  Created by App Development on 09/11/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import "BaseViewController.h"
#import <IDMPhotoBrowser/IDMPhotoBrowser.h>

@interface ImagesCollectionViewController : BaseViewController <IDMPhotoBrowserDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end
