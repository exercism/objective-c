#import <XCTest/XCTest.h>

#if __has_include("SeriesExample.h")
#import "SeriesExample.h"
#else
#import "Series.h"
#endif

@interface SeriesTest : XCTestCase

@end

@implementation SeriesTest

- (void)testSimpleSlicesOfOne {
    Series *series = [[Series alloc] initWithNumberString:@"01234"];
    NSArray *expected = @[@[@0], @[@1], @[@2], @[@3], @[@4]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:1]);
}

- (void)testSimpleSlicesOfOneAgain {
    Series *series = [[Series alloc] initWithNumberString:@"92834"];
    NSArray *expected = @[@[@9], @[@2], @[@8], @[@3], @[@4]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:1]);
}

- (void)testSimpleSlicesOfTwo {
    Series *series = [[Series alloc] initWithNumberString:@"01234"];
    NSArray *expected = @[@[@0, @1], @[@1, @2], @[@2, @3], @[@3, @4]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:2]);
}

- (void)testOtherSlicesOfTwo {
    Series *series = [[Series alloc] initWithNumberString:@"98273463"];
    NSArray *expected = @[@[@9, @8], @[@8, @2], @[@2, @7], @[@7, @3], @[@3, @4], @[@4, @6], @[@6, @3]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:2]);
}

- (void)testSimpleSlicesOfTwoAgain {
    Series *series = [[Series alloc] initWithNumberString:@"37103"];
    NSArray *expected = @[@[@3, @7], @[@7, @1], @[@1, @0], @[@0, @3]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:2]);
}

- (void)testSimpleSlicesOfThree {
    Series *series = [[Series alloc] initWithNumberString:@"01234"];
    NSArray *expected = @[@[@0, @1, @2], @[@1, @2, @3], @[@2, @3, @4]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:3]);
}

- (void)testSimpleSlicesOfThreeAgain {
    Series *series = [[Series alloc] initWithNumberString:@"31001"];
    NSArray *expected = @[@[@3, @1, @0], @[@1, @0, @0], @[@0, @0, @1]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:3]);
}

- (void)testOtherSlicesOfThree {
    Series *series = [[Series alloc] initWithNumberString:@"982347"];
    NSArray *expected = @[@[@9, @8, @2], @[@8, @2, @3], @[@2, @3, @4], @[@3, @4, @7]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:3]);
}

- (void)testSimpleSlicesOfFour {
    Series *series = [[Series alloc] initWithNumberString:@"01234"];
    NSArray *expected = @[@[@0, @1, @2, @3], @[@1, @2, @3, @4]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:4]);
}

- (void)testSimpleSlicesOfFourAgain {
    Series *series = [[Series alloc] initWithNumberString:@"91274"];
    NSArray *expected = @[@[@9, @1, @2, @7], @[@1, @2, @7, @4]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:4]);
}

- (void)testSimpleSlicesOfFive {
    Series *series = [[Series alloc] initWithNumberString:@"01234"];
    NSArray *expected = @[@[@0, @1, @2, @3, @4]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:5]);
}

- (void)testSimpleSlicesOfFiveAgain {
    Series *series = [[Series alloc] initWithNumberString:@"81228"];
    NSArray *expected = @[@[@8, @1, @2, @2, @8]];
    XCTAssertEqualObjects(expected, [series slicesWithSize:5]);
}

- (void)testSimpleSliceThatBlowsUp {
    Series *series = [[Series alloc] initWithNumberString:@"01234"];
    XCTAssertNil([series slicesWithSize:6]);
}

- (void)testMoreComplicatedSliceThatBlowsUp {
    Series *series = [[Series alloc] initWithNumberString:@"01032987583"];
    XCTAssertNil([series slicesWithSize:12]);
}

@end
