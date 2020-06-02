//
//  WeatherModel.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

-(id) initWithCityName: (NSString *)cityName
             situation: (NSString *)situation
                degree: (int)degree
     isCurrentLocation: (BOOL)isCurrentLocation
        hourlyForecast: (NSArray<HourlyForecastModel *> *)hourlyForecat
          weakForecast: (NSArray<WeakForecastModel *> *)weakForecat
           weatherInfo: (NSArray<WeatherInfoModel *> *)weatherInfo {
    self = [super init];
    if (self) {
        self.cityName = cityName;
        self.situation = situation;
        self.degree = degree;
        self.isCurrentLocation = isCurrentLocation;
        self.hourlyForecast = hourlyForecat;
        self.weakForecast = weakForecat;
        self.weatherInfo = weatherInfo;
    }
    return self;
}

@end
