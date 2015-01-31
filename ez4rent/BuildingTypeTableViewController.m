//
//  BuildingTypeTableViewController.m
//  ez4rent
//
//  Created by Yin Hua on 30/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "BuildingTypeTableViewController.h"
#import "AppDelegate.h"


@interface BuildingTypeTableViewController ()
{
          id _mDelegate;
}


@end

@implementation BuildingTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Apartment"]) {
        [_mDelegate setMBuildingType:@"Apartment"];
    }else if ([segue.identifier isEqualToString:@"Unit"]) {
        [_mDelegate setMBuildingType:@"Unit"];
    }else if ([segue.identifier isEqualToString:@"House"]) {
        [_mDelegate setMBuildingType:@"House"];
    }else if ([segue.identifier isEqualToString:@"Townhouse"]) {
        [_mDelegate setMBuildingType:@"Townhouse"];
    }else if ([segue.identifier isEqualToString:@"Studio"]) {
        [_mDelegate setMBuildingType:@"Studio"];
    }
    
}@end
