//
//  ViewController.m
//  DKPracticeProject
//
//  Created by 党坤 on 2017/2/7.
//  Copyright © 2017年 党坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *title = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 30, 30)];
    title.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:title];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
