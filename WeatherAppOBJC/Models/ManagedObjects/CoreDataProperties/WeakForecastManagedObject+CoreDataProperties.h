//
//  WeakForecastManagedObject+CoreDataProperties.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeakForecastManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WeakForecastManagedObject (CoreDataProperties)

+ (NSFetchRequest<WeakForecastManagedObject *> *)fetchRequest;

@property (nonatomic) int16_t dayDegree;
@property (nullable, nonatomic, copy) NSString *dayName;
@property (nullable, nonatomic, copy) NSString *imageName;
@property (nonatomic) int16_t nightDegree;
@property (nullable, nonatomic, retain) WeatherManagedObject *weather;

@end

NS_ASSUME_NONNULL_END
