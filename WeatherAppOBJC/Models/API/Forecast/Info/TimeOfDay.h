//
//  TimeOfDay.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimeOfDay : NSObject

@property NSString *pod;

-(id) initWithPod: (NSString*)pod;

@end

NS_ASSUME_NONNULL_END
