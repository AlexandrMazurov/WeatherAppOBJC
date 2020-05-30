//
//  WeatherManagedObject+CoreDataProperties.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeatherManagedObject+CoreDataProperties.h"

@implementation WeatherManagedObject (CoreDataProperties)

+ (NSFetchRequest<WeatherManagedObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"WeatherManagedObject"];
}

@dynamic cityName;
@dynamic degree;
@dynamic isCurrentLocation;
@dynamic situation;
@dynamic hourlyForecast;
@dynamic weakForecast;
@dynamic weatherInfo;

@end
