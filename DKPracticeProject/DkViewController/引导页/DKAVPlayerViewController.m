//
//  DKAVPlayerViewController.m
//  DKPracticeProject
//
//  Created by 党坤 on 2017/2/22.
//  Copyright © 2017年 党坤. All rights reserved.
//

#import "DKAVPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface DKAVPlayerViewController ()<UIScrollViewDelegate>
{
    NSArray *videoArray;
    UIScrollView *ScrollView;
    NSMutableArray *AVPlayerArray;
    UIPageControl  *pageControl;
}
@end

@implementation DKAVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    videoArray = @[@"1",@"2",@"3"];
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

- (void)initUI
{
    ScrollView = [[UIScrollView alloc] initWithFrame:ScreenFrame];
    ScrollView.bounces = NO;
    ScrollView.pagingEnabled = YES;
    ScrollView.contentSize = CGSizeMake(Width*videoArray.count, Height);
    ScrollView.delegate = self;
    [self.view addSubview:ScrollView];
    
    AVPlayerArray = [[NSMutableArray alloc] init];
    for (int i=0; i<videoArray.count; i++) {
        AVPlayerItem *avplayItem = [AVPlayerItem playerItemWithAsset:[AVAsset assetWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:videoArray[i] ofType:@"m4v"]]]];
        AVPlayer *avplayer = [AVPlayer playerWithPlayerItem:avplayItem];
        AVPlayerLayer *avplayerLayer = [AVPlayerLayer playerLayerWithPlayer:avplayer];
        avplayerLayer.frame = CGRectMake(Width*i, 0, Width, Height);
        avplayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [AVPlayerArray addObject:avplayer];
        [ScrollView.layer addSublayer:avplayerLayer];
    }
    AVPlayer *player = [AVPlayerArray objectAtIndex:0];
    [player play];
    
    pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(self.view.center.x, Height-100);
    pageControl.numberOfPages = AVPlayerArray.count;
    [self.view addSubview:pageControl];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentIndex = scrollView.contentOffset.x/Width;
    pageControl.currentPage = currentIndex;
    
    for (int i = 0; i<AVPlayerArray.count; i++) {
        AVPlayer *avplayer = [AVPlayerArray objectAtIndex:i];
        [avplayer seekToTime:kCMTimeZero];
        if(i == currentIndex)
        {
            [avplayer play];
        }else
        {
            [avplayer pause];
        }
    }
}
@end
