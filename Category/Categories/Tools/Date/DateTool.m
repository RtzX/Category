//
//  DateTool.m
//  Category
//
//  Created by Mu on 2019/3/23.
//  Copyright © 2019 Mu. All rights reserved.
//

#import "DateTool.h"
#import "ToolHeader.h"
#import "Collection.h"

#define Date_yMdHms  @"yyyyMMddHHmmss"
#define Date_yMd     @"yyyyMMdd"
#define Date_yMdH    @"yyyyMMddHH"
#define Date_yMdHm   @"yyyyMMddHHmm"
#define Date_YMd   @"yyyy-MM-dd"


@implementation DateTool
#pragma mark 获取时间
/**
 获取时间戳-秒级
 
 @return 秒级时间戳
 */
+ (NSString *)getSecondTimeStringSince1970
{
    
    NSDate* date = [NSDate date];
    NSTimeInterval interval = [date timeIntervalSince1970];
    //  *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%f", interval]; //转为字符型
    NSString *timeStr = [NSString stringWithFormat:@"%lf",[timeString doubleValue] * 1000000];
    if(timeStr.length >= 16) {
        return [timeStr substringToIndex:16];
    }else {
        return timeStr;
    }
}

/**
 获取时间戳-毫秒级
 
 @return 毫秒级时间戳
 */
+ (NSString *)getMillisecondTimeStringSince1970
{
    NSDate* date = [NSDate date];
    NSTimeInterval interval=[date timeIntervalSince1970]*1000;
    //  *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%f", interval]; //转为字符型
    NSString *timeStr = [NSString stringWithFormat:@"%lf",[timeString doubleValue] * 1000000];
    
    if(timeStr.length >= 16){
        return [timeStr substringToIndex:16];
    }else {
        return timeStr;
    }
}

+ (NSString *)dateToString:(NSDate *)date
{
    return [DateTool dateToString:date formatter:DateFormatterDefault];
}

+ (NSString *)dateToString:(NSDate *)date formatter:(NSString *)formatter
{
    NSString *dateString = [[DateTool getLoaclFormatter: formatter] stringFromDate:date];
    
    return dateString;
}

+ (NSDate *)dateStringToDate:(NSString *)dateString
{
    return [DateTool dateStringToDate:dateString formatter:DateFormatterDefault];
}

+ (NSDate *)dateStringToDate:(NSString *)dateString formatter:(NSString *)formatter
{
    NSDate *date = [[DateTool getLoaclFormatter: formatter] dateFromString:dateString];
    
    return date;
}

+ (NSString *)timesToString:(NSInteger)time
{
    return [DateTool timesToString:time formatter:DateFormatterDefault];
}

+ (NSString *)timesToString:(NSInteger)time formatter:(NSString *)formatter
{
    return [DateTool timestampToString:[NSString stringWithFormat:@"%ld", time] formatter:formatter];
}

+ (NSString *)timestampToString:(NSString *)stamp
{
    return [DateTool timestampToString:stamp formatter:DateFormatterDefault];
}

+ (NSString *)timestampToString:(NSString *)stamp formatter:(NSString *)formatter
{
    if ([stamp isEmptyOrNull]) {
        return @"2019-01-01 00:00:00";
    }
    // 秒级时间戳 1553337820  10位
    // 毫秒级时间戳 1499825149257 13位
    NSInteger current = [stamp integerValue];
    if (stamp.length >= 13) {
        current = current / 1000;
    }
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:current];
    NSString *confromTimespStr = [[DateTool getLoaclFormatter: formatter] stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

+ (NSDate *)timesToDate:(NSInteger)times
{
    return [DateTool timesToDate:times formatter:DateFormatterDefault];
}

+ (NSDate *)timesToDate:(NSInteger)times formatter:(NSString *)formatter
{
    return [DateTool timestampToDate:[NSString stringWithFormat:@"%ld", times] formatter:formatter];
}

+ (NSDate *)timestampToDate:(NSString *)stamp
{
    return [DateTool timestampToDate:stamp formatter:DateFormatterDefault];
}

+ (NSDate *)timestampToDate:(NSString *)stamp formatter:(NSString *)formatter
{
    if ([stamp isEmptyOrNull]) {
        return [NSDate date];
    }
    // 秒级时间戳 1553337820  10位
    // 毫秒级时间戳 1499825149257 13位
    NSInteger current = [stamp integerValue];
    if (stamp.length >= 13) {
        current = current / 1000;
    }
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:current];

    return confromTimesp;
}

