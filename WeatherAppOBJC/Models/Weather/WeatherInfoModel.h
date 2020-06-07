//
//  WeatherInfoModel.h
//  WeatherAppOBJC
//
//  Created by Александр on 6/2/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class WeatherInfoManagedObject;

@interface WeatherInfoModel : NSObject

@property NSString *name;
@property NSString *value;

- (id) initWithName: (NSString *)name value: (NSString *)value;
- (id) initWithManagedObject: (WeatherInfoManagedObject *)weatherInfoManagedObject;

@end

NS_ASSUME_NONNULL_END
