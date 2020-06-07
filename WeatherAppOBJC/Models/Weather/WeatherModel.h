//
//  WeatherModel.h
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HourlyForecastModel.h"
#import "WeakForecastModel.h"
#import "WeatherInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@class WeatherManagedObject;

@interface WeatherModel : NSObject

@property NSString *cityName;
@property NSString *situation;
@property NSString *degree;
@property BOOL isCurrentLocation;
@property NSArray<HourlyForecastModel *> *hourlyForecast;
@property NSArray<WeakForecastModel *> *weakForecast;
@property NSArray<WeatherInfoModel *> *weatherInfo;

- (id) initWithCityName: (NSString *)cityName
              situation: (NSString *)situation
                 degree: (NSString *)degree
      isCurrentLocation: (BOOL)isCurrentLocation
         hourlyForecast: (NSArray<HourlyForecastModel *> *)hourlyForecat
           weakForecast: (NSArray<WeakForecastModel *> *)weakForecat
            weatherInfo: (NSArray<WeatherInfoModel *> *)weatherInfo;

- (id) initFromManagedObject: (WeatherManagedObject *)weatherManagedObject;

@end

NS_ASSUME_NONNULL_END
