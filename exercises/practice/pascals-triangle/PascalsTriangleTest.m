#import <XCTest/XCTest.h>

#if __has_include("PascalsTriangleExample.h")
# import "PascalsTriangleExample.h"
#else
# import "PascalsTriangle.h"
#endif

@interface PascalsTriangleTest : XCTestCase

@end

@implementation PascalsTriangleTest

- (void)testZeroRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:0];
    NSArray<NSArray<NSNumber *> *> *expected = @[];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testSingleRow {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:1];
    NSArray<NSArray<NSNumber *> *> *expected = @[
        @[@1]
    ];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testTwoRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:2];
    NSArray<NSArray<NSNumber *> *> *expected = @[
        @[@1],
        @[@1, @1]
    ];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testThreeRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:3];
    NSArray<NSArray<NSNumber *> *> *expected = @[
        @[@1],
        @[@1, @1],
        @[@1, @2, @1]
    ];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testFourRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:4];
    NSArray<NSArray<NSNumber *> *> *expected = @[
        @[@1],
        @[@1, @1],
        @[@1, @2, @1],
        @[@1, @3, @3, @1]
    ];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testFiveRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:5];
    NSArray<NSArray<NSNumber *> *> *expected = @[
        @[@1],
        @[@1, @1],
        @[@1, @2, @1],
        @[@1, @3, @3, @1],
        @[@1, @4, @6, @4, @1]
    ];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testSixRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:6];
    NSArray<NSArray<NSNumber *> *> *expected = @[
        @[@1],
        @[@1, @1],
        @[@1, @2, @1],
        @[@1, @3, @3, @1],
        @[@1, @4, @6, @4, @1],
        @[@1, @5, @10, @10, @5, @1]
    ];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testTenRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:10];
    NSArray<NSArray<NSNumber *> *> *expected = @[
        @[@1],
        @[@1, @1],
        @[@1, @2, @1],
        @[@1, @3, @3, @1],
        @[@1, @4, @6, @4, @1],
        @[@1, @5, @10, @10, @5, @1],
        @[@1, @6, @15, @20, @15, @6, @1],
        @[@1, @7, @21, @35, @35, @21, @7, @1],
        @[@1, @8, @28, @56, @70, @56, @28, @8, @1],
        @[@1, @9, @36, @84, @126, @126, @84, @36, @9, @1]
    ];
    XCTAssertEqualObjects(expected, triangle.rows);
}

@end
