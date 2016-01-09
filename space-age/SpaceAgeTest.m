#import <XCTest/XCTest.h>
#import "SpaceAge.h"

@interface test_suite : XCTestCase

@end

@implementation test_suite

- (void)testAgeInSeconds {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:1000000];
    XCTAssertEqual(1000000, [age seconds]);
}

- (void)testAgeInEarthYears {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:1000000000];
    XCTAssertEqual(31.69, [age onEarth]);
}

- (void)testAgeInMercuryYears {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:2134835688];
    XCTAssertEqual(67.65, [age onEarth]);
    XCTAssertEqual(280.88, [age onMercury]);
}

- (void)testAgeInVenusYears {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:189839836];
    XCTAssertEqual(6.02, [age onEarth]);
    XCTAssertEqual(9.78, [age onVenus]);
}

- (void)testAgeOnMars {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:2329871239];
    XCTAssertEqual(73.83, [age onEarth]);
    XCTAssertEqual(39.25, [age onMars]);
}

- (void)testAgeOnJupiter {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:901876382];
    XCTAssertEqual(28.58, [age onEarth]);
    XCTAssertEqual(2.41, [age onJupiter]);
}

- (void)testAgeOnSaturn {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:3000000000];
    XCTAssertEqual(95.06, [age onEarth]);
    XCTAssertEqual(3.23, [age onSaturn]);
}

- (void)testAgeOnUranus {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:3210123456];
    XCTAssertEqual(101.72, [age onEarth]);
    XCTAssertEqual(1.21, [age onUranus]);
}

- (void)testAgeOnNeptune {
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:8210123456];
    XCTAssertEqual(260.16, [age onEarth]);
    XCTAssertEqual(1.58, [age onNeptune]);
}

@end