+ (NSDateFormatter *)getLoaclFormatter:(NSString *)formatter
{
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    
    [matter setDateStyle:NSDateFormatterMediumStyle];
    
    [matter setTimeStyle:NSDateFormatterShortStyle];
    
    [matter setDateFormat:formatter];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [matter setTimeZone:timeZone];
    
    return matter;
}

/**
 获取标准时间字符串
 
 @return 标准时间字符串
 */
+ (NSString *)getFormatTimeString
{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:Date_yMdHms];
    NSString *dateString = [formatter stringFromDate:nowDate];
    
    return dateString;
}

#pragma mark 时间转换
/**
 将日期转换为标准时间字符串
 
 @param date 时间
 @return 标准时间字符串
 */
+ (NSString *)getFormatDateStringFromDate:(NSDate *)date
{
    if(date == nil){
        ToolLog(@"date不能为空");
        return nil;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:Date_yMdHms];
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}

/**
 将标准时间字符串转换为日期
 
 @param dateString 时间字符串
 @return 标准时间
 */
+ (NSDate *)getDateFromFormatDateString:(NSString *)dateString
{
    if ([dateString isEmptyOrNull]) {
        ToolLog(@"dateString不能为空");
        return nil;
    }
    dateString=[DateTool getNumberFromString:dateString];
    
    if(dateString.length < 8){
        ToolLog(@"dateString格式不对");
        return nil;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if(dateString.length == 14) {
        [formatter setDateFormat:Date_yMdHms];
    }else if(dateString.length == 8) {
        [formatter setDateFormat:Date_yMd];
    }else if (dateString.length == 10) {
        [formatter setDateFormat:Date_yMdH];
    }else {
        [formatter setDateFormat:Date_yMdHm];
    }
    NSDate *date = [formatter dateFromString:dateString];
    
    return date;
}

/**
 时间组件转时间
 
 @param dateComponents 时间组件
 @return 时间
 */
+ (NSDate *)dateFromDateComponents:(NSDateComponents *)dateComponents
{
    if(dateComponents == nil){
        ToolLog(@"dateComponents不能为空");
        return nil;
    }
    NSCalendar *gregorian;
#ifdef __IPHONE_8_0
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    uint flags;
#ifdef __IPHONE_8_0
    flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
#else
    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
#endif
    
    NSDate *date = [gregorian dateFromComponents:dateComponents];
    
    return date;
}

/**
 时间转时间组件
 
 @param date 时间
 @return 时间组件
 */
+(NSDateComponents *)dateComponentsFromDate:(NSDate *)date
{
    if(date == nil){
        ToolLog(@"date不能为空");
        return nil;
    }
    NSCalendar *gregorian;
#ifdef __IPHONE_8_0
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    NSString *year,*month,*day,*hour,*minute,*seconed;
    NSDateFormatter *f=[[NSDateFormatter alloc]init];
    f.dateFormat = @"yyyy";
    year=[f stringFromDate:date];
    f.dateFormat = @"MM";
    month=[f stringFromDate:date];
    f.dateFormat = @"dd";
    day=[f stringFromDate:date];
    f.dateFormat = @"HH";
    hour=[f stringFromDate:date];
    f.dateFormat = @"mm";
    minute=[f stringFromDate:date];
    f.dateFormat = @"ss";
    seconed=[f stringFromDate:date];
    
    [components setYear:year.integerValue];
    [components setMonth:month.integerValue];
    [components setDay:day.integerValue];
    [components setHour:hour.integerValue];
    [components setMinute:minute.integerValue];
    [components setSecond:seconed.integerValue];
    
    return components;
}
/**
 时间组件转时间标准字符串
 
 @param dateComponents 时间组件
 @return 时间标准字符串
 */
+ (NSString *)dateFormatStringFromDateComponents:(NSDateComponents *)dateComponents
{
    if(dateComponents == nil) {
        ToolLog(@"dateComponents不能为空");
        return nil;
    }
    NSCalendar *gregorian;
#ifdef __IPHONE_8_0
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    NSDate *date = [gregorian dateFromComponents:dateComponents];
    
    return [DateTool getFormatDateStringFromDate:date];
}
/**
 时间标准转时间组件
 
 @param dateString 时间标准
 @return 时间组件
 */
+ (NSDateComponents *)dateComponentsFromDateFormatString:(NSString *)dateString
{
    if ([dateString isEmptyOrNull]) {
          ToolLog(@"dateString不能为空");
        return nil;
    }
    
    NSDate *date = [DateTool getDateFromFormatDateString:dateString];
    if(date == nil){
        ToolLog(@"date不能为空");
        return nil;
    }
    NSCalendar *gregorian;
#ifdef __IPHONE_8_0
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    NSString *year,*month,*day,*hour,*minute,*seconed;
    NSDateFormatter *f=[[NSDateFormatter alloc]init];
    f.dateFormat = @"yyyy";
    year=[f stringFromDate:date];
    f.dateFormat = @"MM";
    month=[f stringFromDate:date];
    f.dateFormat = @"dd";
    day=[f stringFromDate:date];
    f.dateFormat = @"HH";
    hour=[f stringFromDate:date];
    f.dateFormat = @"mm";
    minute=[f stringFromDate:date];
    f.dateFormat = @"ss";
    seconed=[f stringFromDate:date];
    
    [components setYear:year.integerValue];
    [components setMonth:month.integerValue];
    [components setDay:day.integerValue];
    [components setHour:hour.integerValue];
    [components setMinute:minute.integerValue];
    [components setSecond:seconed.integerValue];
    
    return components;
}

#pragma mark 日期校验
/**
 *  校验日期范围-过去
 *
 *  @param dateString 日期字符串
 *
 *  @return 结果
 */
+ (BOOL)IsCorrectPassDateString:(NSString *)dateString
{
    if([dateString isEmptyOrNull] || dateString.length<8) {
        ToolLog(@"dateString不能为空且不能小于8位");
        return NO;
    }
    dateString=[DateTool getNumberFromString:dateString];
    NSDateFormatter *f=[[NSDateFormatter alloc]init];
    
    if(dateString.length == 14) {
        [f setDateFormat:Date_yMdHms];
    }else if(dateString.length == 8){
        [f setDateFormat:Date_yMd];
    }else if (dateString.length == 10){
        [f setDateFormat:Date_yMdH];
    }else {
        [f setDateFormat:Date_yMdHm];
    }
    
    if([dateString compare:[f stringFromDate:[NSDate date]]] <= 0) {
        return YES;
    }
    return NO;
}

/**
 *  校验日期范围-未来日期
 *
 *  @param dateString 日期字符串
 *
 *  @return 结果
 */
+ (BOOL)IsCorrectCommingDateString:(NSString *)dateString{
    if( [dateString isEmptyOrNull] || dateString.length < 8) {
        ToolLog(@"dateString不能为空且不能小于8位");
        return NO;
    }
    dateString = [DateTool getNumberFromString:dateString];
    NSDateFormatter *f = [[NSDateFormatter alloc]init];
    
    if(dateString.length == 14){
        [f setDateFormat:Date_yMdHms];
    }else if(dateString.length == 8){
        [f setDateFormat:Date_yMd];
    }else if (dateString.length == 10){
        [f setDateFormat:Date_yMdH];
    }else {
        [f setDateFormat:Date_yMdHm];
    }
    if([dateString compare:[f stringFromDate:[NSDate date]]] >= 0){
        return YES;
    }
    return NO;
}

/**
 *  校验日期范围-过去
 *
 *  @param date 日期
 *
 *  @return 结果
 */
+ (BOOL)IsCorrectPassDate:(NSDate *)date
{
    if(date == nil){
        ToolLog(@"date不能为空");
        return NO;
    }
    NSDateFormatter *f = [[NSDateFormatter alloc]init];
    f.dateFormat = Date_yMd;
    if([[f stringFromDate:date] compare:[f stringFromDate:[NSDate date]]] <= 0){
        return YES;
    }
    return NO;
}

/**
 *  校验日期范围-未来日期
 *
 *  @param date 日期
 *
 *  @return 结果
 */
+ (BOOL)IsCorrectCommingDate:(NSDate *)date
{
    if(date == nil) {
        ToolLog(@"date不能为空");
        return NO;
    }
    NSDateFormatter *f = [[NSDateFormatter alloc]init];
    f.dateFormat = Date_yMd;
    if([[f stringFromDate:date] compare:[f stringFromDate:[NSDate date]]] >= 0){
        return YES;
    }
    return NO;
}

#pragma mark 判断天数
/**
 获取某年天数
 
 @param year 年
 @return 天数
 */
+ (NSInteger)daysForYear:(NSInteger)year{
    if((year%4 == 0) && (year%400 != 0)){
        return 366;
    }
    return 365;
}

/**
 获取某年某月天数
 
 @param year 年
 @param month 月
 @return 天数
 */
+ (NSInteger)daysForYear:(NSInteger)year andWithMonth:(NSInteger )month
{
    if(month < 1 || month > 12){
        ToolLog(@"month不正确");
        return 0;
    }
    NSArray *days = @[@"31",@"28",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31"];
    if((year%4 == 0) && (year%400 != 0)) {
        days=@[@"31",@"29",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31"];;
    }
    
    NSString *daysStr=days[month-1];
    return daysStr.integerValue;
}

#pragma mark - 获取星期
/**
 一年第一天星期
 
 @param year 年
 @return 星期  1-7 周日-周六
 */
+ (NSInteger )weekForFirstDayInYear:(NSInteger )year
{
    NSString *dateString = [NSString stringWithFormat:@"%0.4ld0101",year];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = Date_yMd;
    NSDate *date=[dateFormatter dateFromString:dateString];
    
    return [DateTool weekForDate:date];
}
/**
 某月第一天星期
 
 @param year 年
 @param month 月
 @return 星期  1-7 周日-周六
 */
+ (NSInteger )weekForFirstDayInYear:(NSInteger )year andMonth:(NSInteger)month
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    
    NSString *dateString = [NSString stringWithFormat:@"%0.4ld%0.2ld01",year,month];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = Date_yMd;
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return [DateTool weekForDate:date];
}
/**
 某一天星期
 
 @param year 年
 @param month 月
 @param day 日
 @return 星期  1-7 周日-周六
 */
+ (NSInteger )weekForYear:(NSInteger )year andMonth:(NSInteger)month andDay:(NSInteger )day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return 0;
    }
    NSString *dateString = [NSString stringWithFormat:@"%0.4ld%0.2ld%0.2ld",year,month,day];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = Date_yMd;
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return [DateTool weekForDate:date];
}

