//
//  WeatherManagedObject+CoreDataClass.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeatherManagedObject+CoreDataClass.h"
#import "HourlyForecastManagedObject+CoreDataClass.h"
#import "WeakForecastManagedObject+CoreDataClass.h"
#import "WeatherInfoManagedObject+CoreDataClass.h"

@implementation WeatherManagedObject

- (id) initWithCityName: (NSString*)cityName
                degree: (NSString *)degree
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

- (id) initFromWeatherModel: (WeatherModel *)weatherModel withContext: (NSManagedObjectContext *)context {
    self = [super initWithContext:context];
    if (self) {
        self.cityName = weatherModel.cityName;
        self.degree = weatherModel.degree;
        self.situation = weatherModel.situation;
        self.isCurrentLocation = weatherModel.isCurrentLocation;
        self.hourlyForecast = [NSOrderedSet orderedSetWithArray:[self convertHourlyForecatManagedObjectFromModels:weatherModel.hourlyForecast withContext:context]];
        self.weakForecast = [NSOrderedSet orderedSetWithArray:[self convertWeakForecastManagedFromModels:weatherModel.weakForecast withContext:context]];
        self.weatherInfo = [NSOrderedSet orderedSetWithArray:[self convertWeatherInfoManagedObjectFromModels:weatherModel.weatherInfo withContext:context]];
    }
    return self;
}

- (NSArray<HourlyForecastManagedObject *> *) convertHourlyForecatManagedObjectFromModels: (NSArray<HourlyForecastModel *> *)hourlyForecastModels
                                                                                      withContext: (NSManagedObjectContext *)context {
    NSMutableArray<HourlyForecastManagedObject *> *resultArray = [[NSMutableArray<HourlyForecastManagedObject *> alloc] init];
    for (HourlyForecastModel *hourlyForecast in hourlyForecastModels) {
        [resultArray addObject:[[HourlyForecastManagedObject alloc] initWithHourlyForecastModel:hourlyForecast withContext:context]];
    }
    return resultArray;
}

- (NSArray<WeakForecastManagedObject *> *) convertWeakForecastManagedFromModels: (NSArray<WeakForecastModel *> *)weakForecastModels
                                                                     withContext: (NSManagedObjectContext *)context {
    NSMutableArray<WeakForecastManagedObject *> *resultArray = [[NSMutableArray<WeakForecastManagedObject *> alloc] init];
    for (WeakForecastModel *weakForecast in weakForecastModels) {
        [resultArray addObject:[[WeakForecastManagedObject alloc] initFromWeakForecastModel:weakForecast withContext:context]];
    }
    return resultArray;
}

- (NSArray<WeatherInfoManagedObject *> *) convertWeatherInfoManagedObjectFromModels: (NSArray<WeatherInfoModel *> *)weatherInfoModels
                                                                        withContext: (NSManagedObjectContext *)context {
    NSMutableArray<WeatherInfoManagedObject *> *resultArray = [[NSMutableArray<WeatherInfoManagedObject *> alloc] init];
    for (WeatherInfoModel *weatherInfo in weatherInfoModels) {
        [resultArray addObject:[[WeatherInfoManagedObject alloc] initWithWeatherInfoModel:weatherInfo withContext:context]];
    }
    return resultArray;
}

@end
