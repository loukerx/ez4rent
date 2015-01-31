//
//  WriteSummaryViewController.m
//  ez4rent
//
//  Created by Yin Hua on 30/01/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "WriteSummaryViewController.h"
#import "AppDelegate.h"
@interface WriteSummaryViewController (){
    id _mDelegate;
}
@property (weak, nonatomic) IBOutlet UITextView *summaryTextView;

@end

@implementation WriteSummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (![[_mDelegate mRoomSummary] isEqualToString:@""]) {
        self.summaryTextView.text = [NSString stringWithFormat:@"%@",[_mDelegate mRoomSummary]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButton:(id)sender {
    [_mDelegate setMRoomSummary:self.summaryTextView.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
