#import <XCTest/XCTest.h>

#if __has_include("PascalsTriangleExample.h")
# import "PascalsTriangleExample.h"
# else
# import "PascalsTriangle.h"
#endif

@interface PascalsTriangleTest : XCTestCase

@end

@implementation PascalsTriangleTest

- (void)testOneRow {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:1];
    XCTAssertEqualObjects(@[@[@1]], triangle.rows);
}

- (void)testTwoRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:2];
    NSArray *expected = @[@[@1], @[@1, @1]];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testThreeRows {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:3];
    NSArray *expected = @[@[@1], @[@1, @1], @[@1, @2, @1]];
    XCTAssertEqualObjects(expected, triangle.rows);
}

- (void)testFourthRow {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:4];
    NSArray *expected = @[@1, @3, @3, @1];
    XCTAssertEqualObjects(expected, [triangle.rows lastObject]);
}

- (void)testFifthRow {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:5];
    NSArray *expected = @[@1, @4, @6, @4, @1];
    XCTAssertEqualObjects(expected, [triangle.rows lastObject]);
}

- (void)testTwentiethRow {
    PascalsTriangle *triangle = [[PascalsTriangle alloc] initWithNumberOfRows:20];
    NSArray *expected = @[
                    @1, @19, @171, @969, @3876, @11628, @27132, @50388, @75582, @92378, @92378,
                    @75582, @50388, @27132, @11628, @3876, @969, @171, @19, @1
                    ];
    XCTAssertEqualObjects(expected, [triangle.rows lastObject]);
}

@end
