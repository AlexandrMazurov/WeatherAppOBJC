//
//  WeatherInfoManagedObject+CoreDataProperties.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeatherInfoManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WeatherInfoManagedObject (CoreDataProperties)

+ (NSFetchRequest<WeatherInfoManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *value;
@property (nullable, nonatomic, retain) WeatherManagedObject *weather;

@end

NS_ASSUME_NONNULL_END
