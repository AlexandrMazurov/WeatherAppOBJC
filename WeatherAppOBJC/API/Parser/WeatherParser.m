//
//  WeatherParser.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeatherParser.h"

@implementation WeatherParser

-(WeatherData *) parseWeatherJson: (NSDictionary*)jsonDictionary {
    return [[WeatherData alloc] initWithList: [self parseForecatsDataWromJsonDict:jsonDictionary]cityData: [self parseCityDataFromJsonDict:jsonDictionary]];
}

-(ForecastInfoData *) parseForecastInfoDataFromList: (NSDictionary*)list {
    NSDictionary *main = list[@"main"];
    return [[ForecastInfoData alloc] initWithTemperature: [main[@"temp"] doubleValue]
                                                 minTemp: [main[@"temp_min"] doubleValue]
                                                 maxTemp: [main[@"temp_max"] doubleValue]
                                               feelsLike: [main[@"feels_like"] doubleValue]
                                                pressure: [main[@"pressure"] intValue]
                                                humidity: [main[@"humidity"] intValue]];
}

-(NSMutableArray<ForecastData*> *) parseForecatsDataWromJsonDict: (NSDictionary*)jsonDict {
    NSMutableArray<ForecastData *> *forecastDataArray = [NSMutableArray<ForecastData *> new];
    NSMutableArray *list = jsonDict[@"list"];
    for (NSDictionary *listData in list) {
        int time = [listData[@"dt"] intValue];
        ForecastData *forecastData = [[ForecastData alloc] initWithTime: time
                                                                   main: [self parseForecastInfoDataFromList:listData]
                                                                weather: [self parseWeatherInfoDataFromList:listData]
                                                                   wind: [self parseWindInfoFromList:listData]
                                                              timeOfDay: [self parseTimeOfDayFromList:listData]];
        [forecastDataArray addObject:forecastData];
    }
    return  forecastDataArray;
}

-(NSMutableArray<WeatherInfoData *> *) parseWeatherInfoDataFromList: (NSDictionary*)list {
    NSMutableArray<WeatherInfoData *> *weatherInfoDataArray = [NSMutableArray<WeatherInfoData *> new];
    NSArray *weatherData = list[@"weather"];
    for (NSDictionary * weatherModel in weatherData) {
        WeatherInfoData *weatherInfoData = [[WeatherInfoData alloc] initWithInfo:weatherModel[@"main"]
                                                                     description:weatherModel[@"description"]
                                                                        iconName:weatherModel[@"icon"]];
        [weatherInfoDataArray addObject:weatherInfoData];
    }
    return weatherInfoDataArray;
}

-(WindInfoData *) parseWindInfoFromList: (NSDictionary*)list {
    NSDictionary *windInfo = list[@"wind"];
    return [[WindInfoData alloc] initWithSpeed:[windInfo[@"speed"] doubleValue]
                                           deg:[windInfo[@"deg"] intValue]];
}

-(TimeOfDay *) parseTimeOfDayFromList: (NSDictionary*)list {
    NSDictionary *timeOfDayData = list[@"sys"];
    return [[TimeOfDay alloc] initWithPod:timeOfDayData[@"pod"]];
}

-(CityData *) parseCityDataFromJsonDict: (NSDictionary*)jsonDict {
    NSDictionary *city = jsonDict[@"city"];
    return [[CityData alloc] initWithName: city[@"name"]
                                  sunRise: [city[@"sunrise"] intValue]
                                   sunSet: [city[@"sunset"] intValue]];
}


@end
