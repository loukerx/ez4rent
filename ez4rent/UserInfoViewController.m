//
//  UserInfoViewController.m
//  ez4rent
//
//  Created by Yin Hua on 2/02/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "UserInfoViewController.h"
#import "AppDelegate.h"

@interface UserInfoViewController ()
{
       id _mDelegate;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;


@end

@implementation UserInfoViewController

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
 
     if ([segue.identifier isEqualToString:@"To Check List"]) {
        
         [_mDelegate setMName:self.nameTextField.text];
         [_mDelegate setMMobile:self.mobileTextField.text];

     }
 }

@end
