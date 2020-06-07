//
//  WeakForecastModel.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeakForecastModel.h"
#import "WeakForecastManagedObject+CoreDataClass.h"

@implementation WeakForecastModel

-(id) initWithDayName: (NSString *)dayName
            imageName: (NSString *)imageName
            dayDegree: (int)dayDegree
          nightDegree: (int)nightDegree {
    self = [super init];
    if (self) {
        self.dayName = dayName;
        self.imageName = imageName;
        self.dayDegree = dayDegree;
        self.nightDegree = nightDegree;
    }
    return self;
}

- (id) initWithManagedObject: (WeakForecastManagedObject *)weakForecastManagedObject {
    self = [super init];
    if (self) {
        self.dayName = weakForecastManagedObject.dayName;
        self.imageName = weakForecastManagedObject.imageName;
        self.dayDegree = weakForecastManagedObject.dayDegree;
        self.nightDegree = weakForecastManagedObject.nightDegree;
    }
    return self;
}

@end
