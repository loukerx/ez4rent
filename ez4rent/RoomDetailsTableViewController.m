//
//  RoomDetailsTableViewController.m
//  ez4rent
//
//  Created by Yin Hua on 31/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "RoomDetailsTableViewController.h"
#import "AppDelegate.h"


@interface RoomDetailsTableViewController ()
{
    id _mDelegate;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *rentTypeDetail;
@property (weak, nonatomic) IBOutlet UILabel *buildingTypeDetail;
@property (weak, nonatomic) IBOutlet UILabel *streetDetail;
@property (weak, nonatomic) IBOutlet UILabel *suburbDetail;
@property (weak, nonatomic) IBOutlet UILabel *cityDetail;
@property (weak, nonatomic) IBOutlet UILabel *bedTypeDetail;
@property (weak, nonatomic) IBOutlet UILabel *bedroomsDetail;
@property (weak, nonatomic) IBOutlet UILabel *bathroomsDetail;
@property (weak, nonatomic) IBOutlet UILabel *accommodatesDetail;
@property (weak, nonatomic) IBOutlet UILabel *contactNameDetail;
@property (weak, nonatomic) IBOutlet UILabel *contactMobileDetail;
@property (weak, nonatomic) IBOutlet UILabel *roomSummaryDetail;



@property (weak, nonatomic) IBOutlet UILabel *availableDateDetail;

@end

@implementation RoomDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (self.roomObject) {

    

//        self.imageView.image = [_mDelegate mRoomImages][0];

        self.priceLabel.text = self.roomObject[@"roomPrice"];

        self.rentTypeDetail.text = self.roomObject[@"rentType"];

        self.buildingTypeDetail.text = self.roomObject[@"buildingType"];

        self.streetDetail.text = self.roomObject[@"street"];

        self.suburbDetail.text = self.roomObject[@"suburb"];

        self.cityDetail.text = self.roomObject[@"city"];

        self.availableDateDetail.text = self.roomObject[@"availableDate"];

        self.bedTypeDetail.text = self.roomObject[@"bedType"];

        self.bedroomsDetail.text = self.roomObject[@"bedrooms"];

        self.bathroomsDetail.text = self.roomObject[@"bathrooms"];

        self.accommodatesDetail.text = self.roomObject[@"accommodates"];

        self.contactNameDetail.text = self.roomObject[@"name"];

        self.contactMobileDetail.text = self.roomObject[@"mobile"];

        self.roomSummaryDetail.text = self.roomObject[@"roomSummary"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
