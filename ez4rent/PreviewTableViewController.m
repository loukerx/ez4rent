//
//  PreviewTableViewController.m
//  ez4rent
//
//  Created by Yin Hua on 30/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "PreviewTableViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "MBProgressHUD.h"

@interface PreviewTableViewController ()
{
     id _mDelegate;
     MBProgressHUD *_HUD;
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

@implementation PreviewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    _HUD =  [[MBProgressHUD alloc] init];
    _HUD.labelText = @"Uploading your photos...";
    [_HUD hide:YES];
    [self.view addSubview:_HUD];
    
    //setting
    if ([[_mDelegate mRoomImages] count]>0) {
        self.imageView.image = [_mDelegate mRoomImages][0];
    }
    if ([_mDelegate mRoomPrice].length>0) {
        self.priceLabel.text = [NSString stringWithFormat:@"$%@",[_mDelegate mRoomPrice]];
    }
    if ([_mDelegate mRentType].length>0) {
        self.rentTypeDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mRentType]];
    }
    if ([_mDelegate mBuildingType].length>0) {
        self.buildingTypeDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mBuildingType]];
    }
    if ([_mDelegate mStreet].length>0) {
        self.streetDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mStreet]];
    }
    if ([_mDelegate mSuburb].length>0) {
        self.suburbDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mSuburb]];
    }
    if ([_mDelegate mCity].length>0) {
        self.cityDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mCity]];
    }
    if ([_mDelegate mAvailableDate].length>0) {
        self.availableDateDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mAvailableDate]];
    }
    if ([_mDelegate mBedType].length>0) {
        self.bedTypeDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mBedType]];
    }
    if ([_mDelegate mBedrooms].length>0) {
        self.bedroomsDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mBedrooms]];
    }
    if ([_mDelegate mBathrooms].length>0) {
        self.bathroomsDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mBathrooms]];
    }
    if ([_mDelegate mAccommodates].length>0) {
        self.accommodatesDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mAccommodates]];
    }
    if ([_mDelegate mName].length>0) {
        self.contactNameDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mName]];
    }
    if ([_mDelegate mMobile].length>0) {
        self.contactMobileDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mMobile]];
    }
    if ([_mDelegate mRoomSummary].length>0) {
        self.roomSummaryDetail.text = [NSString stringWithFormat:@"%@",[_mDelegate mRoomSummary]];
    }
}


-(void)saveIntoDatabase
{
    //keep photo size less than 150kb-200kb
    NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    NSData *bestImageData = UIImageJPEGRepresentation(self.imageView.image, 1.0);
    NSData *leastImageData = UIImageJPEGRepresentation(self.imageView.image, 0.0);
    PFFile *imageFile = [PFFile fileWithName:@"imageText.png" data:imageData];
    PFFile *imageFileB = [PFFile fileWithName:@"imagebest.jpg" data:bestImageData];
    PFFile *imageFileL = [PFFile fileWithName:@"imagelest.jpg" data:leastImageData];

    [_HUD show:YES];
    //create the Room
    PFObject *room = [PFObject objectWithClassName:@"Room"];
    room[@"displayPhoto"] = imageFileL;
    room[@"name"] = [_mDelegate mName];
    room[@"mobile"] = [_mDelegate mMobile];
    room[@"rentType"] = [_mDelegate mRentType];
    room[@"buildingType"] = [_mDelegate mBuildingType];
    room[@"street"] = [_mDelegate mStreet];
    room[@"suburb"] = [_mDelegate mSuburb];
    room[@"city"] = [_mDelegate mCity];
    room[@"bedType"] = [_mDelegate mBedType];
    room[@"bedrooms"] = [_mDelegate mBedrooms];
    room[@"bathrooms"] = [_mDelegate mBathrooms];
    room[@"accommodates"] = [_mDelegate mAccommodates];
    room[@"availableDate"] = [_mDelegate mAvailableDate];
    room[@"roomPrice"] = [_mDelegate mRoomPrice];
    room[@"roomSummary"] = [_mDelegate mRoomSummary];
    
    //create Room Photos
    PFObject *roomPhoto = [PFObject objectWithClassName:@"RoomPhoto"];
//    roomPhoto[@"imageNameBest"] = @"image001";
//    roomPhoto[@"imageFileBest"] = imageFileB;
    roomPhoto[@"imageNameLest"] = @"image002";
    roomPhoto[@"imageFileLest"] = imageFileL;

    
    roomPhoto[@"parent"] = room;
    [roomPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [_HUD hide:YES];
        if (succeeded) {
      
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Succeess"
                                                                  message:@"A room has been released!"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            [self performSegueWithIdentifier:@"To Main" sender:self];
        }else{
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:[NSString stringWithFormat:@"%@ %@",error,[error userInfo]]
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
     
        }
    }];
    
    
    

}







- (IBAction)releaseButton:(id)sender {
    [self saveIntoDatabase];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
