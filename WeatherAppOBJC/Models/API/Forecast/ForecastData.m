//
//  ForecastData.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "ForecastData.h"

@implementation ForecastData

-(id) initWithTime: (int)time
              main: (ForecastInfoData*)main
           weather: (NSMutableArray<WeatherInfoData*>*)weather
              wind: (WindInfoData*)wind
         timeOfDay: (TimeOfDay*)timeOfDay {
    self = [super init];
    if (self) {
        self.time = time;
        self.main = main;
        self.weather = weather;
        self.wind = wind;
        self.timeOfDay = timeOfDay;
    }
    return self;
}

@end
