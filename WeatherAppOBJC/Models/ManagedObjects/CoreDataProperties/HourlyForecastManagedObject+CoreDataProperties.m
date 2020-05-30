//
//  HourlyForecastManagedObject+CoreDataProperties.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "HourlyForecastManagedObject+CoreDataProperties.h"

@implementation HourlyForecastManagedObject (CoreDataProperties)

+ (NSFetchRequest<HourlyForecastManagedObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"HourlyForecastManagedObject"];
}

@dynamic degree;
@dynamic imageName;
@dynamic time;
@dynamic weather;

@end
