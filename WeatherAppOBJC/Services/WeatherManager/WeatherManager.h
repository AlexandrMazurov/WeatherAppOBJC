//
//  WeatherManager.h
//  WeatherAppOBJC
//
//  Created by Александр on 6/1/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWMAPI.h"
#import "DateManager.h"
#import "WeatherData.h"
#import "WeatherModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^_Nullable SucessWeatherCompletionBlock)(WeatherModel *weatherObject);
typedef void (^_Nullable FailureCompletionBlock)(NSError *error);

@interface WeatherManager : NSObject

-(id) initWithApi: (OWMAPI*)api dateManager: (DateManager *)dateManager;

-(void)getWeatherAtCurrentLocationOnSuccess: (SucessWeatherCompletionBlock)successBlock
                                  onFailure: (FailureCompletionBlock)failureBlock;
@end

NS_ASSUME_NONNULL_END
