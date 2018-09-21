//
//  NSDate+XXDate.h
//  XXKit
//
//  Created by R on 2018/5/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XXDate)

+ (NSCalendar *) xx_currentCalendar;
+ (NSDate *)xx_convertDateToLocalTime: (NSDate *)forDate;

#pragma mark - 相对日期
+ (NSDate *) xx_dateNow;
+ (NSDate *) xx_dateTomorrow;
+ (NSDate *) xx_dateYesterday;
+ (NSDate *) xx_dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *) xx_dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *) xx_dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *) xx_dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *) xx_dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *) xx_dateWithMinutesBeforeNow: (NSInteger) dMinutes;

#pragma mark - 日期转字符串
- (NSString *) xx_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
- (NSString *) xx_stringWithFormat: (NSString *) format;
//时间戳转日期
+ (NSString *)xx_stringWithTime:(NSTimeInterval)time;

@property (nonatomic, readonly) NSString *xx_shortString;
@property (nonatomic, readonly) NSString *xx_shortDateString;
@property (nonatomic, readonly) NSString *xx_shortTimeString;
@property (nonatomic, readonly) NSString *xx_mediumString;
@property (nonatomic, readonly) NSString *xx_mediumDateString;
@property (nonatomic, readonly) NSString *xx_mediumTimeString;
@property (nonatomic, readonly) NSString *xx_longString;
@property (nonatomic, readonly) NSString *xx_longDateString;
@property (nonatomic, readonly) NSString *xx_longTimeString;

#pragma mark - 日期比较
- (BOOL) xx_isEqualToDateIgnoringTime: (NSDate *) aDate;

- (BOOL) xx_isToday;
- (BOOL) xx_isTomorrow;
- (BOOL) xx_isYesterday;

- (BOOL) xx_isSameWeekAsDate: (NSDate *) aDate;
- (BOOL) xx_isThisWeek;
- (BOOL) xx_isNextWeek;
- (BOOL) xx_isLastWeek;

- (BOOL) xx_isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) xx_isThisMonth;
- (BOOL) xx_isNextMonth;
- (BOOL) xx_isLastMonth;

- (BOOL) xx_isSameYearAsDate: (NSDate *) aDate;
- (BOOL) xx_isThisYear;
- (BOOL) xx_isNextYear;
- (BOOL) xx_isLastYear;

- (BOOL) xx_isEarlierThanDate: (NSDate *) aDate;
- (BOOL) xx_isLaterThanDate: (NSDate *) aDate;

- (BOOL) xx_isInFuture;
- (BOOL) xx_isInPast;

#pragma mark - 日期规则
- (BOOL) xx_isTypicallyWorkday;
- (BOOL) xx_isTypicallyWeekend;

#pragma mark - 调整日期
- (NSDate *) xx_dateByAddingYears: (NSInteger) dYears;
- (NSDate *) xx_dateBySubtractingYears: (NSInteger) dYears;
- (NSDate *) xx_dateByAddingMonths: (NSInteger) dMonths;
- (NSDate *) xx_dateBySubtractingMonths: (NSInteger) dMonths;
- (NSDate *) xx_dateByAddingDays: (NSInteger) dDays;
- (NSDate *) xx_dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) xx_dateByAddingHours: (NSInteger) dHours;
- (NSDate *) xx_dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) xx_dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) xx_dateBySubtractingMinutes: (NSInteger) dMinutes;

#pragma mark - 极端日期
- (NSDate *) xx_dateAtStartOfDay;
- (NSDate *) xx_dateAtEndOfDay;

#pragma mark - 日期间隔
- (NSInteger) xx_minutesAfterDate: (NSDate *) aDate;
- (NSInteger) xx_minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) xx_hoursAfterDate: (NSDate *) aDate;
- (NSInteger) xx_hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) xx_daysAfterDate: (NSDate *) aDate;
- (NSInteger) xx_daysBeforeDate: (NSDate *) aDate;
- (NSInteger) xx_distanceInDaysToDate:(NSDate *)anotherDate;

#pragma mark - 分解日期
@property (readonly) NSInteger xx_nearestHour;
@property (readonly) NSInteger xx_hour;
@property (readonly) NSInteger xx_minute;
@property (readonly) NSInteger xx_seconds;
@property (readonly) NSInteger xx_day;
@property (readonly) NSInteger xx_month;
@property (readonly) NSInteger xx_weekOfMonth;
@property (readonly) NSInteger xx_weekOfYear;
@property (readonly) NSInteger xx_weekday;
@property (readonly) NSInteger xx_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger xx_year;

@end
