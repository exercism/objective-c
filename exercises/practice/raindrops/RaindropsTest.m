#import <XCTest/XCTest.h>

#if __has_include("RaindropsExample.h")
# import "RaindropsExample.h"
#else
# import "Raindrops.h"
#endif

@interface RaindropsTest : XCTestCase

@end

@implementation RaindropsTest

- (void)testTheSoundFor1Is1 {
    XCTAssertEqualObjects(@"1", [[[Raindrops alloc] initWithNumber:1] sounds]);
}

- (void)testTheSoundFor3IsPling {
    XCTAssertEqualObjects(@"Pling", [[[Raindrops alloc] initWithNumber:3] sounds]);
}

- (void)testTheSoundFor5IsPlang {
    XCTAssertEqualObjects(@"Plang", [[[Raindrops alloc] initWithNumber:5] sounds]);
}

- (void)testTheSoundFor7IsPlong {
    XCTAssertEqualObjects(@"Plong", [[[Raindrops alloc] initWithNumber:7] sounds]);
}

- (void)testTheSoundFor6IsPlingAsItHasAFactor3 {
    XCTAssertEqualObjects(@"Pling", [[[Raindrops alloc] initWithNumber:6] sounds]);
}

- (void)test2ToThePower3DoesNotMakeARaindropSoundAs3IsTheExponentNotTheBase {
    XCTAssertEqualObjects(@"8", [[[Raindrops alloc] initWithNumber:8] sounds]);
}

- (void)testTheSoundFor9IsPlingAsItHasAFactor3 {
    XCTAssertEqualObjects(@"Pling", [[[Raindrops alloc] initWithNumber:9] sounds]);
}

- (void)testTheSoundFor10IsPlangAsItHasAFactor5 {
    XCTAssertEqualObjects(@"Plang", [[[Raindrops alloc] initWithNumber:10] sounds]);
}

- (void)testTheSoundFor14IsPlongAsItHasAFactorOf7 {
    XCTAssertEqualObjects(@"Plong", [[[Raindrops alloc] initWithNumber:14] sounds]);
}

- (void)testTheSoundFor15IsPlingplangAsItHasFactors3And5 {
    XCTAssertEqualObjects(@"PlingPlang", [[[Raindrops alloc] initWithNumber:15] sounds]);
}

- (void)testTheSoundFor21IsPlingplongAsItHasFactors3And7 {
    XCTAssertEqualObjects(@"PlingPlong", [[[Raindrops alloc] initWithNumber:21] sounds]);
}

- (void)testTheSoundFor25IsPlangAsItHasAFactor5 {
    XCTAssertEqualObjects(@"Plang", [[[Raindrops alloc] initWithNumber:25] sounds]);
}

- (void)testTheSoundFor27IsPlingAsItHasAFactor3 {
    XCTAssertEqualObjects(@"Pling", [[[Raindrops alloc] initWithNumber:27] sounds]);
}

- (void)testTheSoundFor35IsPlangplongAsItHasFactors5And7 {
    XCTAssertEqualObjects(@"PlangPlong", [[[Raindrops alloc] initWithNumber:35] sounds]);
}

- (void)testTheSoundFor49IsPlongAsItHasAFactor7 {
    XCTAssertEqualObjects(@"Plong", [[[Raindrops alloc] initWithNumber:49] sounds]);
}

- (void)testTheSoundFor52Is52 {
    XCTAssertEqualObjects(@"52", [[[Raindrops alloc] initWithNumber:52] sounds]);
}

- (void)testTheSoundFor105IsPlingplangplongAsItHasFactors35And7 {
    XCTAssertEqualObjects(@"PlingPlangPlong", [[[Raindrops alloc] initWithNumber:105] sounds]);
}

- (void)testTheSoundFor3125IsPlangAsItHasAFactor5 {
    XCTAssertEqualObjects(@"Plang", [[[Raindrops alloc] initWithNumber:3125] sounds]);
}

@end
