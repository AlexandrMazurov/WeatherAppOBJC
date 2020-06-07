//
//  WeatherInfoModel.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "WeatherInfoModel.h"
#import "WeatherInfoManagedObject+CoreDataClass.h"

@implementation WeatherInfoModel

- (id) initWithName: (NSString *)name value: (NSString *)value {
    self = [super init];
    if (self) {
        self.name = name;
        self.value = value;
    }
    return self;
}

- (id) initWithManagedObject: (WeatherInfoManagedObject *)weatherInfoManagedObject {
    self = [super init];
    if (self) {
        self.name = weatherInfoManagedObject.name;
        self.value = weatherInfoManagedObject.value;
    }
    return self;
}

@end
