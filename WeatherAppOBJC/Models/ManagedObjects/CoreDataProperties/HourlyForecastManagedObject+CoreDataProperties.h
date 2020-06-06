//
//  HourlyForecastManagedObject+CoreDataProperties.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "HourlyForecastManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface HourlyForecastManagedObject (CoreDataProperties)

+ (NSFetchRequest<HourlyForecastManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *degree;
@property (nullable, nonatomic, copy) NSString *imageName;
@property (nullable, nonatomic, copy) NSString *time;
@property (nullable, nonatomic, retain) WeatherManagedObject *weather;

@end

NS_ASSUME_NONNULL_END
