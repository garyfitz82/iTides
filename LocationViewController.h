//
//  LocationViewController.h
//  Tides
//
//  Created by Gary Fitzgerald on 10/12/2012.
//  Copyright (c) 2012 Fitzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface LocationViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end