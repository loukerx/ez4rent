//
//  PhotosController.m
//  ez4rent
//
//  Created by Yin Hua on 15/1/28.
//  Copyright (c) 2015年 Yin Hua. All rights reserved.
//

#import "PhotosController.h"

@interface PhotosController ()
@property (strong, nonatomic) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIImageView *image2;
@property (strong, nonatomic) IBOutlet UIImageView *image3;


@end

@implementation PhotosController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}



- (IBAction)takePhotoAction:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Take Photo"
                                                    otherButtonTitles:@"Select Photo",nil];
//    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    actionSheet.tag = 1;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"the %@ button was tapped.", [actionSheet buttonTitleAtIndex:buttonIndex]);
    
    switch (buttonIndex) {
        case 0:
            [self takePhoto];
            break;
        case 1:
            [self selectPhoto];
            break;
        default:
            break;
    }

}

-(void)takePhoto
{
    // check if the device has a built in camera
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }else{
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

-(void)selectPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
   
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.image1.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
