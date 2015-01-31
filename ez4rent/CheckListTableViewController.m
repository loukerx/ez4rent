//
//  CheckListTableViewController.m
//  ez4rent
//
//  Created by Yin Hua on 30/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "CheckListTableViewController.h"
#import "AppDelegate.h"
#import "SelectPriceViewController.h"
#import "WriteSummaryViewController.h"


@interface CheckListTableViewController ()
{
    id _mDelegate;

}

@property (weak, nonatomic) IBOutlet UIImageView *roomPhotos;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;



@end

@implementation CheckListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    //setting
    if (![[_mDelegate mRoomPrice] isEqualToString:@""]) {
        self.priceLabel.text = [NSString stringWithFormat:@"$%@",[_mDelegate mRoomPrice]];
    }
    if (![[_mDelegate mRoomSummary] isEqualToString:@""]) {
        self.summaryLabel.text = [NSString stringWithFormat:@"%@",[_mDelegate mRoomSummary]];
    }
    if ([_mDelegate mSuburb].length>0) {
        self.addressLabel.text = [NSString stringWithFormat:@"%@",[_mDelegate mSuburb]];
    }
    if ([[_mDelegate mRoomImages] count]>0) {
        self.roomPhotos.image = [_mDelegate mRoomImages][0];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    //setting
    if (![[_mDelegate mRoomPrice] isEqualToString:@""]) {
        self.priceLabel.text = [NSString stringWithFormat:@"Room price: $%@",[_mDelegate mRoomPrice]];
    }
    if (![[_mDelegate mRoomSummary] isEqualToString:@""]) {
        self.summaryLabel.text = [NSString stringWithFormat:@"Your summary: %@",[_mDelegate mRoomSummary]];
    }
      if ([_mDelegate mSuburb].length>0) {
        self.addressLabel.text = [NSString stringWithFormat:@"%@",[_mDelegate mSuburb]];
    }
    if ([[_mDelegate mRoomImages] count]>0) {
        self.roomPhotos.image = [_mDelegate mRoomImages][0];
    }
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"To Select a Price"]) {
//        SelectPriceViewController *spvc = segue.destinationViewController;
//        if (![[_mDelegate mRoomPrice] isEqualToString:@""]) {
//            spvc.priceTextField.text = [NSString stringWithFormat:@"$%@",[_mDelegate mRoomPrice]];
//        }
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
