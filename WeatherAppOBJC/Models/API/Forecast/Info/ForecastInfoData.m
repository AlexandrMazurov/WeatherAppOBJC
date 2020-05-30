//
//  ForecastInfoData.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "ForecastInfoData.h"

@implementation ForecastInfoData

-(id) initWithTemperature: (double)temperature
                  minTemp: (double)minTemp
                  maxTemp: (double)maxTemp
                feelsLike: (double)feelsLike
                 pressure: (int)pressure
                 humidity: (int)humidity {
    self = [super init];
    if (self) {
        self.temperature = temperature;
        self.minTemperature = minTemp;
        self.maxTemperature = maxTemp;
        self.feelsLike = feelsLike;
        self.pressure = pressure;
        self.humidity = humidity;
    }
    return self;
}

@end
