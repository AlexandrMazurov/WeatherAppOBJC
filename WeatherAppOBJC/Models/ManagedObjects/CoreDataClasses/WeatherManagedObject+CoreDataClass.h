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
#import "WeatherModel.h"

@class HourlyForecastManagedObject, WeakForecastManagedObject, WeatherInfoManagedObject;

NS_ASSUME_NONNULL_BEGIN

@interface WeatherManagedObject : NSManagedObject

-(id) initWithCityName: (NSString*)cityName
                degree: (NSString *)degree
             situation: (NSString*)situation
        hourlyForecast: (NSArray<HourlyForecastManagedObject *> *)hourlyForecast
          weakForecast: (NSArray<WeakForecastManagedObject *> *)weakForecast
           weatherInfo: (NSArray<WeatherInfoManagedObject *> *)weatherInfo
     isCurrentLocation: (BOOL)isCurrentLocation;

- (id) initFromWeatherModel: (WeatherModel *)weatherModel withContext: (NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "WeatherManagedObject+CoreDataProperties.h"
