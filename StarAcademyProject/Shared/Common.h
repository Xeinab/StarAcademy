//
//  Common.h
//  StarAcademy
//
//  Created by Zee on 9/27/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define LIGHT_GRAY_COLOR UIColorFromRGB(0xDBDDDE)
#define GRAY_COLOR UIColorFromRGB(0x8E8E93)
#define GREEN_COLOR UIColorFromRGB(0x006400)

#define FONT_HELVETICA_BOLD @"HelveticaNeue-BoldItalic"
#define FONT_HELVETICA  @"Helvetica"
