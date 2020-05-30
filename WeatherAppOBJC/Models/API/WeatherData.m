//
//  WeatherData.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/29/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData

-(id) initWithList: (NSMutableArray<ForecastData *>*)list cityData: (CityData*)cityData {
    self = [super init];
    if (self) {
        self.list = list;
        self.city = cityData;
    }
    return self;
}

@end
