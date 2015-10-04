//
//  DetailViewController.m
//  Tides
//
//  Created by Gary Fitzgerald on 30/11/2012.
//  Copyright (c) 2012 Fitzy. All rights reserved.
//

#import "DetailViewController.h"
#import "TideViewController.h"
@class TideViewController;

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize timeLabel, heightLabel,tideDetails, segChange, dateLabel;


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
    
    NSDate *d = [[NSDate alloc] init];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    
    [df setDateFormat:@"dd - MMMM - yyyy"];
    
    [[self dateLabel]setText:[df stringFromDate:d]];
    
    NSLog(@"%@", tideDetails);
   	}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    timeLabel.text = [[tideDetails valueForKey:@"firstLow"]valueForKey:@"time"];
    heightLabel.text = [[tideDetails valueForKey:@"firstLow"]valueForKey:@"height"];
}

-(IBAction)segChange:(id)sender
{
    if ([segChange selectedSegmentIndex] ==0) {
      
        timeLabel.text = [[tideDetails valueForKey:@"firstLow"]valueForKey:@"time"];
        heightLabel.text = [[tideDetails valueForKey:@"firstLow"]valueForKey:@"height"];
    }
    
    if([segChange selectedSegmentIndex] ==1) {
        
        timeLabel.text = [[tideDetails valueForKey:@"firstHigh"]valueForKey:@"time"];
        heightLabel.text = [[tideDetails valueForKey:@"firstHigh"]valueForKey:@"height"];
    }
    
    if([segChange selectedSegmentIndex] ==2) {
        
        timeLabel.text = [[tideDetails valueForKey:@"secondLow"]valueForKey:@"time"];
        heightLabel.text = [[tideDetails valueForKey:@"secondLow"]valueForKey:@"height"];
    }
    
    if ([segChange selectedSegmentIndex] ==3) {
    
        timeLabel.text = [[tideDetails valueForKey:@"secondHigh"]valueForKey:@"time"];
        heightLabel.text = [[tideDetails valueForKey:@"secondHigh"]valueForKey:@"height"];
    }
    

}


- (IBAction)favouritesButton:(id)sender
{
    NSString *favlocation = [tideDetails valueForKey:@"name"];
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:favlocation forKey:@"favourite"];
    [defaults synchronize];
}

/*
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 
 NSData *data = [defaults objectForKey:@"myArrayKey"];
 NSArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
 
*/

@end
