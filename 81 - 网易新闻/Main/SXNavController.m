//
//  SXNavController.m
//  81 - 网易新闻
//
//  Created by 董 尚先 on 15/2/6.
//  Copyright (c) 2015年 ShangxianDante. All rights reserved.
//

#import "SXNavController.h"

@interface SXNavController ()

@property (nonatomic, assign) NSTimeInterval startTime;

@end

@implementation SXNavController


+ (void)initialize
{
    // 设置导航栏的主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:[UIColor redColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.startTime = [[NSDate date] timeIntervalSince1970];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeBlack) name:@"ChangeBlack" object:nil];
    
}

//- (void)changeBlack
//{
//    [navBar setBarTintColor:[UIColor blackColor]];
//}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval duration = endTime - self.startTime;
    NSLog(@"duration for the loading of SXNavController is %f", duration);
}

@end
