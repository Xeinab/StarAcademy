//
//  CardCollectionViewCell.h
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCollectionViewCell : UICollectionViewCell <UIScrollViewDelegate>
{
    UIImageView *mainImageView;
    UIImageView *titleImageView;
    UILabel *titleLabel;
    UILabel *descriptionLabel;
    UILabel *detailsLabel;
    UIView *backgroundView;
    
    UIScrollView *detailsScrollView;
}

@property(nonatomic,retain)IBOutlet UIImageView *mainImageView;
@property(nonatomic,retain)IBOutlet UIImageView *titleImageView;
@property(nonatomic,retain)IBOutlet UILabel *titleLabel;
@property(nonatomic,retain)IBOutlet UILabel *descriptionLabel;
@property(nonatomic,retain)IBOutlet UILabel *detailsLabel;
@property(nonatomic,retain)IBOutlet UIView *backgroundView;
@property(nonatomic,retain)IBOutlet UIScrollView *detailsScrollView;

-(void)initCellView;

@end
