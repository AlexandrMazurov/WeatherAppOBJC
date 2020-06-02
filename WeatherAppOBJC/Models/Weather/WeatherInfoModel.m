//
//  WeatherInfoModel.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeatherInfoModel.h"

@implementation WeatherInfoModel

-(id) initWithName: (NSString *)name value: (NSString *)value {
    self = [super init];
    if (self) {
        self.name = name;
        self.value = value;
    }
    return self;
}

@end
