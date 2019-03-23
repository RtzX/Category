//
//  IDateAdapter.h
//  Category
//
//  Created by Mu on 2019/3/23.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DateFormatterDefault @"yyyy-MM-dd HH:mm:ss"

/**
 获取时间  所有的时间 都以北京时间 东八区 为主!!
 */
@protocol IDateAdapter <NSObject>
@optional
/**
 获取时间戳-秒级
 
 @return 秒级时间戳
 */
+ (NSString *)getSecondTimeStringSince1970;
/**
 获取时间戳-毫秒级
 
 @return 毫秒级时间戳
 */
+ (NSString *)getMilliSecondTimeStringSince1970;
/**
 获取标准时间字符串
 
 @return 标准时间字符串
 */
+ (NSString *)getFormatTimeString;

@end

/**
 时间转换
 */
@protocol IDateConvert <NSObject>
#pragma mark --- 时间转换
@required
/**
 时间对象 转 时间格式字符串
 
 @param date 时间对象 formatter 时间格式 默认 yyyy-MM-dd HHmmss
 @return 时间格式 字符串 Date => @"2019-03-23 18:24:24"  YYYY-MM-dd HH:mm:ss
 */
+ (NSString *)dateToString:(NSDate *)date;
/**
 时间对象 转 时间格式字符串
 
 @param date 时间对象
 @param formatter 时间格式 默认 yyyy-MM-dd HHmmss
 @return 时间格式 字符串 Date => @"2019-03-23 18:24:24"  YYYY-MM-dd HH:mm:ss
 */
+ (NSString *)dateToString:(NSDate *)date formatter:(NSString *)formatter;

/**
 时间字符串 转 时间对象
 
 @param dateString 时间字符串 @"2019-03-23 17:56:12" formatter 时间格式 默认 YYYY-MM-dd HH:mm:ss
 @return 时间对象
 */
+ (NSDate *)dateStringToDate:(NSString *)dateString;
/**
 时间字符串 转 时间对象
 
 @param dateString 时间字符串 @"2019-03-23 17:56:12"
 @param formatter 时间格式 默认 YYYY-MM-dd HH:mm:ss
 @return 时间对象
 */
+ (NSDate *)dateStringToDate:(NSString *)dateString formatter:(NSString *)formatter;

/**
 时间戳 转 时间格式字符串
 
 @param time 时间戳 毫秒 or 秒 formatter 时间格式 默认 YYYY-MM-dd HH:mm:ss
 @return 时间格式字符串 1553334972 => @"2019-03-23 17:56:12"
 */
+ (NSString *)timesToString:(NSInteger)time;
/**
 时间戳 转 时间格式字符串
 
 @param time 时间戳 毫秒 or 秒
 @param formatter 时间格式 默认 YYYY-MM-dd HH:mm:ss
 @return 时间格式字符串 1553334972 => @"2019-03-23 17:56:12"
 */
+ (NSString *)timesToString:(NSInteger)time formatter:(NSString *)formatter;
/**
 时间戳 转 时间格式字符串
 
 @param stamp 时间戳 毫秒 or 秒 formatter 时间格式 默认 YYYY-MM-dd HH:mm:ss
 @return 时间格式字符串 1553334972 => @"2019-03-23 17:56:12"
 */
+ (NSString *)timestampToString:(NSString *)stamp;
/**
 时间戳 转 时间格式字符串
 
 @param stamp 时间戳 毫秒 or 秒
 @param formatter 时间格式 默认 YYYY-MM-dd HH:mm:ss
 @return 时间格式字符串 1553334972 => @"2019-03-23 17:56:12"
 */
+ (NSString *)timestampToString:(NSString *)stamp formatter:(NSString *)formatter;

/**
 时间戳 转 时间对象
 
 @param times 时间戳 1553334972 int类型 formatter 时间格式 默认YYYY-MM-dd HH:mm:ss
 @return 时间对象
 */
+ (NSDate *)timesToDate:(NSInteger)times;
/**
 时间戳 转 时间对象
 
 @param times 时间戳 1553334972 int类型
 @param formatter 时间格式 默认YYYY-MM-dd HH:mm:ss
 @return 时间对象
 */
+ (NSDate *)timesToDate:(NSInteger)times formatter:(NSString *)formatter;

/**
 时间戳 转 时间对象
 
 @param stamp 时间戳 1553334972 字符串类型 formatter 时间格式 默认 YYYY-MM-dd HH:mm:ss
 @return 时间对象
 */
+ (NSDate *)timestampToDate:(NSString *)stamp;
/**
 时间戳 转 时间对象
 
 @param stamp 时间戳 1553334972 字符串类型
 @param formatter 时间格式 默认 YYYY-MM-dd HH:mm:ss
 @return 时间对象
 */
+ (NSDate *)timestampToDate:(NSString *)stamp formatter:(NSString *)formatter;

#pragma mark --- 时间转换
/**
 将日期转换为标准时间字符串
 
 @param date 时间
 @return 标准时间字符串时间
 */
+(NSString *)getFormatDateStringFromDate:(NSDate *)date;
/**
 将标准时间字符串转换为日期
 
 @param dateString 时间字符串
 @return 时间
 */
+(NSDate *)getDateFromFormatDateString:(NSString *)dateString;
/**
 时间组件转时间
 
 @param dateComponents 时间组件
 @return 时间
 */
+(NSDate *)dateFromDateComponents:(NSDateComponents *)dateComponents;
/**
 时间转时间组件
 
 @param date 时间
 @return 时间组件
 */
