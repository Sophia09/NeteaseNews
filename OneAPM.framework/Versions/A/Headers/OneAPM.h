//
//  OneAPM.h
//  BlueWare
//
//  Created by lidong on 14-7-15.
//  Copyright (c) 2014年 BLUEWARE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneAPM : NSObject

    /******************************************************************************
     * Function: + (void)startWithApplicationToken:(NSString *)token
     * Parameters:
     *  token:
     *       the token string got from www.OneAPM.com
     ******************************************************************************/
+ (void)startWithApplicationToken:(NSString *)token;

/******************************************************************************
 * Function: + (void)startWithApplicationToken:(NSString *)token
 * Parameters:
 *  token:
 *       the string given on www.oneapm.com
 *  isSSL: (Default is YES)
 *        YES - communicate with host by https
 *        NO  - communicate with host by http
 ******************************************************************************/
+ (void)startWithApplicationToken:(NSString *)token
                     withSecurity:(BOOL)isSSL;

/*******************************************************************************
 * Function: + (void)setHost:(NSString *)host
 * Parameters:
 ******************************************************************************/
+ (void)setHost:(NSString *)host;

/*******************************************************************************
 * Function: + (void)setAppPublishChannel:(NSString *)channel;
 * Parameters:
 ******************************************************************************/
+ (void)setAppPublishChannel:(NSString *)channel;

/******************************************************************************
 * Function: + (void)disableZLib
 * use zlib is enabled by default.
 * Call this before startWithApplicationToken to disable.
 ******************************************************************************/
+ (void)disableZLib;


/******************************************************************************
 * Function: + (void)printLog:(BOOL)enable
 * Parameters:
 *  enable: (Default is NO)
 *       YES - enable agent log printing
 *       NO  - disable agent log printing.
 ******************************************************************************/
+ (void)printLog:(BOOL)enable;

/******************************************************************************
 * Function: + (void)disableCrashReport
 * Crash report is enabled by default.
 * Call this before startWithApplicationToken to disable.
 ******************************************************************************/
+ (void)disableCrashReport;

/******************************************************************************
 * Function: + (void)setCustomInfo:(NSString *)info
 * set custom information to identify a certain user.
 * Call this after startWithApplicationToken.
 ******************************************************************************/
+ (void)setCustomInfo:(NSString *)info;

/**
 *    @method setBlockMonitorTimeout:
 *    @brief  设置上报卡顿时间的阈值，当 UI 卡顿时间大于该阈值时，上报该卡顿事件
 *    @param blockTimeout 卡顿阀值，单位毫秒(ms)，默认值 3000 ms，在 200 ms < X < 10000
             ms 之间设置
 *    @note 在 调用 startWithApplicationToken: 前设置
 */
+ (void)setBlockMonitorTimeout:(NSTimeInterval)blockTimeout;

/**
 *    @method setBlockMonitorEnable:
 *    @brief 设置 SDK 是否收集卡顿信息，默认开启
 *    @param YES: 收集卡顿信息  NO: 不收集卡顿信息
 *    @note 在 调用 startWithApplicationToken: 前设置
 */
+ (void)setBlockMonitorEnable:(BOOL)enableBlockMonitor;

@end
