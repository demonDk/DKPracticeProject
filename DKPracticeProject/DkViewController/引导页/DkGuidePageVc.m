//
//  DkGuidePageVc.m
//  DKPracticeProject
//
//  Created by 党坤 on 2017/2/8.
//  Copyright © 2017年 党坤. All rights reserved.
//

#import "DkGuidePageVc.h"

@interface DkGuidePageVc ()<UIScrollViewDelegate>
{
    NSArray *imageArray;
    UIPageControl *page;
    UIScrollView *guidePage;
}
@end

@implementation DkGuidePageVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imageArray = @[@"timg.jpeg",@"timg1.jpeg",@"timg2.jpeg"];
    
    [self initUI];
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

- (void)initUI{
    guidePage = [[UIScrollView alloc] init];
    guidePage.frame = CGRectMake(0,0, Width, Height);
    guidePage.pagingEnabled = YES;
    guidePage.bounces = NO;
    guidePage.delegate = self;
    guidePage.contentSize = CGSizeMake(Width*3, Height);
    
    for (int i=0 ; i < imageArray.count ; i++) {
        UIImageView *contentImage = [[UIImageView alloc] initWithFrame:CGRectMake(Width*i, 0, Width, Height)];
        contentImage.image = [UIImage imageNamed:imageArray[i]];
        contentImage.contentMode = UIViewContentModeScaleAspectFill;
        contentImage.clipsToBounds = YES;
        [guidePage addSubview:contentImage];
    }
    [self.view addSubview:guidePage];
    
    page = [[UIPageControl alloc] init];
    page.center = CGPointMake(self.view.center.x, Height-100);
    page.numberOfPages = imageArray.count;
    page.tintColor = [UIColor blackColor];
    [self.view addSubview:page];
}

#pragma  mark -scrollview delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentIndex = scrollView.contentOffset.x/Width;
    NSLog(@"page == %ld",(long)currentIndex);
    page.currentPage = currentIndex;
}
@end