/**
 获取星期
 
 @param date 日期
 @return 星期  1 2 3 4 5 6 7 星期日-星期六
 */
+ (NSInteger )weekForDate:(NSDate *)date
{
    if(date == nil){
        ToolLog(@"date不能为空");
        return 0;
    }
    NSCalendar *calendar;
    NSInteger unitFlags ;
#ifdef __IPHONE_8_0
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
#else
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
#endif
    // 添加日期
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    NSDateFormatter  *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:Date_YMd];
    comps = [calendar components:unitFlags fromDate:date];
    
    return [comps weekday];
}

/**
 星期几转字符串
 
 @param week 星期index
 @return 星期字符串
 */
+ (NSString *)week:(NSInteger)week
{
    NSString *weekStr = @"星期一";
    switch (week) {
        case 1: weekStr = @"星期天"; break;
        case 2: weekStr = @"星期一"; break;
        case 3: weekStr = @"星期二"; break;
        case 4: weekStr = @"星期三"; break;
        case 5: weekStr = @"星期四"; break;
        case 6: weekStr = @"星期五"; break;
        case 7: weekStr = @"星期六"; break;
    }
    return weekStr;
}

#pragma mark 农历
/**
 获取某年某月农历年
 
 @param date 日期
 @return 农历年
 */
