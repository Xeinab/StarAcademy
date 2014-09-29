//
//  ShareToViewController.m
//  StarAcademy
//
//  Created by Zee on 9/30/14.
//  Copyright (c) 2014 VineLab. All rights reserved.
//

#import "ShareToViewController.h"
#import "Common.h"


@implementation ShareToViewController
@synthesize facebookButton, twitterButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
   [self initView];
}


-(void)initView
{
    //  self.view.backgroundColor = [UIColor redColor];
    
    [facebookButton setTitle:NSLocalizedString(@"SA_FACEBOOK", @"") forState:UIControlStateNormal];
    
    [facebookButton addTarget:self action:@selector(shareToFacebook:) forControlEvents:UIControlEventTouchUpInside];
    
    [twitterButton setTitle:NSLocalizedString(@"SA_TWITTER", @"") forState:UIControlStateNormal];
    [twitterButton addTarget:self action:@selector(shareToTwitter:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)shareToFacebook :(id)sender
{
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs://"]];
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        
        //[fbController addImage:imageView.image];
        NSString *fbShare = [NSString stringWithFormat:@"%@",NSLocalizedString(@"SA_FACEBOOK", @"")];
        [fbController setInitialText:fbShare];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sign in!" message:@"Please first Sign In!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)shareToTwitter :(id)sender
{
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs://"]];
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        
        // [fbController addImage:imageView.image];
        NSString *fbShare = [NSString stringWithFormat:@"%@",NSLocalizedString(@"SA_TWITTER", @"")];
        [fbController setInitialText:fbShare];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sign in!" message:@"Please first Sign In!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end