//
//  ViewController.m
//  DKPracticeProject
//
//  Created by 党坤 on 2017/2/7.
//  Copyright © 2017年 党坤. All rights reserved.
//

#import "ViewController.h"
#import "DkGuidePageVc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    DkGuidePageVc *guidePage = [[DkGuidePageVc alloc] init];
    [self.view addSubview:guidePage.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
