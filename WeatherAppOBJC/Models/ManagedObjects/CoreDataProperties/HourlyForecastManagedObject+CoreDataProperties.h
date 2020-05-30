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

@property (nonatomic) int16_t degree;
@property (nullable, nonatomic, copy) NSString *imageName;
@property (nonatomic) int16_t time;
@property (nullable, nonatomic, retain) WeatherManagedObject *weather;

@end

NS_ASSUME_NONNULL_END
