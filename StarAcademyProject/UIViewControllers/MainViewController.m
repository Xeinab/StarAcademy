//
//  MainViewController.m
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import "MainViewController.h"
#import "CardCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "CardInfo.h"
#import <QuartzCore/QuartzCore.h>
#import "Common.h"
#import "ShareToViewController.h"

#define SLIDE_TIMING .5
#define ITEM_CELL_SIZE_IPHONE CGSizeMake(170,200)
#define ITEM_CELL_SIZE_IPAD CGSizeMake(310,277)
#define GRADIENT_HEIGHT_IPHONE 328
#define GRADIENT_HEIGHT_IPAD 500
#define PLACEHOLDER_IPHONE @"180x90"
#define PLACEHOLDER_IPAD @"302x109"


@implementation MainViewController
@synthesize cardsCollectionView;
@synthesize gradientView;
@synthesize detailsScrollView;
@synthesize infoButton, shareButton;
@synthesize toolBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self setUpLanguage];
    [self setUpForIphoneOrIpad];
    [self initNavigationBar];
    [self setUpDataForCardsOfCount :15];
    [self initCollectionView];
    [self initGradientView];
    [self initDetailsView];
    [self setupDetailsView];
}



-(void)setUpLanguage
{
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([language isEqualToString:LANGUAGE_ARABIC])
    {
        isArabicSupport = YES;
        nameValue = @"محمود المصري";
        nationalityValue = @"الجنسية مصري";
        ageValue = @"العمر ٢٤ سنة";
    }
    else
    {
        nameValue = @"Mahmoud Almasri";
        nationalityValue = @"Egyption Nationality";
        ageValue = @"Age of 24 years";
    }
}


-(void)setUpForIphoneOrIpad
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        screenWidth = 768;
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Arrow_iPad.jpg"]]];
        nibName = @"CardCollectionViewCell_iPad";
        itemCellSize = ITEM_CELL_SIZE_IPAD;
        gradientHeightExpanded = GRADIENT_HEIGHT_IPAD;
        placeHolderURL = [NSString stringWithFormat:@"http://placehold.it/%@",PLACEHOLDER_IPAD];
    }
    else
    {
        screenWidth = 320;
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Arrow.png"]]];
         nibName = @"CardCollectionViewCell_iPhone";
        itemCellSize = ITEM_CELL_SIZE_IPHONE;
        gradientHeightExpanded = GRADIENT_HEIGHT_IPHONE;
        placeHolderURL = [NSString stringWithFormat:@"http://placehold.it/%@",PLACEHOLDER_IPHONE];
    }
}

-(void)initNavigationBar
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleView.backgroundColor = [UIColor clearColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [titleLabel setTextColor:GREEN_COLOR];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:NSLocalizedString(@"SA_STUDENTS", @"")];
    [titleView addSubview:titleLabel];
    [self.navigationItem setTitleView:titleView];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}

-(void)setUpDataForCardsOfCount :(int)counter
{
    cardsInfo = [NSMutableArray array];
    for (int i = 0; i < counter; i++)
    {
        UIColor *randomRGBColor = [[UIColor alloc] initWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0 blue:arc4random()%256/256.0 alpha:1.0];

        CardInfo *cardInfo = [CardInfo initWithTitle:[NSString stringWithFormat:@"%@%d",NSLocalizedString(@"SA_TITLE", @""),i] andDescription:[NSString stringWithFormat:@"%@%d",NSLocalizedString(@"SA_DESCRIPTION", @""),i] andDetails:[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"SA_DETAILS", @""),i] andColor:randomRGBColor];
        
        [cardsInfo addObject:cardInfo];
    }
}

-(void)initCollectionView
{
    UINib *cellNib = [UINib nibWithNibName:nibName bundle:nil];
    [cardsCollectionView registerNib:cellNib forCellWithReuseIdentifier:nibName];
   
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:itemCellSize];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [cardsCollectionView setCollectionViewLayout:flowLayout];
}

-(void)initGradientView
{
    gradientView.gradientColors = @[[UIColor blackColor], GRAY_COLOR];
    [gradientView setAlpha:0.8f];
}

-(void)initDetailsView
{
    int x = 0;
    int buttonX = 0;
    NSTextAlignment alignment;
    if (isArabicSupport)
    {
        x = 110;
        buttonX = 8;
        alignment =  NSTextAlignmentRight;
    }
    else
    {
        x = 8;
        buttonX = 250;
        alignment = NSTextAlignmentLeft;
    }

    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, 14, 22, 22)];
    [infoButton setImage:[UIImage imageNamed:@"Info.png"] forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfoView:) forControlEvents:UIControlEventTouchUpInside];
    
    shareButton = [[UIButton alloc]initWithFrame:CGRectMake(buttonX + 37, 13, 22, 22)];
    [shareButton setImage:[UIImage imageNamed:@"Share.png"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(goToShareView:) forControlEvents:UIControlEventTouchUpInside];

    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, 2, 200, 21)];
    [nameLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [nameLabel setTextColor:[UIColor whiteColor]];
    
    UILabel *nationalityLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, 26, 200, 21)];
    [nationalityLabel setFont:[UIFont systemFontOfSize:14]];
    [nationalityLabel setTextColor:[UIColor whiteColor]];
    
    UILabel *ageLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, 47, 200, 21)];
    [ageLabel setFont:[UIFont systemFontOfSize:14]];
    [ageLabel setTextColor:[UIColor whiteColor]];
    
    nameLabel.text = nameValue;
    nationalityLabel.text = nationalityValue;
    ageLabel.text = ageValue;
    
    nameLabel.textAlignment = alignment;
    nationalityLabel.textAlignment = alignment;
    ageLabel.textAlignment = alignment;
    
    [self.view addSubview:infoButton];
    [self.view addSubview:shareButton];
    [self.view addSubview:nameLabel];
    [self.view addSubview:nationalityLabel];
    [self.view addSubview:ageLabel];
}


