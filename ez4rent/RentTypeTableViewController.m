//
//  RentTypeTableViewController.m
//  ez4rent
//
//  Created by Yin Hua on 30/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "RentTypeTableViewController.h"
#import "AppDelegate.h"


@interface RentTypeTableViewController (){
      id _mDelegate;
}



@end

@implementation RentTypeTableViewController

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
        if ([segue.identifier isEqualToString:@"Private Room"]) {
            [_mDelegate setMRentType:@"Private Room"];
        }else if ([segue.identifier isEqualToString:@"Entire Home"]) {
            [_mDelegate setMRentType:@"Entire Home"];
        }else if ([segue.identifier isEqualToString:@"Shared Room"]) {
            [_mDelegate setMRentType:@"Shared Room"];
        }
}


@end
