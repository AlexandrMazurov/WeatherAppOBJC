//
//  WeakForecastManagedObject+CoreDataProperties.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeakForecastManagedObject+CoreDataProperties.h"

@implementation WeakForecastManagedObject (CoreDataProperties)

+ (NSFetchRequest<WeakForecastManagedObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"WeakForecastManagedObject"];
}

@dynamic dayDegree;
@dynamic dayName;
@dynamic imageName;
@dynamic nightDegree;
@dynamic weather;

@end
