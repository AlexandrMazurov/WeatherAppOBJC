//
//  WeatherInfoManagedObject+CoreDataClass.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeatherInfoManagedObject+CoreDataClass.h"

@implementation WeatherInfoManagedObject

-(id) initWithName: (NSString*)name value: (NSString*)value {
    self = [super init];
    if (self) {
        self.name = name;
        self.value = value;
    }
    return  self;
}

@end
