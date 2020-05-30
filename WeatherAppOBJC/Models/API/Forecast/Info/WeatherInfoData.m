//
//  WeatherInfoData.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeatherInfoData.h"

@implementation WeatherInfoData

-(id) initWithInfo: (NSString*)info description: (NSString*)description iconName: (NSString*)iconName {
    self = [super init];
    if (self) {
        self.mainInfo = info;
        self.mainDescription = description;
        self.iconName = iconName;
    }
    return self;
}

@end
