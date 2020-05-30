//
//  OWMAPI.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/29/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherParser.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^_Nullable SuccessCompletionBlock)(id responseObject);
typedef void (^_Nullable FailureCompletionBlock)(NSError *error);

@interface OWMAPI : NSObject

-(id) initWithParser: (WeatherParser*)parser;

-(void)getWeatherForecastWithLat: (NSString*)lat lon:(NSString*)lon
                       onSuccess: (SuccessCompletionBlock)successBlock
                       onFailure: (FailureCompletionBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END
