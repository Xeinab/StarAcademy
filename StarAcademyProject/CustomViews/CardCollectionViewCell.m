//
//  CardCollectionViewCell.m
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import "CardCollectionViewCell.h"
#import "Common.h"

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
    [self setUpLanguage];
    titleImageView.layer.cornerRadius = 10.0f;
    [titleImageView.layer setMasksToBounds:YES];
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 2.0f;
    NSTextAlignment alignment;
    if (isArabicSupport)
    {
        alignment = NSTextAlignmentRight;
    }
    else
    {
        alignment = NSTextAlignmentLeft;
    }
    titleLabel.textAlignment = alignment;
    descriptionLabel.textAlignment = alignment;
    detailsLabel.textAlignment = alignment;
}

-(void)setUpLanguage
{
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([language isEqualToString:LANGUAGE_ARABIC])
    {
        isArabicSupport = YES;
    }
}




@end
