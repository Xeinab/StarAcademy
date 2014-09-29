//
//  ShareToViewController.h
//  StarAcademy
//
//  Created by Zee on 9/30/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <Social/Social.h>
#import <FacebookSDK/FBSessionTokenCachingStrategy.h>

@interface ShareToViewController : UIViewController
{
    UIButton *facebookButton;
    UIButton *twitterButton;
}

@property(nonatomic,retain) IBOutlet UIButton *facebookButton;
@property(nonatomic,retain) IBOutlet UIButton *twitterButton;

@end
