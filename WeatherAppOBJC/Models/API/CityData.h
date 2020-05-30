//
//  CityData.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/29/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityData : NSObject

@property NSString *name;
@property int sunRise;
@property int sunSet;

- (id)initWithName: (NSString*)name sunRise: (int)sunRise sunSet: (int)sunSet;

@end

NS_ASSUME_NONNULL_END