+ (NSString *)chineseYearForDate:(NSDate *)date
{
    if(date == nil){
        ToolLog(@"date不能为空");
        return nil;
    }
    
    NSArray *chineseYears = [NSArray arrayWithObjects:@"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",@"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",@"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",@"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑", @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",@"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",@"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    NSString *yearString = [chineseYears objectAtIndex:localeComp.year-1];
    
    return yearString;
}
/**
 获取某年某月农历年
 
 @param year 年
 @param month 月
 @param day 日
 @return 农历年
 */
+ (NSString* )chineseYearForFirstDayForYear:(NSInteger )year andMonth:(NSInteger)month andDay:(NSInteger )day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return nil;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return nil;
    }
    
    NSString *dateString = [NSString stringWithFormat:@"%0.4ld%0.2ld%0.2ld",year,month,day];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = Date_yMd;
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return [DateTool chineseYearForDate:date];
}

/**
 获取某年某月农历月份
 
 @param date 日期
 @return 农历月份
 */
+ (NSString *)chineseMonthForDate:(NSDate *)date
{
    if(date == nil){
        ToolLog(@"date不能为空");
        return nil;
    }
    
    NSArray * monthArr = [NSArray arrayWithObjects:
                          @"正月", @"二月", @"三月", @"四月", @"五月",@"六月", @"七月", @"八月", @"九月", @"十月", @"冬月", @"腊月", nil];
    
    unsigned unitFlags =  NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    NSString *monthString = [monthArr objectAtIndex:localeComp.month-1];
    
    return monthString;
}

