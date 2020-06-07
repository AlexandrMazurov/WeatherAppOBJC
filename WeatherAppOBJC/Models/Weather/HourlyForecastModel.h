//
//  HoutlyForecastModel.h
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HourlyForecastManagedObject;

@interface HourlyForecastModel : NSObject

@property NSString *degree;
@property NSString *imageName;
@property NSString *time;

- (id) initWithDegree: (NSString *)degree imageName: (NSString *)imageName time: (NSString *)time;
- (id) initWithManagedObject: (HourlyForecastManagedObject *)hourlyForecastManagedObject;

@end

NS_ASSUME_NONNULL_END
