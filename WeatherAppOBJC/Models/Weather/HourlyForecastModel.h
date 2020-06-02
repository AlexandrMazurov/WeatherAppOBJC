//
//  HoutlyForecastModel.h
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HourlyForecastModel : NSObject

@property int degree;
@property NSString *imageName;
@property int time;

-(id) initWithDegree: (int)degree imageName: (NSString *)imageName time: (int)time;

@end

NS_ASSUME_NONNULL_END
