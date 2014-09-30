//
//  MainViewController.h
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SAMGradientView/SAMGradientView.h>

@interface MainViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate, UIScrollViewDelegate, UIToolbarDelegate>
{
    UICollectionView *cardsCollectionView;
    NSMutableArray *cardsInfo;
    SAMGradientView *gradientView;
    UIToolbar *toolBar;
    
    UIButton *infoButton;
    UIButton *shareButton;
    
    UIScrollView *detailsScrollView;
    
    int screenWidth;
    int gradientHeightExpanded;
    
    NSString *nibName;
    NSString *placeHolderURL;
    CGSize itemCellSize;
    
    BOOL isArabicSupport;
    
    NSString *nameValue;
    NSString *ageValue;
    NSString *nationalityValue;
    
    int iPadIndentation;
    int iPadIndentationForSecondLabel;;
    
}
@property (nonatomic,retain) IBOutlet UICollectionView *cardsCollectionView;
@property (nonatomic,retain) IBOutlet SAMGradientView *gradientView;
@property (nonatomic,retain) IBOutlet UIButton *infoButton;
@property (nonatomic,retain) IBOutlet UIButton *shareButton;
@property (nonatomic,retain) IBOutlet UIScrollView *detailsScrollView;
@property (nonatomic,retain) IBOutlet UIToolbar *toolBar;


@end
