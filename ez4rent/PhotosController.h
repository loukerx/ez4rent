//
//  PhotosController.h
//  ez4rent
//
//  Created by Yin Hua on 15/1/28.
//  Copyright (c) 2015年 Yin Hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)takePhotoAction:(id)sender;

@end
