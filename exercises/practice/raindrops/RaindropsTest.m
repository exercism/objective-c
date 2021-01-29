#import <XCTest/XCTest.h>

#if __has_include("RaindropsExample.h")
# import "RaindropsExample.h"
# else
# import "Raindrops.h"
#endif

@interface RaindropsTest : XCTestCase

@end

@implementation RaindropsTest

- (void)test1 {
    XCTAssertEqualObjects(@"1", [[[Raindrops alloc] initWithNumber:1] sounds]);
}

- (void)test3 {
    XCTAssertEqualObjects(@"Pling", [[[Raindrops alloc] initWithNumber:3] sounds]);
}

- (void)test5 {
    XCTAssertEqualObjects(@"Plang", [[[Raindrops alloc] initWithNumber:5] sounds]);
}

- (void)test7 {
    XCTAssertEqualObjects(@"Plong", [[[Raindrops alloc] initWithNumber:7] sounds]);
}

- (void)test6 {
    XCTAssertEqualObjects(@"Pling", [[[Raindrops alloc] initWithNumber:6] sounds]);
}

- (void)test9 {
    XCTAssertEqualObjects(@"Pling", [[[Raindrops alloc] initWithNumber:9] sounds]);
}

- (void)test10 {
    XCTAssertEqualObjects(@"Plang", [[[Raindrops alloc] initWithNumber:10] sounds]);
}

- (void)test14 {
    XCTAssertEqualObjects(@"Plong", [[[Raindrops alloc] initWithNumber:14] sounds]);
}

- (void)test15 {
    XCTAssertEqualObjects(@"PlingPlang", [[[Raindrops alloc] initWithNumber:15] sounds]);
}

- (void)test21 {
    XCTAssertEqualObjects(@"PlingPlong", [[[Raindrops alloc] initWithNumber:21] sounds]);
}

- (void)test25 {
    XCTAssertEqualObjects(@"Plang", [[[Raindrops alloc] initWithNumber:25] sounds]);
}

- (void)test35 {
    XCTAssertEqualObjects(@"PlangPlong", [[[Raindrops alloc] initWithNumber:35] sounds]);
}

- (void)test49 {
    XCTAssertEqualObjects(@"Plong", [[[Raindrops alloc] initWithNumber:49] sounds]);
}

- (void)test52 {
    XCTAssertEqualObjects(@"52", [[[Raindrops alloc] initWithNumber:52] sounds]);
}

- (void)test105 {
    XCTAssertEqualObjects(@"PlingPlangPlong", [[[Raindrops alloc] initWithNumber:105] sounds]);
}

- (void)test12121 {
    XCTAssertEqualObjects(@"12121", [[[Raindrops alloc] initWithNumber:12121] sounds]);
}

@end
