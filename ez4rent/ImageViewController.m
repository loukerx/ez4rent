//
//  ImageViewController.m
//  ez4rent
//
//  Created by Yin Hua on 5/02/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "ImageViewController.h"
#import "AppDelegate.h"


@interface ImageViewController ()<UIScrollViewDelegate>
{
        id _mDelegate;
    UIImageView *imageView_;
}



@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;



@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _mDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    [self zooming];

}


-(void)viewDidLayoutSubviews{
    

}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return [[scrollView subviews] objectAtIndex:0];
    
}

-(void) zoomingGood
{
//        self.view.backgroundColor = [UIColor grayColor];
    
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, 0);
    
    
        for (int i = 0; i < 3; i++) {
            UIImageView *imageForZooming = [[UIImageView alloc] initWithImage:[UIImage
                                                                               imageNamed:[NSString stringWithFormat:@"image%d.jpg",i+1]]];
            imageForZooming.contentMode = UIViewContentModeScaleAspectFit;
            imageForZooming.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
            UIScrollView *pageScrollView = [[UIScrollView alloc]
                                            initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, self.view.frame.size.height)];
            pageScrollView.minimumZoomScale = 1.0f;
            pageScrollView.maximumZoomScale = 2.0f;
            pageScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
            pageScrollView.delegate = self;
            pageScrollView.showsHorizontalScrollIndicator = NO;
            pageScrollView.showsVerticalScrollIndicator = NO;
            [pageScrollView addSubview:imageForZooming];
    
            [self.scrollView addSubview:pageScrollView];
            
        }
    
}

- (void) zooming
{
    UIImage *image = [UIImage imageNamed:@"image1"];
    UIImage *image2 = [UIImage imageNamed:@"image2"];
    UIImage *image3 = [UIImage imageNamed:@"image3"];
    
//    NSArray * photos = [NSArray arrayWithObjects:image, image2, image3,nil];
    NSArray *photos = [NSArray arrayWithArray: [_mDelegate mRoomImages]];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    self.scrollView.contentSize =  CGSizeMake(width * photos.count,0);
    
    int count = 0;
    
    for(UIImage *image in photos)
    {
        UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.frame = CGRectMake(0, 0, width, height);
        
        UIScrollView *pageScrollView = [[UIScrollView alloc]
                                        initWithFrame:CGRectMake(width * count, 0, width, height)];
        pageScrollView.minimumZoomScale = 1.0f;
        pageScrollView.maximumZoomScale = 2.0f;
        
        pageScrollView.contentSize = CGSizeMake(width,height);
        pageScrollView.delegate = self;
        [pageScrollView addSubview:imageview];
        
        [self.scrollView addSubview:pageScrollView];
        count++;
    }
    
    
//    for (int i = 0; i < photos.count; i++) {
    


//        UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"image%d",i+1]]];
//        UIImageView *imageview = [[UIImageView alloc] initWithImage:photos[i]];
//        imageview.contentMode = UIViewContentModeScaleAspectFit;
//        imageview.frame = CGRectMake(0, 0, width, height);
        
//        UIScrollView *pageScrollView = [[UIScrollView alloc]
//                                        initWithFrame:CGRectMake(width*i, 0, width, height)];
//        pageScrollView.minimumZoomScale = 1.0f;
//        pageScrollView.maximumZoomScale = 2.0f;
//
//        pageScrollView.contentSize = CGSizeMake(width,height);
//        pageScrollView.delegate = self;
//        [pageScrollView addSubview:imageview];
        
//        [self.scrollView addSubview:pageScrollView];
//    }


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

- (void)photos
{
    UIImage *image = [UIImage imageNamed:@"image1"];
    UIImage *image2 = [UIImage imageNamed:@"image2"];
    UIImage *image3 = [UIImage imageNamed:@"image3"];
    
    NSArray * photos = [NSArray arrayWithObjects:image, image2, image3,nil];
    
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






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)scrollViewDidScroll:(UIScrollView *)sender {
//    // Update the page when more than 50% of the previous/next page is visible
//    CGFloat pageWidth = self.scrollView.frame.size.width;
//    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    self.pageControl.currentPage = page;
//}
//


@end
