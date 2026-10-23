#import <XCTest/XCTest.h>

#if __has_include("SpaceAgeExample.h")
# import "SpaceAgeExample.h"
#else
# import "SpaceAge.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SpaceAgeTest : XCTestCase

@end

@implementation SpaceAgeTest

static const double AgeAccuracy = 0.01;

- (void)testAgeOnEarth { //!OCLINT
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:1000000000];
    XCTAssertEqualWithAccuracy(31.69, age.onEarth, AgeAccuracy);
}

- (void)testAgeOnMercury { //!OCLINT
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:2134835688];
    XCTAssertEqualWithAccuracy(280.88, age.onMercury, AgeAccuracy);
}

- (void)testAgeOnVenus { //!OCLINT
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:189839836];
    XCTAssertEqualWithAccuracy(9.78, age.onVenus, AgeAccuracy);
}

- (void)testAgeOnMars { //!OCLINT
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:2129871239];
    XCTAssertEqualWithAccuracy(35.88, age.onMars, AgeAccuracy);
}

- (void)testAgeOnJupiter { //!OCLINT
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:901876382];
    XCTAssertEqualWithAccuracy(2.41, age.onJupiter, AgeAccuracy);
}

- (void)testAgeOnSaturn { //!OCLINT
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:2000000000];
    XCTAssertEqualWithAccuracy(2.15, age.onSaturn, AgeAccuracy);
}

- (void)testAgeOnUranus { //!OCLINT
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:1210123456];
    XCTAssertEqualWithAccuracy(0.46, age.onUranus, AgeAccuracy);
}

- (void)testAgeOnNeptune { //!OCLINT
    SpaceAge *age = [[SpaceAge alloc] initWithSeconds:1821023456];
    XCTAssertEqualWithAccuracy(0.35, age.onNeptune, AgeAccuracy);
}

@end

NS_ASSUME_NONNULL_END
