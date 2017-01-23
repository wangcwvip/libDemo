//
//  CWViewController.m
//  libDemo
//
//  Created by wangcw on 2017/1/23.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import "CWViewController.h"

@interface CWViewController ()

@end

@implementation CWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect bkFrame = self.view.bounds;
//    bkFrame.size.height = CGRectGetHeight(bkFrame) - 10.f;
    UIView *bkView = [[UIView alloc] initWithFrame:bkFrame];
    bkView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:bkView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
