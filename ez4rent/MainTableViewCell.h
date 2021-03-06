//
//  MainTableViewCell.h
//  ez4rent
//
//  Created by Yin Hua on 31/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *suburbLabel;

@end
