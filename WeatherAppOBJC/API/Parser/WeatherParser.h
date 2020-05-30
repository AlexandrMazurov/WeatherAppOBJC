//
//  WeatherParser.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherData.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherParser : NSObject

-(WeatherData *) parseWeatherJson: (NSDictionary*)jsonDictionary;

@end

NS_ASSUME_NONNULL_END
