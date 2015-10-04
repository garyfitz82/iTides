//
//  LocationViewController.m
//  Tides
//
//  Created by Gary Fitzgerald on 10/12/2012.
//  Copyright (c) 2012 Fitzy. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

@synthesize mapView;

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
	self.mapView.delegate = self;
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation*)location
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 5000, 5000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = location.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}
 


 
 @end
