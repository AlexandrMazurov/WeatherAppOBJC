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

static const int oneDayIndex = 1;
static const int numberOfForecastsInTwentyFourHour = 8;
static NSString* const feelsLikeParameterName = @"Feels like";
static NSString* const humidityParameterName = @"Humidity";
static NSString* const pressureParameterName = @"Pressure";
static NSString* const windParameterName = @"Wind";
static NSString* const sunriseParameterName = @"Sunrise";
static NSString* const sunsetParameterName = @"Sunset";
static NSString* const degreeSign = @"°";
static NSString* const procentSign = @"%";
static NSString* const celsionSign = @"°C";
static NSString* const kilometersPerHourSign = @"km/h";
static NSString* const hPascalSigh = @"hPa";

@implementation WeatherManager

OWMAPI *weatherApi;
DateManager *dateManagerService;

-(id) initWithApi: (OWMAPI*)api dateManager: (DateManager *)dateManager {
    self = [super init];
    if (self) {
        weatherApi = api;
        dateManagerService = dateManager;
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

- (WeatherModel*) setupWeatherFromWeatherData: (WeatherData*)weatherData {
    return [[WeatherModel alloc] initWithCityName:weatherData.city.name
                                        situation:[self getWeatherSituationFromWeatherData:weatherData]
                                           degree:[self getCurrentDegreeFromWeatherData:weatherData]
                                isCurrentLocation:true
                                   hourlyForecast:[self getHourlyForecastFromWeatherData:weatherData]
                                     weakForecast:[self getWeakForecastFromWeatherData:weatherData]
                                      weatherInfo:[self getWeatherInfoFromWeatherData:weatherData]];
}

- (NSString*) getCurrentDegreeFromWeatherData: (WeatherData*)weatherObject {
    return [NSString stringWithFormat:@"%d%@", [self convertToCelsionFromKelvin:weatherObject.list.firstObject.main.temperature], degreeSign];
}

- (NSString*) getWeatherSituationFromWeatherData: (WeatherData*)weatherData {
    return weatherData.list.firstObject.weather.firstObject.mainDescription;
}

- (NSArray<HourlyForecastModel *> *) getHourlyForecastFromWeatherData: (WeatherData*)weatherData {
    NSMutableArray<HourlyForecastModel *> *hourlyForecast = [[NSMutableArray<HourlyForecastModel *> alloc] init];
    for (int index = 0; index < numberOfForecastsInTwentyFourHour; index++) {
        NSTimeInterval timeInterval = weatherData.list[index].time;
        [hourlyForecast addObject:[[HourlyForecastModel alloc] initWithDegree:[NSString stringWithFormat:@"%d%@", [self convertToCelsionFromKelvin:weatherData.list[index].main.temperature], degreeSign]
                                                                    imageName:weatherData.list[index].weather.firstObject.iconName
                                                                         time:[dateManagerService getHourTimeFormatFromTimeInterval: &timeInterval]]];
    }
    return hourlyForecast;
}

- (NSArray<WeakForecastModel *> *) getWeakForecastFromWeatherData: (WeatherData*)weatherData {
    NSMutableArray<WeakForecastModel *> *weakForecast = [[NSMutableArray<WeakForecastModel *> alloc] init];
    NSUInteger numberOfForecastDays = [self numberOfForecatDaysInWeatherData:weatherData];
    for (int index = 0; index < numberOfForecastDays; index++) {
        NSDate *forecastDate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:index toDate:[[NSDate alloc] init] options:0];
        NSTimeInterval startOfDay = [[[NSCalendar currentCalendar] startOfDayForDate:forecastDate] timeIntervalSince1970];
        NSTimeInterval endOfDay = [[NSCalendar currentCalendar] startOfDayForDate:[[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:oneDayIndex toDate:forecastDate options:0]].timeIntervalSince1970;
        NSMutableArray<ForecastData *> *forecastDataArray = [[NSMutableArray<ForecastData *> alloc] init];
        for (ForecastData *forecast in weatherData.list) {
            if (forecast.time >= startOfDay && forecast.time <endOfDay) {
                [forecastDataArray addObject:forecast];
            }
        }
        [weakForecast addObject:[[WeakForecastModel alloc] initWithDayName:[dateManagerService getDayNameFromTimeInterval:&startOfDay]
                                                                 imageName:[self forecastImageNameFromData:forecastDataArray]
                                                                 dayDegree:[self dayDegreeFromForecastDataArray:forecastDataArray]
                                                               nightDegree:[self nightDegreeFromForecastDataArray:forecastDataArray]]];
    }
    return weakForecast;
}

- (NSString *) forecastImageNameFromData: (NSArray<ForecastData *> *)forecastDataArray {
    for (ForecastData *forecastData in forecastDataArray) {
        if ([forecastData.timeOfDay.pod  isEqual: @"d"]) {
            return forecastData.weather.firstObject.iconName;
        }
    }
    return forecastDataArray.firstObject.weather.firstObject.iconName;
}

- (int) dayDegreeFromForecastDataArray: (NSArray<ForecastData *> *)forecastDataArray {
    NSMutableArray<NSNumber *> *maxTemperatureArray = [[NSMutableArray<NSNumber *> alloc] init];
    for (ForecastData *forecastData in forecastDataArray) {
        int minTemprerature = (int)forecastData.main.maxTemperature;
        [maxTemperatureArray addObject: [[NSNumber alloc] initWithInt:minTemprerature]];
    }
    return [self convertToCelsionFromKelvin:[[maxTemperatureArray valueForKeyPath:@"@max.self"] intValue]];
}


- (int) nightDegreeFromForecastDataArray: (NSArray<ForecastData *> *)forecastDataArray {
    NSMutableArray<NSNumber *> *minTemperatureArray = [[NSMutableArray<NSNumber *> alloc] init];
    for (ForecastData *forecastData in forecastDataArray) {
        int minTemprerature = (int)forecastData.main.minTemperature;
        [minTemperatureArray addObject: [[NSNumber alloc] initWithInt:minTemprerature]];
    }
    return [self convertToCelsionFromKelvin:[[minTemperatureArray valueForKeyPath:@"@min.self"] intValue]];
}

- (int) convertToCelsionFromKelvin: (double)kelvin {
    return (int)kelvin - 273;
}

- (NSArray<WeatherInfoModel *> *) getWeatherInfoFromWeatherData: (WeatherData*)weatherData {
    NSMutableArray<WeatherInfoModel *> *weatherInfo = [[NSMutableArray<WeatherInfoModel *> alloc] init];
    NSTimeInterval sunriseTimeInterval = weatherData.city.sunRise;
    NSTimeInterval sunsetTimeInterval = weatherData.city.sunSet;
    [weatherInfo addObject:[[WeatherInfoModel alloc] initWithName:feelsLikeParameterName
                                                            value: [NSString stringWithFormat:@"%d%@" , [self convertToCelsionFromKelvin:weatherData.list.firstObject.main.feelsLike], degreeSign]]];
    [weatherInfo addObject:[[WeatherInfoModel alloc] initWithName:humidityParameterName
                                                            value: [NSString stringWithFormat:@"%d%@", weatherData.list.firstObject.main.humidity, procentSign]]];
    [weatherInfo addObject:[[WeatherInfoModel alloc] initWithName:pressureParameterName
                                                            value:[NSString stringWithFormat:@"%d %@", weatherData.list.firstObject.main.pressure, hPascalSigh]]];
    [weatherInfo addObject:[[WeatherInfoModel alloc] initWithName:windParameterName
                                                            value:[NSString stringWithFormat:@"%d %@", (int)weatherData.list.firstObject.wind.speed, kilometersPerHourSign]]];
    [weatherInfo addObject:[[WeatherInfoModel alloc] initWithName:sunriseParameterName
                                                            value:[dateManagerService getDefaultTimeFormatFromTimeInterval:&sunriseTimeInterval]]];
    [weatherInfo addObject:[[WeatherInfoModel alloc] initWithName:sunsetParameterName
                                                            value:[dateManagerService getDefaultTimeFormatFromTimeInterval:&sunsetTimeInterval]]];
    return weatherInfo;
}

- (NSUInteger) numberOfForecatDaysInWeatherData: (WeatherData *)weatherData {
    NSTimeInterval firstForecastDayTimeInterval = weatherData.list.firstObject.time;
    NSTimeInterval lastForecastDayTimeInterval = weatherData.list.lastObject.time;
    NSDate *firstForecastDay = [[NSCalendar currentCalendar] startOfDayForDate:[NSDate dateWithTimeIntervalSince1970:firstForecastDayTimeInterval]];
    NSDate *lastForecastDay = [[NSCalendar currentCalendar] startOfDayForDate:[NSDate dateWithTimeIntervalSince1970:lastForecastDayTimeInterval]];
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:firstForecastDay toDate:lastForecastDay options:0].day + oneDayIndex;
}
                            
@end
