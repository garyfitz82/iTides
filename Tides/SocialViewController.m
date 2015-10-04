//
//  SocialViewController.m
//  Tides
//
//  Created by Gary Fitzgerald on 11/12/2012.
//  Copyright (c) 2012 Fitzy. All rights reserved.
//

#import "SocialViewController.h"

@interface SocialViewController ()

@end

@implementation SocialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)twitterButton:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *twitter = [[SLComposeViewController alloc]init];
        
        twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [twitter setInitialText:[NSString stringWithFormat:@"post to twitter"]];
        [self presentViewController:twitter animated:YES completion:nil];
        
        [twitter setCompletionHandler:^(SLComposeViewControllerResult result)
         {
             NSString *output;
             switch (result)
             {
                 case SLComposeViewControllerResultCancelled:
                     output = @"Action Cancelled";
                     break;
                 case SLComposeViewControllerResultDone:
                     output = @"Post Sucessful";
                     break;
                 default:
                     break;
             }
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Twitter" message:output delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
             [alert show];
             
         }];
    }

}

- (IBAction)facebookButton:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *facebook = [[SLComposeViewController alloc]init];
        
         facebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [facebook setInitialText:[NSString stringWithFormat:@"post to facebook"]];
        [self presentViewController:facebook animated:YES completion:nil];
        
        [facebook setCompletionHandler:^(SLComposeViewControllerResult result)
         {
             NSString *output;
             switch (result)
             {
                 case SLComposeViewControllerResultCancelled:
                     output = @"Action Cancelled";
                     break;
                 case SLComposeViewControllerResultDone:
                     output = @"Post Sucessful";
                     break;
                 default:
                     break;
             }
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
             [alert show];
         
         }];
    }
}
@end
