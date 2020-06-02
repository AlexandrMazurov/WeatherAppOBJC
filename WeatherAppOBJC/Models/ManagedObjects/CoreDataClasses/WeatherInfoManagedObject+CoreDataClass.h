//
//  WeatherInfoManagedObject+CoreDataClass.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WeatherManagedObject;

NS_ASSUME_NONNULL_BEGIN

@interface WeatherInfoManagedObject : NSManagedObject

-(id) initWithName: (NSString*)name value: (NSString*)value;

@end

NS_ASSUME_NONNULL_END

#import "WeatherInfoManagedObject+CoreDataProperties.h"
