//
//  AppDelegate.m
//  81 - 网易新闻
//
//  Created by 董 尚先 on 15-1-22.
//  Copyright (c) 2015年 ShangxianDante. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>
#import "HelpshiftAll.h"
#import "HelpshiftCore.h"
#import "CrabCrashReport.h"
#import <NewRelicAgent/NewRelic.h>
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import <CloudwiseMAgent/SmartAgent.h>
#import <UMMobClick/MobClick.h>
#import <ADEUMInstrumentation/ADEUMInstrumentation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"update"];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"top20"];
    UIApplication *app = [UIApplication sharedApplication];
    app.statusBarStyle = UIStatusBarStyleLightContent;
    
    [self registerSDKs];
    
    return YES;
}

- (void)registerSDKs {
/*
    // register Bugly account info
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.blockMonitorEnable = YES;
    config.blockMonitorTimeout = 0.5;
    config.reportLogLevel = 5;
    [Bugly setTag:501];
    [Bugly setTag:18756];
    [Bugly startWithAppId:@"900033812" config:config];
    [Bugly setUserIdentifier:@"I'm a Test"];
    
    // register for HelpShift
    [HelpshiftCore initializeWithProvider:[HelpshiftAll sharedInstance]];
    [HelpshiftCore installForApiKey:@"151af306ee53417cbe9fd1df543196b1" domainName:@"test4bug" appID:@"test4bug_platform_20160608081748136-f2a80c77e500f14"];
    
    // register for Baidu Crab
    [[CrabCrashReport sharedInstance] initCrashReporterWithAppKey:@"b3f6e72b7ccd84a3"
                                                       AndVersion:@"1.0" AndChannel:@"AppStore"];
    [[CrabCrashReport sharedInstance] setCatchANREnable:YES];
    [[CrabCrashReport sharedInstance] setANRTimeoutInterval:500];
    [[CrabCrashReport sharedInstance] setAppUsername:@"I'm CrashCrashReport"];
 */
    // register for NewRelic
//    [NewRelicAgent startWithApplicationToken:@"AA32458c42bf70d77121fc4d9d8b7ba835348b07fa"];
    
    // register for AppDynamics
    // https://docs.appdynamics.com/display/PRO42/Use+the+APIs+of+the+iOS+SDK+to+Customize+Your+Instrumentation
//    [ADEumInstrumentation initWithKey:@"AD-AAB-AAC-HWY"];
    ADEumAgentConfiguration *adConfig = [[ADEumAgentConfiguration alloc] init];
    adConfig.appKey = @"AD-AAB-AAC-HWY";
    adConfig.enableLogging = YES;
    [ADEumInstrumentation initWithConfiguration:adConfig];
 
/*
    // register for Fabric
    [Fabric with:@[[Crashlytics class]]];
    [self logUser];
    
    // register for dynatrace
    

    // register for toushibao
    [[SmartAgent sharedInstance] startOnCloudWithAppKey:@"wS0n2SF8WRA6pp871oldJ3TgrsbEbpT1P7KK1EgukF7DJ85bJ3h/JVrsjPGFWH8I2JJ3**Ewe5gk!!" monitoringOptions:CWSAMonitoringBlock];
        [[SmartAgent sharedInstance] setBlockTimeout:3.0];
    [[SmartAgent sharedInstance] loggingDataTransmissionResult];
 
    
    
     // fetch uid from umeng server
//    Class cls = NSClassFromString(@"UMANUtil");
//    SEL deviceIDSelector = @selector(openUDIDString);
//    NSString *deviceID = nil;
//    if(cls && [cls respondsToSelector:deviceIDSelector]){
//        deviceID = [cls performSelector:deviceIDSelector];
//    }
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:@{@"oid" : deviceID}
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:nil];
//    
//    NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
    // register for umeng
//    UMConfigInstance.appKey = @"578e037fe0f55ad17b0036a3";
//    [MobClick startWithConfigure:UMConfigInstance];
 */
  
}

- (void) logUser {
    // TODO: Use the current user's information
    // You can call any combination of these three methods
    [CrashlyticsKit setUserIdentifier:@"007"];
    [CrashlyticsKit setUserEmail:@"user@fabric.io"];
    [CrashlyticsKit setUserName:@"Test User"];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
