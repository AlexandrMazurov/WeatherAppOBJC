//
//  WeatherData.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/29/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastData.h"
#import "CityData.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherData : NSObject

@property NSMutableArray<ForecastData *> *list;
@property CityData *city;

-(id) initWithList: (NSMutableArray<ForecastData *>*)list cityData: (CityData*)cityData;

@end

NS_ASSUME_NONNULL_END
