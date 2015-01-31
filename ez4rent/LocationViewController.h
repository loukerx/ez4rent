//
//  LocationViewController.h
//  ez4rent
//
//  Created by Yin Hua on 29/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController  <MKMapViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate>
- (IBAction)NextButton:(id)sender;

@end
