//
//  SelectPriceViewController.m
//  ez4rent
//
//  Created by Yin Hua on 30/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "SelectPriceViewController.h"
#import "AppDelegate.h"
@interface SelectPriceViewController (){
        id _mDelegate;
}


@end

@implementation SelectPriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (![[_mDelegate mRoomPrice] isEqualToString:@""]) {
        self.priceTextField.text = [NSString stringWithFormat:@"$%@",[_mDelegate mRoomPrice]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"To Check List"]) {
//        [_mDelegate setMRoomPrice:self.priceTextField.text];
//    }
//}


- (IBAction)saveButton:(id)sender {
    [_mDelegate setMRoomPrice:self.priceTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
