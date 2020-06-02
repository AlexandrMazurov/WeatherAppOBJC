//
//  WeatherManager.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/1/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeatherManager.h"
#import "WeatherManagedObject+CoreDataClass.h"
#import "HourlyForecastManagedObject+CoreDataClass.h"
#import "WeakForecastManagedObject+CoreDataClass.h"
#import "WeatherInfoManagedObject+CoreDataClass.h"

static const int numberOfForecastsInTwentyFourHour = 8;

@implementation WeatherManager

OWMAPI *weatherApi;

-(id) initWithApi: (OWMAPI*)api {
    self = [super init];
    if (self) {
        weatherApi = api;
    }
    return self;
}

-(void)getWeatherAtCurrentLocationOnSuccess: (SucessWeatherCompletionBlock)successBlock
                                  onFailure: (FailureCompletionBlock)failureBlock {
    [weatherApi getWeatherForecastWithLat:@"53.824570" lon:@"27.460724"
                                onSuccess:^(WeatherData * _Nonnull responseObject) {
        successBlock([self setupWeatherFromWeatherData: responseObject]);
    } onFailure: failureBlock];
}

- (WeatherManagedObject*) setupWeatherFromWeatherData: (WeatherData*)weatherData {
    return [[WeatherManagedObject alloc] initWithCityName: weatherData.city.name
                                                   degree:[self getCurrentDegreeFromWeatherData:weatherData]
                                                situation:[self getWeatherSituationFromWeatherData:weatherData]
                                           hourlyForecast:[self getHourlyForecastFromWeatherData:weatherData]
                                             weakForecast:[self getWeakForecastFromWeatherData:weatherData]
                                              weatherInfo:[self getWeatherInfoFromWeatherData:weatherData]
                                        isCurrentLocation: true];
}

- (int64_t) getCurrentDegreeFromWeatherData: (WeatherData*)weatherObject {
    return weatherObject.list.firstObject.main.temperature;
}

- (NSString*) getWeatherSituationFromWeatherData: (WeatherData*)weatherData {
    return weatherData.list.firstObject.weather.firstObject.description;
}

- (NSArray<HourlyForecastManagedObject *> *) getHourlyForecastFromWeatherData: (WeatherData*)weatherData {
    NSMutableArray<HourlyForecastManagedObject *> *hourlyForecat = [[NSMutableArray<HourlyForecastManagedObject*> alloc] init];
    return hourlyForecat;
}

- (NSArray<WeakForecastManagedObject *> *) getWeakForecastFromWeatherData: (WeatherData*)weatherData {
    return [[NSArray<WeakForecastManagedObject *> alloc] init];
}

- (NSArray<WeatherInfoManagedObject *> *) getWeatherInfoFromWeatherData: (WeatherData*)weatherData {
    return [[NSArray<WeatherInfoManagedObject *> alloc] init];
}

@end
