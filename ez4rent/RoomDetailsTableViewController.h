//
//  RoomDetailsTableViewController.h
//  ez4rent
//
//  Created by Yin Hua on 31/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface RoomDetailsTableViewController : UITableViewController

@property (strong, nonatomic) PFObject *roomObject;


@end
