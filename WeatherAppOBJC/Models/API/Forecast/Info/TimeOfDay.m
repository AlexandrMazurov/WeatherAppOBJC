//
//  TimeOfDay.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "TimeOfDay.h"

@implementation TimeOfDay

-(id) initWithPod: (NSString*)pod {
    self = [super init];
    if (self) {
        self.pod = pod;
    }
    return self;
}

@end
