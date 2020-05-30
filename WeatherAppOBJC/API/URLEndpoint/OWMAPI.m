//
//  OWMAPI.m
//  WeatherAppOBJC
//
//  Created by Александр on 5/29/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import "OWMAPI.h"
#import "WeatherData.h"

@implementation OWMAPI

WeatherParser *weatherParser;

-(id) initWithParser: (WeatherParser*)parser {
    self = [super init];
    if (self) {
        weatherParser = parser;
    }
    return self;
}

-(void)getWeatherForecastWithLat: (NSString*)lat lon:(NSString*)lon
                       onSuccess: (SuccessCompletionBlock)successBlock
                       onFailure: (FailureCompletionBlock)failureBlock {
    NSString *urlString = [NSString stringWithFormat:@"", lat, lon];
    NSURL *url = [NSURL URLWithString: urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data,
                                                                         NSURLResponse * _Nullable response,
                                                                         NSError * _Nullable error) {
        if (data) {
            NSError *serializationError = nil;
            NSDictionary *weatherJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&serializationError];
            if (serializationError) {
                failureBlock(serializationError);
                return;
            }
            successBlock([weatherParser parseWeatherJson:weatherJson]);
        } else if (error) {
            failureBlock(error);
        }
    }] resume];
}

@end
