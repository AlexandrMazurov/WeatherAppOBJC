//
//  HoutlyForecastModel.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "HourlyForecastModel.h"
#import "HourlyForecastManagedObject+CoreDataClass.h"

@implementation HourlyForecastModel

-(id) initWithDegree: (NSString *)degree
           imageName: (NSString *)imageName
                time: (NSString *)time {
    self = [super init];
    if (self) {
        self.degree = degree;
        self.imageName = imageName;
        self.time = time;
    }
    return self;
}

- (id) initWithManagedObject: (HourlyForecastManagedObject *)hourlyForecastManagedObject {
    self = [super init];
    if (self) {
        self.degree = hourlyForecastManagedObject.degree;
        self.imageName = hourlyForecastManagedObject.imageName;
        self.time = hourlyForecastManagedObject.time;
    }
    return self;
}

@end
