//
//  CardInfo.h
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardInfo : NSObject
{
    NSString *cardTitle;
    NSString *cardDescription;
    NSString *cardDetails;
    UIColor *cardColor;
}

@property(nonatomic,retain) NSString *cardTitle;
@property(nonatomic,retain) NSString *cardDescription;
@property(nonatomic,retain) NSString *cardDetails;
@property(nonatomic,retain) UIColor *cardColor;

+(CardInfo *)initWithTitle :(NSString*)title andDescription :(NSString*)description andDetails :(NSString*)details andColor :(UIColor*)color;
@end
