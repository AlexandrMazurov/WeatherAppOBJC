//
//  HourlyForecastManagedObject+CoreDataClass.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "HourlyForecastManagedObject+CoreDataClass.h"

@implementation HourlyForecastManagedObject

-(id) initWithTime: (int64_t)time degree: (int64_t)degree imageName: (NSString*)imageName {
    self = [super init];
    if (self) {
        self.time = time;
        self.degree = degree;
        self.imageName = imageName;
    }
    return self;
}

@end
