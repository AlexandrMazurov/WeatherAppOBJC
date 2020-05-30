//
//  WindInfoData.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WindInfoData.h"

@implementation WindInfoData

-(id) initWithSpeed: (double)speed deg: (int)deg {
    self = [super init];
    if (self) {
        self.speed = speed;
        self.deg = deg;
    }
    return self;
}

@end
