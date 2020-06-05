//
//  DateManager.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/5/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "DateManager.h"

@implementation DateManager

- (NSString *) getDayNameFromTimeInterval: (NSTimeInterval *)timeInterval {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:*timeInterval];
    NSInteger dayNumber = [[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate:date];
    switch (dayNumber) {
        case 1: return @"Sunday";
        case 2: return @"Monday";
        case 3: return @"Tuesday";
        case 4: return @"Wednesday";
        case 5: return @"Thursday";
        case 6: return @"Friday";
        case 7: return @"Saturday";
        default: return @"";
    }
}

- (NSString *) getHourTimeFormatFromTimeInterval: (NSTimeInterval *)timeInterval {
    return [self getTimeFormatFromTimeInterval:timeInterval format:NSCalendarUnitHour];
}

- (NSString *) getDefaultTimeFormatFromTimeInterval: (NSTimeInterval *)timeInterval {
    return [self getTimeFormatFromTimeInterval:timeInterval format:NSCalendarUnitHour | NSCalendarUnitMinute];
}

- (NSString *) getTimeFormatFromTimeInterval: (NSTimeInterval *)timeInterval format: (NSCalendarUnit)format {
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    formatter.allowedUnits = format;
    NSDate *startOfDay = [[NSCalendar currentCalendar] startOfDayForDate:[NSDate dateWithTimeIntervalSince1970:*timeInterval]];
    return [formatter stringFromTimeInterval:(*timeInterval - startOfDay.timeIntervalSince1970)];
}
@end
