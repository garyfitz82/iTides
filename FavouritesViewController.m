//
//  FavouritesViewController.m
//  Tides
//
//  Created by Gary Fitzgerald on 10/12/2012.
//  Copyright (c) 2012 Fitzy. All rights reserved.
//

#import "FavouritesViewController.h"
#import "DetailViewController.h"
@interface FavouritesViewController ()

@end

@implementation FavouritesViewController
@synthesize favLabel;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    favLabel.text = [defaults stringForKey:@"favourite"];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
        }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
