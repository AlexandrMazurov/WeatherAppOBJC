//
//  WeakForecastModel.h
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class WeakForecastManagedObject;

@interface WeakForecastModel : NSObject

@property NSString *dayName;
@property NSString *imageName;
@property int dayDegree;
@property int nightDegree;

- (id) initWithDayName: (NSString *)dayName
             imageName: (NSString *)imageName
             dayDegree: (int)dayDegree
           nightDegree: (int)nightDegree;

- (id) initWithManagedObject: (WeakForecastManagedObject *)weakForecastManagedObject;

@end

NS_ASSUME_NONNULL_END
