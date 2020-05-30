//
//  CityData.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/29/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "CityData.h"

@implementation CityData

- (id)initWithName: (NSString*)name sunRise: (int)sunRise sunSet: (int)sunSet {
    self = [super init];
    if (self) {
        self.name = name;
        self.sunRise = sunRise;
        self.sunSet = sunSet;
    }
    return self;
}

@end
