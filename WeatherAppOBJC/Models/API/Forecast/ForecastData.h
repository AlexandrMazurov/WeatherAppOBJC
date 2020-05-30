//
//  ForecastData.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastInfoData.h"
#import "WeatherInfoData.h"
#import "WindInfoData.h"
#import "TimeOfDay.h"

NS_ASSUME_NONNULL_BEGIN

@interface ForecastData : NSObject

@property int time;
@property ForecastInfoData *main;
@property NSArray<WeatherInfoData *> *weather;
@property WindInfoData *wind;
@property TimeOfDay *timeOfDay;

-(id) initWithTime: (int)time
              main: (ForecastInfoData*)main
           weather: (NSArray<WeatherInfoData*>*)weather
              wind: (WindInfoData*)wind
         timeOfDay: (TimeOfDay*)timeOfDay;

@end

NS_ASSUME_NONNULL_END
