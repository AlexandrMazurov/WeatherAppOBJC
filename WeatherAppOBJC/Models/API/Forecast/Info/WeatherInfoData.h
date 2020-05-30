//
//  WeatherInfoData.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/28/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherInfoData : NSObject

@property NSString *mainInfo;
@property NSString *mainDescription;
@property NSString *iconName;

-(id) initWithInfo: (NSString*)info description: (NSString*)description iconName: (NSString*)iconName;

@end

NS_ASSUME_NONNULL_END