/**
 获取某年某月农历月份
 
 @param year 年
 @param month 月
 @param day 日
 @return 农历月份
 */
+ (NSString *)chineseMonthForYear:(NSInteger )year andMonth:(NSInteger)month andDay:(NSInteger )day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return nil;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return nil;
    }
    NSString *dateString = [NSString stringWithFormat:@"%0.4ld%0.2ld%0.2ld",year,month,day];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = Date_yMd;
    NSDate *date=[dateFormatter dateFromString:dateString];
    
    return [DateTool chineseMonthForDate:date];
}
/**
 获取某年某月农历日
 
 @param date 日期
 @return 农历日
 */
+ (NSString *)chineseDayForDate:(NSDate *)date
{
    if(date == nil){
        ToolLog(@"date不能为空");
        return nil;
    }
    NSArray *dayArr = [NSArray arrayWithObjects:
                         @"初一", @"初二", @"初三", @"初四",@"初五", @"初六", @"初七", @"初八", @"初九", @"初十",@"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",@"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    unsigned unitFlags =  NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    NSString *dayString = [dayArr objectAtIndex:localeComp.day-1];
    
    return dayString;
}
/**
 获取某年某月农历日
 
 @param year 年
 @param month 月
 @param day 日
 @return 农历日
 */
+ (NSString* )chineseDayForYear:(NSInteger )year andMonth:(NSInteger)month andDay:(NSInteger )day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return nil;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return nil;
    }
    
    NSString *dateString=[NSString stringWithFormat:@"%0.4ld%0.2ld%0.2ld",year,month,day];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = Date_yMd;
    NSDate *date=[dateFormatter dateFromString:dateString];
    
    return [DateTool chineseDayForDate:date];
}
#pragma mark 日期计算
/**
 获取上一个月的年
 
 @param month 月份
 @param year 年
 @return 上一个月的年份
 */
