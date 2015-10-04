//
//  TideViewController.h
//  Tides
//
//  Created by Gary Fitzgerald on 28/11/2012.
//  Copyright (c) 2012 Fitzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TideViewController : UITableViewController

@property(nonatomic)NSMutableArray *jsonResults;
@property(nonatomic, strong)NSMutableData *data;

+ (void)showNetworkError:(NSString *)theMessage;



@end
