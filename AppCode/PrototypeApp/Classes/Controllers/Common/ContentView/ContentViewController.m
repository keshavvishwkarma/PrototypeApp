//
//  ContentViewController.m
//  PrototypeApp
//
//  Created by App Development on 23/10/2013.
//  Copyright (c) 2013 Miscampbell App Design. All rights reserved.
//

#import "ContentViewController.h"
#import "ImagesCollectionViewController_iPhone.h"

@interface ContentViewController ()

@property (nonatomic, strong) IBOutlet UITextView *contentTextView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic, strong) IBOutlet UIButton *imagesViewButton, *videosViewButton;

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecogniser;

//@property (nonatomic, strong) ImagesCollectionViewController *imagesCollectionView;
@property (nonatomic, strong) UIView *containerImagesCollectionView;

@property (nonatomic, strong) UICollectionView *videosCollectionView;

@end

@implementation ContentViewController
{
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravityBehaviour;
    UICollisionBehavior *_collisionBehaviour;
    UIDynamicItemBehavior *_elasticityBehavior;
    UIAttachmentBehavior *_attachmentBehaviour;
}

@synthesize contentTextView = _contentTextView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    _containerImagesCollectionView = [[UIView alloc] initWithFrame:CGRectMake(_contentScrollView.frame.origin.x,
                                                                              _imagesViewButton.frame.origin.y + _imagesViewButton.frame.size.height,
                                                                              _contentScrollView.frame.size.width,
                                                                              _contentScrollView.frame.size.height)];
    
    NSLog(@"BEFORE: Container ImagesCollection View Frame: %@", NSStringFromCGRect([_containerImagesCollectionView frame]));
    NSLog(@"BEFORE: Container ImagesCollection View Bounds: %@", NSStringFromCGRect([_containerImagesCollectionView bounds]));
    
    [_containerImagesCollectionView setBackgroundColor:[UIColor blueGreen]];
    [_containerImagesCollectionView.layer setOpacity:0.7];
    [_containerImagesCollectionView setTintAdjustmentMode:UIViewTintAdjustmentModeAutomatic];
    [_containerImagesCollectionView setTintColor:[UIColor orangeColor]];
    
    [_contentScrollView addSubview:_containerImagesCollectionView];
    
    ImagesCollectionViewController *imagesCollectionView = [[Utils getStoryboardForDeviceWithIdentifier:MAIN_STORYBOARD] instantiateViewControllerWithIdentifier:IMAGES_VIEW];
    [imagesCollectionView.view setFrame:_containerImagesCollectionView.bounds];
    
    [_containerImagesCollectionView addSubview:imagesCollectionView.view];
    
    [self addChildViewController:imagesCollectionView];
    
    NSLog(@"AFTER: Container ImagesCollection View Frame: %@", NSStringFromCGRect([_containerImagesCollectionView frame]));
    NSLog(@"AFTER: Container ImagesCollection View Bounds: %@", NSStringFromCGRect([_containerImagesCollectionView bounds]));
    
    [_contentScrollView bringSubviewToFront:_imagesViewButton];
    
    UIPanGestureRecognizer *imagesButtonPanGestureRecogniser = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveButton:)];
    [imagesButtonPanGestureRecogniser setDelegate:self];
    [_imagesViewButton addGestureRecognizer:imagesButtonPanGestureRecogniser];
    [_imagesViewButton addTarget:self action:@selector(onAddGravityToImageViewButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIPanGestureRecognizer *videosButtonPanGestureRecogniser = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveButton:)];
    [videosButtonPanGestureRecogniser setDelegate:self];
    [_videosViewButton addGestureRecognizer:videosButtonPanGestureRecogniser];
    [_videosViewButton addTarget:self action:@selector(onAddGravityToVideosViewButton) forControlEvents:UIControlEventTouchUpInside];

}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

}

- (void) onAddGravityToImageViewButton
{
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:_contentScrollView];
    _gravityBehaviour = [[UIGravityBehavior alloc] init];
    [_gravityBehaviour addItem:_imagesViewButton];
    [_gravityBehaviour addItem:_containerImagesCollectionView];
    
