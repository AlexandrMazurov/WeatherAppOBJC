//
//  WeakForecastManagedObject+CoreDataClass.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeakForecastManagedObject+CoreDataClass.h"

@implementation WeakForecastManagedObject

-(id) initWithDayName: (NSString*)dayName
            dayDegree: (int16_t)dayDegree
          nightDegree: (int16_t)nightdegree
            imageName: (NSString*)imageName {
    self = [super init];
    if (self) {
        self.dayName = dayName;
        self.dayDegree = dayDegree;
        self.nightDegree = nightdegree;
        self.imageName = imageName;
    }
    return self;
}

-(id) initFromWeakForecastModel: (WeakForecastModel *)weakForecastModel withContext: (NSManagedObjectContext *)context {
    self = [super initWithContext:context];
    if (self) {
        self.dayName = weakForecastModel.dayName;
        self.dayDegree = weakForecastModel.dayDegree;
        self.nightDegree = weakForecastModel.nightDegree;
        self.imageName = weakForecastModel.imageName;
    }
    return self;
}

@end
