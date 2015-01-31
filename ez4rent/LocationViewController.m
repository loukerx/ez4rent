//
//  LocationViewController.m
//  ez4rent
//
//  Created by Yin Hua on 29/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "LocationViewController.h"
#import "AppDelegate.h"


@interface LocationViewController (){
    id _mDelegate;
    CLLocationCoordinate2D _coordinate;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *searchText;

@property (strong, nonatomic) CLGeocoder *geocoder;
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.mapView.delegate = self;
    self.searchText.delegate = self;
    //keyboard dismiss by tap on outside
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    

}



-(void)dismissKeyboard {
    [self.searchText resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self convertAddressToGeocoder];
    return NO;
}

-(void)convertAddressToGeocoder{
    //check to see if geocoder initialized, if not initialize it
    if(self.geocoder == nil)
    {
        self.geocoder = [[CLGeocoder alloc] init];
    }
    
    
    NSString *address = self.searchText.text;
    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if(placemarks.count > 0)
        {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            [self displayAnnotation:placemark];
            
        }
    }];
}

-(void)displayAnnotation:(CLPlacemark *)placemark
{
    _coordinate = placemark.location.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_coordinate, 2000, 2000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = _coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//   
//    if ([segue.identifier isEqualToString:@"To Check List"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        RecipeDetailViewController *destViewController = segue.destinationViewController;
//        destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
//    }
//    
//    
//}


- (IBAction)NextButton:(id)sender {
    [_mDelegate setMSuburb:self.searchText.text];
    
}
@end
