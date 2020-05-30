//
//  WeatherManagedObject+CoreDataClass.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HourlyForecastManagedObject, WeakForecastManagedObject, WeatherInfoManagedObject;

NS_ASSUME_NONNULL_BEGIN

@interface WeatherManagedObject : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "WeatherManagedObject+CoreDataProperties.h"
