//
//  main.m
//  81 - 网易新闻
//
//  Created by 董 尚先 on 15-1-22.
//  Copyright (c) 2015年 ShangxianDante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
//#import <OneAPM/OneAPM.h>
#import <tingyunApp/NBSAppAgent.h>

int main(int argc, char * argv[]) {

    [NBSAppAgent startWithAppID:@"13ec2c5ae06646dcbd11b8e5f953cfc0"];
    @autoreleasepool {
//        [OneAPM setBlockMonitorTimeout:200];
//        [OneAPM setBlockMonitorEnable:YES];
//        [OneAPM startWithApplicationToken:@"64A48C981B376D640BF206575D7388BD76" withSecurity:NO];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
