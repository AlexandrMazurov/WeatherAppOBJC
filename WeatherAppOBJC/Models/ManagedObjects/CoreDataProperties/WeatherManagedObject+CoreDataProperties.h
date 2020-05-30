//
//  WeatherManagedObject+CoreDataProperties.h
//  WeatherAppOBJC
//
//  Created by Александр on 5/30/20.
//  Copyright © 2020 AlexandrMazurov. All rights reserved.
//
//

#import "WeatherManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WeatherManagedObject (CoreDataProperties)

+ (NSFetchRequest<WeatherManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *cityName;
@property (nonatomic) int16_t degree;
@property (nonatomic) BOOL isCurrentLocation;
@property (nullable, nonatomic, copy) NSString *situation;
@property (nullable, nonatomic, retain) NSOrderedSet<HourlyForecastManagedObject *> *hourlyForecast;
@property (nullable, nonatomic, retain) NSOrderedSet<WeakForecastManagedObject *> *weakForecast;
@property (nullable, nonatomic, retain) NSOrderedSet<WeatherInfoManagedObject *> *weatherInfo;

@end

@interface WeatherManagedObject (CoreDataGeneratedAccessors)

- (void)insertObject:(HourlyForecastManagedObject *)value inHourlyForecastAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHourlyForecastAtIndex:(NSUInteger)idx;
- (void)insertHourlyForecast:(NSArray<HourlyForecastManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHourlyForecastAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHourlyForecastAtIndex:(NSUInteger)idx withObject:(HourlyForecastManagedObject *)value;
- (void)replaceHourlyForecastAtIndexes:(NSIndexSet *)indexes withHourlyForecast:(NSArray<HourlyForecastManagedObject *> *)values;
- (void)addHourlyForecastObject:(HourlyForecastManagedObject *)value;
- (void)removeHourlyForecastObject:(HourlyForecastManagedObject *)value;
- (void)addHourlyForecast:(NSOrderedSet<HourlyForecastManagedObject *> *)values;
- (void)removeHourlyForecast:(NSOrderedSet<HourlyForecastManagedObject *> *)values;

- (void)insertObject:(WeakForecastManagedObject *)value inWeakForecastAtIndex:(NSUInteger)idx;
- (void)removeObjectFromWeakForecastAtIndex:(NSUInteger)idx;
- (void)insertWeakForecast:(NSArray<WeakForecastManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeWeakForecastAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInWeakForecastAtIndex:(NSUInteger)idx withObject:(WeakForecastManagedObject *)value;
- (void)replaceWeakForecastAtIndexes:(NSIndexSet *)indexes withWeakForecast:(NSArray<WeakForecastManagedObject *> *)values;
- (void)addWeakForecastObject:(WeakForecastManagedObject *)value;
- (void)removeWeakForecastObject:(WeakForecastManagedObject *)value;
- (void)addWeakForecast:(NSOrderedSet<WeakForecastManagedObject *> *)values;
- (void)removeWeakForecast:(NSOrderedSet<WeakForecastManagedObject *> *)values;

- (void)insertObject:(WeatherInfoManagedObject *)value inWeatherInfoAtIndex:(NSUInteger)idx;
- (void)removeObjectFromWeatherInfoAtIndex:(NSUInteger)idx;
- (void)insertWeatherInfo:(NSArray<WeatherInfoManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeWeatherInfoAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInWeatherInfoAtIndex:(NSUInteger)idx withObject:(WeatherInfoManagedObject *)value;
- (void)replaceWeatherInfoAtIndexes:(NSIndexSet *)indexes withWeatherInfo:(NSArray<WeatherInfoManagedObject *> *)values;
- (void)addWeatherInfoObject:(WeatherInfoManagedObject *)value;
- (void)removeWeatherInfoObject:(WeatherInfoManagedObject *)value;
- (void)addWeatherInfo:(NSOrderedSet<WeatherInfoManagedObject *> *)values;
- (void)removeWeatherInfo:(NSOrderedSet<WeatherInfoManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
