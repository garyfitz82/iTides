//
//  DetailViewController.h
//  Tides
//
//  Created by Gary Fitzgerald on 30/11/2012.
//  Copyright (c) 2012 Fitzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UILabel *heightLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segChange;


@property (copy, nonatomic)  NSDictionary *tideDetails;

-(IBAction)segChange:(id)sender;

-(IBAction)favouritesButton:(id)sender;

@end
