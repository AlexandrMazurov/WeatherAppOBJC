//
//  ForecastInfoData.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForecastInfoData : NSObject

@property double temperature;
@property double minTemperature;
@property double maxTemperature;
@property double feelsLike;
@property int pressure;
@property int humidity;

-(id) initWithTemperature: (double)temperature
                  minTemp: (double)minTemp
                  maxTemp: (double)maxTemp
                feelsLike: (double)feelsLike
                 pressure: (int)pressure
                 humidity: (int)humidity;

@end

NS_ASSUME_NONNULL_END
