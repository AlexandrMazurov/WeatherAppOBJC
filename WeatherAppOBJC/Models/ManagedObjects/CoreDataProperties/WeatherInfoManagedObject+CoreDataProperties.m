//
//  WeatherInfoManagedObject+CoreDataProperties.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeatherInfoManagedObject+CoreDataProperties.h"

@implementation WeatherInfoManagedObject (CoreDataProperties)

+ (NSFetchRequest<WeatherInfoManagedObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"WeatherInfoManagedObject"];
}

@dynamic name;
@dynamic value;
@dynamic weather;

@end
