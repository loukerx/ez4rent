//
//  PhotosController.m
//  ez4rent
//
//  Created by Yin Hua on 15/1/28.
//  Copyright (c) 2015年 Yin Hua. All rights reserved.
//

#import "PhotosController.h"
#import "AppDelegate.h"

@interface PhotosController (){
         id _mDelegate;
    NSMutableArray *imagesArray;
}

@property (strong, nonatomic) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIImageView *image2;
@property (strong, nonatomic) IBOutlet UIImageView *image3;

@property (weak, nonatomic) IBOutlet UIView *testview;


@end

@implementation PhotosController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    imagesArray = [[NSMutableArray alloc]init];
    
    
    [imagesArray addObjectsFromArray:[[_mDelegate mRoomImages] count]? [_mDelegate mRoomImages]:nil];
    
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];

    [self.image1 addGestureRecognizer:singleTapGestureRecognizer];
}
#pragma gesture
-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    [[_mDelegate mRoomImages] removeAllObjects];
    [[_mDelegate mRoomImages] addObjectsFromArray:imagesArray];
    [self performSegueWithIdentifier:@"To Image View" sender:self];
}


-(void)viewWillAppear:(BOOL)animated{
    if ([[_mDelegate mRoomImages] count]>0) {
            self.image1.image = [_mDelegate mRoomImages][0];
    }
    if ([imagesArray count]>0) {
        self.image1.image = imagesArray[0];
    }
}

#pragma button
- (IBAction)saveButton:(id)sender {
    [[_mDelegate mRoomImages] removeAllObjects];
    [[_mDelegate mRoomImages] addObjectsFromArray:imagesArray];
    [self.navigationController popViewControllerAnimated:YES];
    
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

#pragma save images in array
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
   
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //edit this image size to fit imageView [150x200 & 60x80]
    //....
    //....
    [imagesArray addObject:chosenImage];
//    self.image1.image = chosenImage;
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
