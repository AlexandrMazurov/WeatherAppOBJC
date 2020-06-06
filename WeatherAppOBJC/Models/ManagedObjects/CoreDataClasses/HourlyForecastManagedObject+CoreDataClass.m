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

-(id) initWithTime: (NSString *)time degree: (NSString *)degree imageName: (NSString*)imageName {
    self = [super init];
    if (self) {
        self.time = time;
        self.degree = degree;
        self.imageName = imageName;
    }
    return self;
}

-(id) initWithHourlyForecastModel: (HourlyForecastModel *)hourlyForecastModel withContext: (NSManagedObjectContext *)context {
    self = [super initWithContext:context];
    if (self) {
        self.time = hourlyForecastModel.time;
        self.degree = hourlyForecastModel.degree;
        self.imageName = hourlyForecastModel.imageName;
    }
    return self;
}

@end
