//
//  LocalRepository.h
//  WeatherAppOBJC
//
//  Created by Александр on 6/5/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "WeatherModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocalRepository : NSObject

- (id) init;
- (WeatherModel *) getCurrentLocationWeather;
- (void) updateWeatherAtCurrentLocationFromWeatherModel: (WeatherModel *)weatherModel;

@end

NS_ASSUME_NONNULL_END
