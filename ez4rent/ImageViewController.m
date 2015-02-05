//
//  ImageViewController.m
//  ez4rent
//
//  Created by Yin Hua on 5/02/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()<UIScrollViewDelegate>
{
    UIImageView *imageView_;
//    bool pageControlBeingUsed;
}



@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
//    pageControlBeingUsed = NO;
//    self.image = [UIImage imageNamed:@"testimage"];
////    UIImage *image2 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.bergoiata.org/fe/Paysages/Blue%20Sunset%20-%201024x768.jpg"]]];
//    UIImage *image = [UIImage imageNamed:@"testimage"];
//
//    UIImage *image2 = [UIImage imageNamed:@"test2"];
//    
//
//    
//
//        CGRect frame;
//        frame.origin.x = self.scrollView.frame.size.width * 0;
//        frame.size = self.scrollView.frame.size;
//        self.scrollView.pagingEnabled = YES;
//        
//        imageView_ = [[UIImageView alloc] initWithImage:image];
//        [imageView_ sizeToFit];
//        [self.scrollView addSubview:imageView_];
//
//
//
//    frame.origin.x = self.scrollView.frame.size.width * 1;
//    frame.size = self.scrollView.frame.size;
//    self.scrollView.pagingEnabled = YES;
//    
//    imageView_ = [[UIImageView alloc] initWithImage:image2];
//            [imageView_ sizeToFit];
//    [self.scrollView addSubview:imageView_];
    
    
    

 self.scrollView.delegate = self;

    


    
    

}


-(void)viewDidLayoutSubviews{
        [self photos];
}

- (void) photos
{
    UIImage *image = [UIImage imageNamed:@"testimage"];
    UIImage *image2 = [UIImage imageNamed:@"test2"];
    
    NSArray * photos = [NSArray arrayWithObjects:image,image2, nil];
    
    for (int i = 0; i < photos.count; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        self.scrollView.pagingEnabled = YES;
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:frame];
        imageview.image = [photos objectAtIndex:i];
        [self.scrollView addSubview:imageview];
    }

    self.scrollView.contentSize =  CGSizeMake(self.scrollView.frame.size.width * photos.count, self.scrollView.frame.size.height);
    
}

-(void)basic
{
    UIImage *image = [UIImage imageNamed:@"test2"];
    imageView_ = [[UIImageView alloc] initWithImage:image];
    
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.delegate = self;
    
    self.scrollView.contentSize = image? image.size:CGSizeZero;
    [self.scrollView addSubview:imageView_];
}

- (void)pagingTest
{
    NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor greenColor],[UIColor yellowColor] , nil];
    
    for (int i = 0; i < colors.count; i++)
    {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        //        self.scrollView.pagingEnabled = YES;
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        subview.backgroundColor = [colors objectAtIndex:i];
        [self.scrollView addSubview:subview];
    }
    
    self.scrollView.contentSize =  CGSizeMake(self.scrollView.frame.size.width * colors.count, self.scrollView.frame.size.height);
    
    
}




-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView_;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (IBAction)changePage:(id)sender {
    
    // update the scroll view to the appropriate page
//    CGRect frame;
//    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
//    frame.origin.y = 0;
//    frame.size = self.scrollView.frame.size;
//    [self.scrollView scrollRectToVisible:frame animated:YES];
//    pageControlBeingUsed = YES;
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    pageControlBeingUsed = NO;
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    pageControlBeingUsed = NO;
//}

@end
