//
//  WeatherManagedObject+CoreDataClass.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeatherManagedObject+CoreDataClass.h"

@implementation WeatherManagedObject

-(id) initWithCityName: (NSString*)cityName
                degree: (int64_t)degree
             situation: (NSString*)situation
        hourlyForecast: (NSArray<HourlyForecastManagedObject *> *)hourlyForecast
          weakForecast: (NSArray<WeakForecastManagedObject *> *)weakForecast
           weatherInfo: (NSArray<WeatherInfoManagedObject *> *)weatherInfo
     isCurrentLocation: (BOOL)isCurrentLocation; {
    self = [super init];
    if (self) {
        self.cityName = cityName;
        self.degree = degree;
        self.situation = situation;
        self.hourlyForecast = [NSOrderedSet orderedSetWithArray :hourlyForecast];
        self.weakForecast = [NSOrderedSet orderedSetWithArray: weakForecast];
        self.weatherInfo = [NSOrderedSet orderedSetWithArray: weatherInfo];
        self.isCurrentLocation = isCurrentLocation;
    }
    return self;
}

@end
