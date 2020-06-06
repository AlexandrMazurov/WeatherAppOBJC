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
#import "HourlyForecastModel.h"

@class WeatherManagedObject;

NS_ASSUME_NONNULL_BEGIN

@interface HourlyForecastManagedObject : NSManagedObject

-(id) initWithTime: (NSString *)time degree: (NSString *)degree imageName: (NSString*)imageName;
-(id) initWithHourlyForecastModel: (HourlyForecastModel *)hourlyForecastModel withContext: (NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "HourlyForecastManagedObject+CoreDataProperties.h"
