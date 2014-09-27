//
//  CardInfo.m
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import "CardInfo.h"

@implementation CardInfo
@synthesize cardTitle;
@synthesize cardDescription;
@synthesize cardDetails;
@synthesize cardColor;

+(CardInfo *)initWithTitle :(NSString*)title andDescription :(NSString*)description andDetails :(NSString*)details andColor :(UIColor*)color
{
    CardInfo *cardInfo = [[CardInfo alloc]init];
    cardInfo.cardTitle = title;
    cardInfo.cardDetails = details;
    cardInfo.cardDescription = description;
    cardInfo.cardColor = color;
    return cardInfo;
}

@end
