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
    [self initNavigationBar];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self initView];
}

-(void)initNavigationBar
{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleView.backgroundColor = [UIColor clearColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [titleLabel setTextColor:GREEN_COLOR];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:NSLocalizedString(@"SA_SHARE", @"")];
    [titleView addSubview:titleLabel];
    [self.navigationItem setTitleView:titleView];
    
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor redColor]];
    
   /* UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [backButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackButton.png"]]];
    [backButton addTarget :self action:@selector(goBack:)
          forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithCustomView :backButton];
    
    self.navigationItem.leftBarButtonItem = button;
    self.navigationItem.hidesBackButton = YES;*/
}


-(void)goBack :(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)initView
{
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
                    NSLog(@"shareToFacebook - Cancelled.....");
                    // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs://"]];
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"shareToFacebook - Posted....");
                    [self performSelector:@selector(goBack:) withObject:nil];
                }
                    break;
            }};
        
        
        //[fbController addImage:imageView.image];
        [fbController addURL:[NSURL URLWithString:@"http://staracarabia.com"]];
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
    SLComposeViewController *twitterController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [twitterController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"shareToTwitter - Cancelled.....");
                    [self performSelector:@selector(goBack:) withObject:nil];
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"shareToTwitter - Posted....");
                }
                    break;
            }};
        
        
        // [fbController addImage:imageView.image];
        [twitterController addURL:[NSURL URLWithString:@"http://staracarabia.com"]];
        [twitterController setCompletionHandler:completionHandler];
        [self presentViewController:twitterController animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sign in!" message:@"Please first Sign In!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end