//
//  HoutlyForecastModel.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "HourlyForecastModel.h"

@implementation HourlyForecastModel

-(id) initWithDegree: (int)degree
           imageName: (NSString *)imageName
                time: (int)time {
    self = [super init];
    if (self) {
        self.degree = degree;
        self.imageName = imageName;
        self.time = time;
    }
    return self;
}

@end
