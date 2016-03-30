#import <XCTest/XCTest.h>
#import "SpaceAge.h"

@interface test_suite : XCTestCase

- (void)assertValue1:(double)value1 isEqualToValue2:(double)value2;

@end

@implementation test_suite

- (void)assertValue1:(double)value1 isEqualToValue2:(double)value2 {
    double accuracyLevel = 0.01;
    XCTAssertEqualWithAccuracy(value1, value2, accuracyLevel);
}

- (void)testAgeInSeconds {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:1000000];
    XCTAssertEqual(1000000, [age seconds]);
    
}

- (void)testAgeInEarthYears {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:1000000000];
    [self assertValue1:31.69 isEqualToValue2:[age onEarth]];
}

- (void)testAgeInMercuryYears {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:2134835688];
    [self assertValue1:67.65 isEqualToValue2:[age onEarth]];
    [self assertValue1:280.88 isEqualToValue2:[age onMercury]];
}

- (void)testAgeInVenusYears {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:189839836];
    [self assertValue1:6.02 isEqualToValue2:[age onEarth]];
    [self assertValue1:9.78 isEqualToValue2:[age onVenus]];
}

- (void)testAgeOnMars {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:2329871239];
    [self assertValue1:73.83 isEqualToValue2:[age onEarth]];
    [self assertValue1:39.25 isEqualToValue2:[age onMars]];
}

- (void)testAgeOnJupiter {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:901876382];
    [self assertValue1:28.58 isEqualToValue2:[age onEarth]];
    [self assertValue1:2.41 isEqualToValue2:[age onJupiter]];
}

- (void)testAgeOnSaturn {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:3000000000];
    [self assertValue1:95.06 isEqualToValue2:[age onEarth]];
    [self assertValue1:3.23 isEqualToValue2:[age onSaturn]];
}

- (void)testAgeOnUranus {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:3210123456];
    [self assertValue1:101.72 isEqualToValue2:[age onEarth]];
    [self assertValue1:1.21 isEqualToValue2:[age onUranus]];
}

- (void)testAgeOnNeptune {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:8210123456];
    [self assertValue1:260.16 isEqualToValue2:[age onEarth]];
    [self assertValue1:1.58 isEqualToValue2:[age onNeptune]];
}

@end
