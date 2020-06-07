//
//  LocalRepository.m
//  WeatherAppOBJC
//
//  Created by Александр on 6/5/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalRepository.h"
#import "WeatherManagedObject+CoreDataClass.h"

@implementation LocalRepository

NSPersistentContainer *persistentContainer;

- (id) init {
    self = [super init];
    if (self) {
        persistentContainer = [(AppDelegate *)[UIApplication sharedApplication] persistentContainer];
    }
    return self;
}

- (WeatherModel *) getCurrentLocationWeather {
    NSManagedObjectContext *context = persistentContainer.newBackgroundContext;
    WeatherManagedObject *weatherManagedObject = [self getCurrentWeatherManagedObjectWithContext:context];
    if (weatherManagedObject) {
        return [[WeatherModel alloc] initFromManagedObject:weatherManagedObject];
    } else {
        return nil;
    }
}

- (void) updateWeatherAtCurrentLocationFromWeatherModel: (WeatherModel *)weatherModel {
    NSManagedObjectContext *updateContext = persistentContainer.newBackgroundContext;
    WeatherManagedObject *currentLocationManagedObject = [self getCurrentWeatherManagedObjectWithContext:updateContext];
    if (currentLocationManagedObject) {
        [self saveCurrentLocationWeather:weatherModel];
    } else {
        currentLocationManagedObject = [[WeatherManagedObject alloc] initFromWeatherModel:weatherModel withContext:updateContext];
        [self saveContext:updateContext];
    }
}

- (void) saveCurrentLocationWeather: (WeatherModel *)weatherModel {
    NSManagedObjectContext *saveBacgroundContext = persistentContainer.newBackgroundContext;
    WeatherManagedObject *weatherManagedObject = [[WeatherManagedObject alloc] initFromWeatherModel:weatherModel
                                                                                        withContext:saveBacgroundContext];
    NSLog(@"%@", weatherManagedObject);
    [self saveContext:saveBacgroundContext];
}

- (WeatherManagedObject *) getCurrentWeatherManagedObjectWithContext: (NSManagedObjectContext *)context {
    NSFetchRequest<WeatherManagedObject *> *currentLocationWeatherRequest = WeatherManagedObject.fetchCurrentLocationWeatherRequest;
    NSError *fetchRequestError;
    NSArray<WeatherManagedObject *> *weatherManagedObject = [context executeFetchRequest:currentLocationWeatherRequest error:&fetchRequestError];
    if (!weatherManagedObject) {
        NSLog(@"Error fetching Weather objects: %@", [fetchRequestError localizedDescription]);
    }
    return weatherManagedObject.firstObject;
}

- (void) saveContext: (NSManagedObjectContext *)context {
    NSError *saveContextError;
    if ([context hasChanges] && ![context save:&saveContextError]) {
        NSLog(@"Unresolved error %@, %@", saveContextError, saveContextError.userInfo);
    }
}

@end
