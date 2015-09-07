//
//  ViewController.m
//  W3D1 - ScrollViews
//
//  Created by Daniel Mathews on 2015-09-06.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int exampleImDoing = 1;
    
    switch (exampleImDoing) {
        case 0:
            [self zoomIntoScrollView];
            break;
        case 1:
            [self pagingScrollView];
            break;
        default:
            break;
    }
    
    
}

-(void)pagingScrollView {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:self.scrollView];
    
    NSArray *colors = @[[UIColor redColor], [UIColor greenColor], [UIColor yellowColor], [UIColor blueColor], [UIColor grayColor]];
    
    int startingPointOfX = 0;
    
    for (UIColor *color in colors) {
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(startingPointOfX, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        colorView.backgroundColor = color;
        [self.scrollView addSubview:colorView];
        
        startingPointOfX += CGRectGetWidth(self.view.frame);
    }
    
    self.scrollView.contentSize = CGSizeMake(startingPointOfX, CGRectGetHeight(self.view.frame));
    
}


-(void)zoomIntoScrollView {
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    
    self.scrollView.contentSize = self.imageView.bounds.size;
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 4.0;
    self.scrollView.zoomScale = 1.0;
    
    
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(300, 100);
    }];
    
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
