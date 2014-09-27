//
//  MainViewController.h
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SAMGradientView/SAMGradientView.h>

@interface MainViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate, UIScrollViewDelegate>
{
    UICollectionView *cardsCollectionView;
    NSMutableArray *cardsInfo;
    SAMGradientView *gradientView;
    
    UIButton *infoButton;
    UIButton *shareButton;
    
    UILabel *nameLabel;
    UILabel *nationalityLabel;
    UILabel *ageLabel;
    
    UIScrollView *detailsScrollView;
    
    int screenWidth;
    int gradientHeightExpanded;
    
    NSString *nibName;
    NSString *placeHolderURL;
    CGSize itemCellSize;
}
@property (nonatomic,retain) IBOutlet UICollectionView *cardsCollectionView;
@property (nonatomic,retain) IBOutlet SAMGradientView *gradientView;
@property (nonatomic,retain) IBOutlet UIButton *infoButton;
@property (nonatomic,retain) IBOutlet UIButton *shareButton;

@property (nonatomic,retain) IBOutlet UILabel *nameLabel;
@property (nonatomic,retain) IBOutlet UILabel *nationalityLabel;
@property (nonatomic,retain) IBOutlet UILabel *ageLabel;
@property (nonatomic,retain) IBOutlet UIScrollView *detailsScrollView;


@end
