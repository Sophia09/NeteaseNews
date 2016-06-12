//
//  main.m
//  81 - 网易新闻
//
//  Created by 董 尚先 on 15-1-22.
//  Copyright (c) 2015年 ShangxianDante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
//#import <tingyunApp/NBSAppAgent.h>
#import <OneAPM/OneAPM.h>

int main(int argc, char * argv[]) {

//    [NBSAppAgent startWithAppID:@"7e9b41fb4ec04bbcaa72ccf06bf58ef7"];
    @autoreleasepool {
        [OneAPM printLog:NO];
        [OneAPM disableZLib]; //禁止压缩
        [OneAPM setCustomInfo:@"OneAPM Test"];
        [OneAPM startWithApplicationToken:@"64A48C981B376D640BF206575D7388BD76"];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
