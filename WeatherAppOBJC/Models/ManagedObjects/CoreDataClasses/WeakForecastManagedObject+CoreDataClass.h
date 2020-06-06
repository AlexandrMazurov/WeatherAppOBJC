//
//  WeakForecastManagedObject+CoreDataClass.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "WeakForecastModel.h"

@class WeatherManagedObject;

NS_ASSUME_NONNULL_BEGIN

@interface WeakForecastManagedObject : NSManagedObject

-(id) initWithDayName: (NSString*)dayName
            dayDegree: (int16_t)dayDegree
          nightDegree: (int16_t)nightdegree
            imageName: (NSString*)imageName;

-(id) initFromWeakForecastModel: (WeakForecastModel *)weakForecastModel withContext: (NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "WeakForecastManagedObject+CoreDataProperties.h"
