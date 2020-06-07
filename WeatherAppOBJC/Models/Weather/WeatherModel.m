//
//  WeatherModel.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeatherModel.h"
#import "WeatherManagedObject+CoreDataClass.h"
#import "HourlyForecastManagedObject+CoreDataClass.h"
#import "WeakForecastManagedObject+CoreDataClass.h"
#import "WeatherInfoManagedObject+CoreDataClass.h"

@implementation WeatherModel

- (id) initWithCityName: (NSString *)cityName
              situation: (NSString *)situation
                 degree: (NSString *)degree
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

- (id) initFromManagedObject: (WeatherManagedObject *)weatherManagedObject {
    self = [super init];
    if (self) {
        self.cityName = weatherManagedObject.cityName;
        self.situation = weatherManagedObject.situation;
        self.degree = weatherManagedObject.degree;
        self.isCurrentLocation = weatherManagedObject.isCurrentLocation;
        self.hourlyForecast = [self convertHourlyForecastFromManagedObject:weatherManagedObject.hourlyForecast.array];
        self.weakForecast = [self convertWeakForecastFromManagedObject:weatherManagedObject.weakForecast.array];
        self.weatherInfo = [self convertWeatherInfoFromManagedObject:weatherManagedObject.weatherInfo.array];
    }
    return self;
}

- (NSArray<HourlyForecastModel *> *) convertHourlyForecastFromManagedObject: (NSArray<HourlyForecastManagedObject *> *)hourlyForecastManagedObjects {
    NSMutableArray<HourlyForecastModel *> *resultArray = [[NSMutableArray<HourlyForecastModel *> alloc] init];
    for (HourlyForecastManagedObject *hourlyForecast in hourlyForecastManagedObjects) {
        [resultArray addObject:[[HourlyForecastModel alloc] initWithManagedObject:hourlyForecast]];
    }
    return resultArray;
}

- (NSArray<WeakForecastModel *> *) convertWeakForecastFromManagedObject: (NSArray<WeakForecastManagedObject *> *)weakForecastManagedObjects {
    NSMutableArray<WeakForecastModel *> *resultArray = [[NSMutableArray<WeakForecastModel *> alloc] init];
    for (WeakForecastManagedObject *weakForecast in weakForecastManagedObjects) {
        [resultArray addObject:[[WeakForecastModel alloc] initWithManagedObject:weakForecast]];
    }
    return resultArray;
}

- (NSArray<WeatherInfoModel *> *) convertWeatherInfoFromManagedObject: (NSArray<WeatherInfoManagedObject *> *)weatherInfoManagedObjects {
    NSMutableArray<WeatherInfoModel *> *resultArray = [[NSMutableArray<WeatherInfoModel *> alloc] init];
    for (WeatherInfoManagedObject *weatherInfo in weatherInfoManagedObjects) {
        [resultArray addObject:[[WeatherInfoModel alloc] initWithManagedObject:weatherInfo]];
    }
    return resultArray;
}

@end