//    [_gravityBehaviour setAngle:0.0 magnitude:1.0];
    
    _collisionBehaviour = [[UICollisionBehavior alloc] init];
    [_collisionBehaviour addItem:_imagesViewButton];
    _collisionBehaviour.translatesReferenceBoundsIntoBoundary = YES;
    
    UICollisionBehavior *secondCollisionBehaviour = [[UICollisionBehavior alloc] init];
    [secondCollisionBehaviour addItem:_containerImagesCollectionView];
    [secondCollisionBehaviour setCollisionMode:UICollisionBehaviorModeEverything];
//    [secondCollisionBehaviour set]

    [_animator addBehavior:_gravityBehaviour];
    [_animator addBehavior:_collisionBehaviour];
}

- (void) onAddGravityToVideosViewButton
{
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:_contentScrollView];
    _gravityBehaviour = [[UIGravityBehavior alloc] init];
    [_gravityBehaviour addItem:_videosViewButton];
    [_gravityBehaviour addItem:_containerImagesCollectionView];
    
    _collisionBehaviour = [[UICollisionBehavior alloc] init];
    [_collisionBehaviour addItem:_videosViewButton];
    _collisionBehaviour.translatesReferenceBoundsIntoBoundary = YES;
    
    [_animator addBehavior:_gravityBehaviour];
    [_animator addBehavior:_collisionBehaviour];
}

- (void)moveButton:(UIPanGestureRecognizer *) gestureRecognizer
{
    UIView *piece = [gestureRecognizer view];
    
//    CGPoint locationInView = [gestureRecognizer locationInView:piece];
    
    CGPoint translation = [gestureRecognizer translationInView:[piece superview]];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged)
    {
        [_animator removeAllBehaviors];
        
        //  Translation required:
        //  This will work out the amount the view has moved
//        CGPoint translation = [gestureRecognizer translationInView:[piece superview]];
        NSLog(@"Translation: %@", NSStringFromCGPoint(translation));
        
        //  Center
        //  This will show the updated center point of the view
        CGPoint newCenter = CGPointMake(gestureRecognizer.view.center.x,
                                        gestureRecognizer.view.center.y + translation.y);
        NSLog(@"New Center: %@", NSStringFromCGPoint(newCenter));
        
        //  Origin
        //  This will show the new origin of the view including its height
        CGPoint newOrigin = CGPointMake(piece.center.x, piece.frame.origin.y + translation.y + piece.frame.size.height);
        NSLog(@"New Origin: %@", NSStringFromCGPoint(newOrigin));
        
        NSLog(@"Content ScrollView Frame: %@", NSStringFromCGRect(_contentScrollView.frame));
        
        NSLog(@"Title Label Frame: %@", NSStringFromCGRect(_titleLabel.frame));
        
        NSLog(@"Images Collection View Frame: %@", NSStringFromCGRect(_containerImagesCollectionView.frame));

        if (newOrigin.y <= _contentScrollView.frame.size.height && newOrigin.y >= _titleLabel.frame.origin.y + _titleLabel.frame.size.height)
        {
            NSLog(@"GestureRecognizer View Center: %@", NSStringFromCGPoint(CGPointMake(gestureRecognizer.view.center.x,
                                                                                        gestureRecognizer.view.center.y + translation.y)));
            gestureRecognizer.view.center = CGPointMake(gestureRecognizer.view.center.x,
                                                        gestureRecognizer.view.center.y + translation.y);

            //  If below code is commented out gesture works without issue
            NSLog(@"ContainerImagesCollectionView Center: %@", NSStringFromCGPoint(CGPointMake(_containerImagesCollectionView.center.x,
                                                                                        _containerImagesCollectionView.center.y + translation.y)));
            
            _containerImagesCollectionView.center = CGPointMake(_containerImagesCollectionView.center.x,
                                                       _containerImagesCollectionView.center.y + translation.y);
            
//            CGRect frame;
//            frame = _containerImagesCollectionView.frame;
//            frame.origin.y = frame.origin.y + translation.y;
//            _containerImagesCollectionView.frame = frame;
            
            [gestureRecognizer setTranslation:CGPointZero inView:_contentScrollView];
        }
        

    }
    else if ([gestureRecognizer state] == UIGestureRecognizerStateEnded)
    {
        NSLog(@"Gesture Recogniser State: Ended");
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
