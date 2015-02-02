//
//  RoomSettingViewController.m
//  ez4rent
//
//  Created by Yin Hua on 2/02/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "RoomSettingViewController.h"
#import "AppDelegate.h"


@interface RoomSettingViewController ()
{
        id _mDelegate;
}

@property (weak, nonatomic) IBOutlet UILabel *bedroomsLabel;

@property (weak, nonatomic) IBOutlet UILabel *bathroomsLabel;

@property (weak, nonatomic) IBOutlet UILabel *accommodatesLabel;

@end

@implementation RoomSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)lessBedrooms:(id)sender {
    
    int bedrooms = [self.bedroomsLabel.text intValue] - 1;
    
    if (bedrooms != 0) {
        self.bedroomsLabel.text = [NSString stringWithFormat:@"%d", bedrooms];
    }
}

- (IBAction)moreBedrooms:(id)sender {
    int bedrooms = [self.bedroomsLabel.text intValue] + 1;
    self.bedroomsLabel.text = [NSString stringWithFormat:@"%d", bedrooms];
}

- (IBAction)lessBathrooms:(id)sender {
    int bathrooms = [self.bathroomsLabel.text intValue] - 1;
    if (bathrooms != 0) {
            self.bathroomsLabel.text = [NSString stringWithFormat:@"%d", bathrooms];
    }
}
- (IBAction)moreBathrooms:(id)sender {
    int bathrooms = [self.bathroomsLabel.text intValue] + 1;
    self.bathroomsLabel.text = [NSString stringWithFormat:@"%d", bathrooms];
}

- (IBAction)lessAccommodates:(id)sender {
    int accommodates = [self.accommodatesLabel.text intValue] - 1;
    if (accommodates != 0) {
        self.accommodatesLabel.text = [NSString stringWithFormat:@"%d", accommodates];
    }
}

- (IBAction)moreAccommodates:(id)sender {
    int accommodates = [self.accommodatesLabel.text intValue] + 1;
    self.accommodatesLabel.text = [NSString stringWithFormat:@"%d", accommodates];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"To User Info"]) {
        [_mDelegate setMBedrooms:self.bedroomsLabel.text];
        [_mDelegate setMBathrooms:self.bathroomsLabel.text];
        [_mDelegate setMAccommodates:self.accommodatesLabel.text];
    }
    
    
}
@end
