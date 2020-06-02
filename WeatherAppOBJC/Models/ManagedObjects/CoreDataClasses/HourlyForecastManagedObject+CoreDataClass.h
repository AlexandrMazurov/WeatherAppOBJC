//
//  HourlyForecastManagedObject+CoreDataClass.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WeatherManagedObject;

NS_ASSUME_NONNULL_BEGIN

@interface HourlyForecastManagedObject : NSManagedObject

-(id) initWithTime: (int64_t)time degree: (int64_t)degree imageName: (NSString*)imageName;

@end

NS_ASSUME_NONNULL_END

#import "HourlyForecastManagedObject+CoreDataProperties.h"
