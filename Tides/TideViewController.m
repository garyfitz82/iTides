//
//  TideViewController.m
//  Tides
//
//  Created by Gary Fitzgerald on 28/11/2012.
//  Copyright (c) 2012 Fitzy. All rights reserved.
//

#import "TideViewController.h"
#import "DetailViewController.h"


#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define kTideURL [NSURL URLWithString: @"http://localhost:8080/summary"]

@interface TideViewController ()

@end

@implementation TideViewController

@synthesize jsonResults;
@synthesize data;
    //NSMutableArray *jsonResults;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    dispatch_async(kBgQueue, ^{
        NSData* _data = [NSData dataWithContentsOfURL: kTideURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:_data waitUntilDone:YES];
    });
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
    [data appendData:theData];
}

+ (void)showNetworkError:(NSString *)theMessage
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Whoops..."
                              message:theMessage
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    
    [alertView show];
}


- (void)fetchedData:(NSData *)responseData
{
    
    NSError* error;
    
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:responseData
        options:kNilOptions
        error:&error];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    jsonResults = json;
    //NSLog(@"%@",jsonResults);
       
    [self.tableView reloadData];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [jsonResults count];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [[jsonResults objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [[jsonResults objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Navigation logic may go here. Create and push another view controller.
    
     DetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"DetailView"];
   
    
     detailViewController.title = [[jsonResults objectAtIndex:indexPath.row] objectForKey:@"name"];
     
     detailViewController.tideDetails = [jsonResults objectAtIndex:indexPath.row];
    
    

     [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
