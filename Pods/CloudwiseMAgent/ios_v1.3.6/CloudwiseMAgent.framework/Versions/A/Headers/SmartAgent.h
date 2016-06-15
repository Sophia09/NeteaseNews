//
//  SmartAgent.h
//  CloudwiseMAgent
//
//  Created by Alvin on 14/1/17.
//  Copyright (c) 2014年 cloudwise. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CWSA_USER_ID        @"cwsa_user_id" //必传
#define CWSA_USER_NAME      @"cwsa_user_name"//可选
#define CWSA_USER_EMAIL     @"cwsa_user_email"//可选
#define CWSA_USER_TOKEN     @"cwsa_user_token"//可选

typedef NS_OPTIONS(NSUInteger, CWSAMonitoring) {
    CWSAMonitoringNone              = 0,//默认关闭H5、socket监控，开启crash收集
    CWSAMonitoringH5                = 1 << 0,// 监控 H5，默认关闭
    CWSAMonitoringSocket            = 1 << 1,// 监控 socket，默认关闭
    CWSAMonitoringCloseCrash        = 1 << 2,// crash信息收集，默认开启
    CWSAMonitoringBlock             = 1 << 3, //监控卡顿,默认关闭
};

@interface SmartAgent : NSObject
/**
 * 获取单例方法
 */
+ (instancetype)sharedInstance;

/**
 * 通过appkey启动sdk
 * \param appKey：从portal.toushibao.com获取到的appkey
 */
- (void)startOnCloudWithAppKey:(NSString *)appKey;

/**
 * 通过appkey启动sdk
 * \param appKey：从portal.toushibao.com获取到的appkey
 * \param traceH5：是否监控H5页面用户行为,传YES，追踪H5页面用户行为。如果不监控H5页面用户行为传NO，或用上面的接口。
 */
- (void)startOnCloudWithAppKey:(NSString *)appKey traceH5:(BOOL)traceH5;

/**
 * 可选监控类型，默认情况下不监控相应功能
 * \param appKey：从portal.toushibao.com获取到的appkey
 * \param options ：默认值为 CWSAMonitoringNone
    例如：要同时增加H5页面监控和socket监控功能
 
     [[SmartAgent sharedInstance] startOnCloudWithAppKey:@"appKey" monitoringOptions:CWSAMonitoringH5 | CWSAMonitoringSocket];
 */
- (void)startOnCloudWithAppKey:(NSString *)appKey monitoringOptions:(CWSAMonitoring)options;

/**
 * 设置上报卡顿事件的阈值，当屏幕卡顿时间 > 设定阈值 ，将记录该次事件，并上报。
 * 默认阈值：3.5s
 * \param blockTimeout ：卡顿阈值
 */
- (void)setBlockTimeout:(NSTimeInterval)blockTimeout;

/**
 * 设置用户身份标识
 * \param properties：以字典形式传入需要统计的信息
    例如：    NSDictionary *properies = [NSDictionary
            dictionaryWithObjectsAndKeys:@"用户id",CWSA_USER_ID,//必传参数
                                         @"用户name",CWSA_USER_NAME,//可选
                                         @"用户email",CWSA_USER_EMAIL,//可选
                                         @"用户token",CWSA_USER_TOKEN,//可选
 nil];
 
 */
- (void)setupUserIdentificationWithProperties:(NSDictionary *)properties;

/**
 * 记录事件。稍后推出用户自定义事件，暂不支持用户调用。
 */
- (void)recordEvent:(NSString *)key segmentation:(NSDictionary *)segmentation count:(int)count;
/**
 * 用于查看数据发送是否成功，调试时使用
 */
-(void)loggingDataTransmissionResult;


@end
