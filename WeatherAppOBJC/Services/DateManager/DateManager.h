//
//  DateManager.h
//  WeatherAppOBJC
//
//  Created by Александр on 6/5/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateManager : NSObject

- (NSString *) getDayNameFromTimeInterval: (NSTimeInterval *)timeInterval;
- (NSString *) getHourTimeFormatFromTimeInterval: (NSTimeInterval *)timeInterval;
- (NSString *) getDefaultTimeFormatFromTimeInterval: (NSTimeInterval *)timeInterval;

@end

NS_ASSUME_NONNULL_END