-(void)setupDetailsView
{
    NSMutableArray *details = [NSMutableArray arrayWithObjects:NSLocalizedString(@"SA_HOROSCOPE", @""),NSLocalizedString(@"SA_LION", @""),
                                    NSLocalizedString(@"SA_MAJOR", @""),NSLocalizedString(@"SA_BUSINESS", @""),
                                    NSLocalizedString(@"SA_HOBBIES", @""),NSLocalizedString(@"SA_SINGING", @""),
                                    NSLocalizedString(@"SA_COLOR", @""),NSLocalizedString(@"SA_BLUE", @""),
                                    NSLocalizedString(@"SA_BEST_DISH", @""),NSLocalizedString(@"SA_SPAGHETTI", @""),
                                    NSLocalizedString(@"SA_BEST_MOVIE", @""),NSLocalizedString(@"SA_ALF_MABROOK", @""),
                                    NSLocalizedString(@"SA_KEY", @""),NSLocalizedString(@"SA_VALUE", @""),
                                    NSLocalizedString(@"SA_KEY", @""),NSLocalizedString(@"SA_VALUE", @""),
                                    NSLocalizedString(@"SA_KEY", @""),NSLocalizedString(@"SA_VALUE", @""),
                                    NSLocalizedString(@"SA_KEY", @""),NSLocalizedString(@"SA_VALUE", @""),
                                    NSLocalizedString(@"SA_KEY", @""),NSLocalizedString(@"SA_VALUE", @""),nil];
    detailsScrollView.backgroundColor = [UIColor clearColor];
    int x = 0;
    int y = 10;
    int indentation = 0;
    for (int i=0;i<[details count];i++)
    {
        NSTextAlignment alignment ;
        if (isArabicSupport)
        {
            x = 230;
            indentation = -170;
            alignment = NSTextAlignmentRight;
        }
        else
        {
            x = 20;
            indentation = 170;
            alignment = NSTextAlignmentLeft;
        }
        
        UILabel *keyLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, y, 80, 21)];
        keyLabel.textColor = [UIColor whiteColor];
        [keyLabel setFont:[UIFont systemFontOfSize:14]];
        keyLabel.textAlignment = alignment;
        keyLabel.text = [details objectAtIndex:i];
        [detailsScrollView addSubview:keyLabel];
        
        x +=indentation;
        
        UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, y, 80, 21)];
        valueLabel.textColor = [UIColor whiteColor];
        [valueLabel setFont:[UIFont systemFontOfSize:14]];
        valueLabel.textAlignment = alignment;
        valueLabel.text = [details objectAtIndex:i+1];
        [detailsScrollView addSubview:valueLabel];
        
        i++;
        y += 20;
    }
    detailsScrollView.hidden = YES;
    
    detailsScrollView.contentSize = CGSizeMake(screenWidth, y);
}


-(void)showInfoView :(id)sender
{
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        gradientView.frame = CGRectMake(0, 0, screenWidth, gradientHeightExpanded);
        detailsScrollView.hidden = NO;
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [infoButton removeTarget:self action:@selector(showInfoView:) forControlEvents:UIControlEventTouchUpInside];
                             [infoButton addTarget:self action:@selector(hideInfoView:) forControlEvents:UIControlEventTouchUpInside];
                             
                         }
                     }];
}


-(void)hideInfoView :(id)sender
{
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        gradientView.frame = CGRectMake(0, 0, screenWidth, 72);
        detailsScrollView.hidden = YES;
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [infoButton removeTarget:self action:@selector(hideInfoView:) forControlEvents:UIControlEventTouchUpInside];
                             [infoButton addTarget:self action:@selector(showInfoView:) forControlEvents:UIControlEventTouchUpInside];
                         }
                     }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [cardsInfo count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:nibName forIndexPath:indexPath];
    [cell initCellView];
    
    CardInfo *cardInfo = [cardsInfo objectAtIndex:indexPath.row];
    cell.titleLabel.text = cardInfo.cardTitle;
    cell.descriptionLabel.text = cardInfo.cardDescription;
    cell.detailsLabel.text = cardInfo.cardDetails;
    [cell.titleImageView setBackgroundColor:cardInfo.cardColor];
    [cell.mainImageView sd_setImageWithURL:[NSURL URLWithString:placeHolderURL] placeholderImage:[UIImage imageNamed:@"Logo.jpg"]];
   
   // [cell.detailsScrollView setContentSize:cell.detailsLabel.frame.size];

    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 2.0;
}

-(void)goToShareView :(id)sender
{
    ShareToViewController *shareView = [[ShareToViewController alloc]init];
    [self.navigationController pushViewController:shareView animated:YES];
}


@end
