//
//  MainViewController.m
//  ez4rent
//
//  Created by Yin Hua on 31/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import <Parse/Parse.h>
#import "MainTableViewCell.h"
#import "RoomDetailsTableViewController.h"


@interface MainViewController ()
{
    id _mDelegate;
    MBProgressHUD *_HUD;
    
    NSMutableArray *_tableData;
    PFObject *_roomObject;
}
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation MainViewController

static BOOL nibsRegistered = NO;


- (void)viewDidLoad {
    [super viewDidLoad];
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.mainTableView addSubview:refreshControl];
    
    [self.view addSubview:self.mainTableView];
    _HUD =  [[MBProgressHUD alloc] init];
    _HUD.labelText = @"Progressing...";
    [_HUD hide:YES];
    [self.view addSubview:_HUD];
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    [self prepareRoomList];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [self prepareRoomList];
    [refreshControl endRefreshing];
}

-(void) prepareRoomList
{
//    PFQuery *query = [PFQuery queryWithClassName:@"Room"];
//    [query getObjectInBackgroundWithId:@"xWMyZ4YEGZ" block:^(PFObject *gameScore, NSError *error) {
//        // Do something with the returned PFObject in the gameScore variable.
//        NSLog(@"%@", gameScore);
//    }];
//
    
    //    [query whereKey:@"playerName" equalTo:@"Dan Stemkoski"];
    
    
    
    
    
        [_HUD show:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"Room"];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
//            for (PFObject *object in objects) {
//                NSLog(@"%@", object.objectId);
//                NSString *price = object[@"roomPrice"];
//            }
            _tableData = [[NSMutableArray alloc] init];
            [_tableData addObjectsFromArray:objects];

            [_HUD hide:YES];
            [self.mainTableView reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
        
}


#pragma mark - Table view data source
    
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellidentify = @"cellIdentifier";
//    if (!nibsRegistered) {
//        UINib *nib = [UINib nibWithNibName:@"MainTableViewCell" bundle:nil];
//        [tableView registerNib:nib forCellReuseIdentifier:cellidentify ];
//        nibsRegistered = YES;
//    }
//    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentify];
    
    

    
    
    
//    if (cell == nil) {
//        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentify];
//    }
//    
//    PFObject *object = [_tableData objectAtIndex:indexPath.row];
//    ((UIImage*)[cell.contentView viewWithTag:101]).images =
//    ((UILabel*)[cell.contentView viewWithTag:102]).text = object[@"roomPrice"];
//    ((UILabel*)[cell.contentView viewWithTag:103]).text = object[@"name"];
//    ((UILabel*)[cell.contentView viewWithTag:104]).text = object[@"suburb"];
    
    
    
    static NSString *cellidentify = @"cellIdentifier";

    MainTableViewCell *cell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellidentify];

    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MainTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    PFObject *object = [_tableData objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = object[@"name"];
    cell.priceLabel.text = object[@"roomPrice"];
    cell.suburbLabel.text = object[@"suburb"];
    PFFile *roomPhotoFile = object[@"displayPhoto"];
    cell.imageView.image = [UIImage imageWithData:[roomPhotoFile getData]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [roomPhotoFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//        if (!error) {
//               cell.imageView.image = [UIImage imageWithData:data];
//        }else{
//            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                                  message:[NSString stringWithFormat:@"%@ %@",error,[error userInfo]]
//                                                                 delegate:nil
//                                                        cancelButtonTitle:@"OK"
//                                                        otherButtonTitles: nil];
//            
//            [myAlertView show];
//        }
//    }];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
//    dicForEdit = [_tableData objectAtIndex:indexPath.row];
    _roomObject = [_tableData objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"To Room Details" sender:self];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"To Room Details"]) {

        RoomDetailsTableViewController *rdtvc = [segue destinationViewController];
        rdtvc.roomObject = _roomObject;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