+ (NSInteger)getYearForBeforeMonthInYear:(NSInteger)year andMonth:(NSInteger)month
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(month == 1){
        return year-1;
    }else {
        return year;
    }
}
/**
 获取下一个月的年
 
 @param month 月份
 @param year 年
 @return 下一个月的年份
 */
+ (NSInteger)getYearForNextMonthInYear:(NSInteger)year andMonth:(NSInteger)month
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(month == 12){
        return year+1;
    }else {
        return year;
    }
}
/**
 获取上一个月的月份
 
 @param month 月份
 @param year 年
 @return 上一个月的月份
 */
+ (NSInteger)getMonthForBeforeMonthInYear:(NSInteger)year andMonth:(NSInteger)month
{
    if( month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(month == 1){
        return 12;
    }else {
        return month - 1;
    }
}
/**
 获取下一个月的月份
 
 @param month 月份
 @param year 年
 @return 下一个月的月份
 */
+ (NSInteger)getMonthForNextMonthInYear:(NSInteger)year andMonth:(NSInteger)month
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(month == 12){
        return 1;
    }else {
        return month + 1;
    }
}
/**
 获取上一日的年
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 上一个日的年份
 */
+ (NSInteger)getYearForBeforeDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return 0;
    }
    if(month == 1 && day == 1){
        return year-1;
    }else{
        return year;
    }
}
/**
 获取下一日的年
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 下一日的年份
 */
+ (NSInteger)getYearForNextDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return 0;
    }
    if( month == 12 && day == 31){
        return year-1;
    }else{
        return year;
    }
}
/**
 获取上一日的月份
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 上一日的月份
 */
+ (NSInteger)getMonthForBeforeDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return 0;
    }
    if(day == 1){
        if(month == 1){
            return 12;
            
        }else{
            return month-1;
            
        }
    }else{
        return month;
    }
}
/**
 获取下一日的月份
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 下一日的月份
 */
+ (NSInteger)getMonthForNextDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return 0;
    }
    if(day == [DateTool daysForYear:year andWithMonth:month]){
        if(month == 12){
            return 1;
            
        }else{
            return month+1;
            
        }
    }else{
        return month;
    }
}
/**
 获取上一日的日
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 上一日的日
 */
+ (NSInteger)getDayForBeforeDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return 0;
    }
    if(day == 1){
        if(month == 1){
            return 31;
        }else{
            return [DateTool daysForYear:year andWithMonth:month-1];
        }
    }else{
        return day-1;
    }
}
/**
 获取下一日的日
 
 @param year 当前年
 @param month 当前月
 @param day 当前日
 @return 下一日的日
 */
+ (NSInteger)getDayForNextDayInYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day
{
    if(month < 1 || month > 12){
        ToolLog(@"月份超出范围");
        return 0;
    }
    if(day < 1 || day > [DateTool daysForYear:year andWithMonth:month]){
        ToolLog(@"日超出范围");
        return 0;
    }
    if(day == [DateTool daysForYear:year andWithMonth:month]){
        return 1;
    }else{
        return day+1;
    }
}
#pragma mark 其他
/**
 *  获取数字字符串
 *
 *  @param string 原str
 *
 *  @return 字符串中的数字字符串
 */
+ (NSString *)getNumberFromString:(NSString *)string
{
    if([string isEmptyOrNull]){
        ToolLog(@"字符串为空");
        return nil;
    }
    NSString *numStr = string;
    NSArray *numArr = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSRange r;
    for(int i = 0;i<string.length;i++){
        (void)(r.length = 1),r.location = i;
        NSString *sub = [string substringWithRange:r];
        if(![numArr containsObject:sub]){
            numStr = [numStr stringByReplacingCharactersInRange:r withString:@"-"];
        }
    }
    while ([numStr containsString:@"-"]) {
        numStr = [numStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    return numStr;
}

@end
