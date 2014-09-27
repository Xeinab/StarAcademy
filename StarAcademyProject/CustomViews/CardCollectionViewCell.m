//
//  CardCollectionViewCell.m
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import "CardCollectionViewCell.h"

@implementation CardCollectionViewCell
@synthesize mainImageView, titleImageView;
@synthesize titleLabel, descriptionLabel, detailsLabel;
@synthesize backgroundView;
@synthesize detailsScrollView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

-(void)initCellView
{
    titleImageView.layer.cornerRadius = 10.0f;
    [titleImageView.layer setMasksToBounds:YES];
    self.backgroundColor = [UIColor clearColor];
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.layer.cornerRadius = 2.0f;
}



@end