+(NSDateComponents *)dateComponentsFromDate:(NSDate *)date;
/**
 时间组件转时间标准字符串
 
 @param dateComponents 时间组件
 @return 时间标准字符串
 */
+(NSString *)dateFormatStringFromDateComponents:(NSDateComponents *)dateComponents;
/**
 时间标准转时间组件
 
 @param dateString 时间标准
 @return 时间组件
 */
+(NSDateComponents *)dateComponentsFromDateFormatString:(NSString *)dateString;

@end

/**
 日期校验
 */
@protocol IDateDispose <NSObject>
@optional
/**
 *  校验日期范围-过去
 *
 *  @param dateString 日期字符串
 *
 *  @return 结果
 */
+(BOOL)IsCorrectPassDateString:(NSString *)dateString;

/**
 *  校验日期范围-未来日期
 *
 *  @param dateString 日期字符串
 *
 *  @return 结果
 */
+(BOOL)IsCorrectCommingDateString:(NSString *)dateString;
/**
 *  校验日期范围-过去
 *
 *  @param date 日期
 *
 *  @return 结果
 */
+(BOOL)IsCorrectPassDate:(NSDate *)date;
/**
 *  校验日期范围-未来日期
 *
 *  @param date 日期
 *
 *  @return 结果
 */
+(BOOL)IsCorrectCommingDate:(NSDate *)date;

@end

/**
 获取日期包含的信息
 */
@protocol IDateInfo <NSObject>
#pragma mark 判断天数
/**
 获取某年天数
 
 @param year 年
 @return 天数
 */
+(NSInteger)daysForYear:(NSInteger)year;

/**
 获取某年某月天数
 
 @param year 年
 @param month 月
 @return 天数
 */
+(NSInteger)daysForYear:(NSInteger)year andWithMonth:(NSInteger )month;

#pragma mark - 获取星期
/**
 一年第一天星期
 
 @param year 年
 @return 星期  1-7 周日-周六
 */
+(NSInteger )weekForFirstDayInYear:(NSInteger )year;
/**
 某月第一天星期
 
 @param year 年
 @param month 月
 @return 星期  1-7 周日-周六
 */
+(NSInteger )weekForFirstDayInYear:(NSInteger )year andMonth:(NSInteger)month;

/**
 某一天星期
 
 @param year 年
 @param month 月
 @param day 日
 @return 星期  1-7 周日-周六
 */
+(NSInteger )weekForYear:(NSInteger )year andMonth:(NSInteger)month andDay:(NSInteger )day;
/**
 
 获取星期
 
 @param date 日期
 @return 星期  1 2 3 4 5 6 7 星期日-星期六
 */
+ (NSInteger )weekForDate:(NSDate *)date;

/**
 星期几转字符串
 
 @param week 星期index
 @return 星期字符串
 */
+(NSString *)week:(NSInteger)week;

#pragma mark 农历
/**
 获取某年某月农历年
 
 @param date 日期
 @return 农历年
 */
+(NSString *)chineseYearForDate:(NSDate *)date;
/**
 获取某年某月农历年
 
 @param year 年
 @param month 月
 @param day 日
 @return 农历年
 */
+(NSString* )chineseYearForFirstDayForYear:(NSInteger )year andMonth:(NSInteger)month andDay:(NSInteger )day;

/**
 获取某年某月农历月份
 
 @param date 日期
 @return 农历月份
 */
+(NSString *)chineseMonthForDate:(NSDate *)date;
/**
 获取某年某月农历月份
 
 @param year 年
 @param month 月
 @param day 日
 @return 农历月份
 */
+(NSString *)chineseMonthForYear:(NSInteger )year andMonth:(NSInteger)month andDay:(NSInteger )day;

/**
 获取某年某月农历日
 
 @param date 日期
 @return 农历日
 */
+(NSString *)chineseDayForDate:(NSDate *)date;
/**
 获取某年某月农历日
 
 @param year 年
 @param month 月
 @param day 日
 @return 农历日
 */
+(NSString* )chineseDayForYear:(NSInteger )year andMonth:(NSInteger)month andDay:(NSInteger )day;
#pragma mark 日期计算
/**
 获取上月的年
 
 @param year 当前年
 @param month 当前月
 @return 上月的年份
 */
+(NSInteger)getYearForBeforeMonthInYear:(NSInteger)year andMonth:(NSInteger)month;
/**
 获取下月的年
 
 @param year 当前年
 @param month 当前月
 @return 下月的年份
 */
+(NSInteger)getYearForNextMonthInYear:(NSInteger)year andMonth:(NSInteger)month;
/**
 获取上月的月份
 
 @param year 当前年
 @param month 当前月
 @return 上月的月份
 */
+(NSInteger)getMonthForBeforeMonthInYear:(NSInteger)year andMonth:(NSInteger)month;
/**
 获取下月的月份
 
 @param year 当前年
 @param month 当前月
 @return 下月的月份
 */
+(NSInteger)getMonthForNextMonthInYear:(NSInteger)year andMonth:(NSInteger)month;


/**
 获取上一日的年
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 上一个日的年份
 */
+(NSInteger)getYearForBeforeDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day;
/**
 获取下一日的年
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 下一日的年份
 */
+(NSInteger)getYearForNextDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day;
/**
 获取上一日的月份
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 上一日的月份
 */
+(NSInteger)getMonthForBeforeDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day;
/**
 获取下一日的月份
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 下一日的月份
 */
+(NSInteger)getMonthForNextDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day;
/**
 获取上一日的日
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 上一日的日
 */
+(NSInteger)getDayForBeforeDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day;
/**
 获取下一日的日
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 下一日的日
 */
+(NSInteger)getDayForNextDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day;


@end
