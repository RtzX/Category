//
//  LSSafeProtector.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//  github: https://github.com/lsmakethebest/LSSafeProtector

#import <Foundation/Foundation.h>
#import "LSSafeProtectorDefine.h"

#define LSKVOSafeLog(fmt, ...) safe_KVOCustomLog(fmt,##__VA_ARGS__)

@interface LSSafeProtector : NSObject
/**
 一键开启 区分debug 和 release 模式
 
 在 AppDelegate=> application:didFinishLaunchingWithOptions 第一时间调用
 
 @param block 回调的block 对所有crash的处理
 */
+ (void)startSafeBlock:(LSSafeProtectorBlock)block;
/**
 打开目前所支持的所有安全保护
 
 @param isDebug
 //isDebug=YES 代表测试环境，当捕获到crash时会利用断言闪退， 同时回调block
 //isDebug=NO  代表正式环境，当捕获到crash时不会利用断言闪退，会回调block
 @param block  回调的block
 */
+ (void)openSafeProtectorWithIsDebug:(BOOL)isDebug block:(LSSafeProtectorBlock)block;
/**
 开启防止指定类型的crash
 
 @param isDebug
 //isDebug=YES 代表测试环境，当捕获到crash时会利用断言闪退， 同时回调block
 //isDebug=NO  代表正式环境，当捕获到crash时不会利用断言闪退，会回调block
 @param types 想防止哪些类crash
 @param block 回调的block
 */
+ (void)openSafeProtectorWithIsDebug:(BOOL)isDebug types:(LSSafeProtectorCrashType)types block:(LSSafeProtectorBlock)block;

+ (void)safe_logCrashWithException:(NSException *)exception crashType:(LSSafeProtectorCrashType)crashType;

//是否开启KVO添加移除日志信息，默认为NO
+ (void)setLogEnable:(BOOL)enable;
//自定义log函数
void safe_KVOCustomLog(NSString *format,...);

@end
