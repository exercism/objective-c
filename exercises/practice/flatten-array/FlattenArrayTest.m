#import <XCTest/XCTest.h>

#if __has_include("FlattenArrayExample.h")
# import "FlattenArrayExample.h"
typedef FlattenArrayExample FlattenArrayTestSubject;
#else
# import "FlattenArray.h"
typedef FlattenArray FlattenArrayTestSubject;
#endif

@interface FlattenArrayTest : XCTestCase

@end

@implementation FlattenArrayTest


- (void)testEmpty {
    NSArray *input = @[];
    NSArray *expected = @[];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)testNoNesting {
    NSArray *input = @[@0, @1, @2];
    NSArray *expected = @[@0, @1, @2];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)testFlattensANestedArray {
    NSArray *input = @[@[@[]]];
    NSArray *expected = @[];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)testFlattensArrayWithJustIntegersPresent {
    NSArray *input = @[@1, @[@2, @3, @4, @5, @6, @7], @8];
    NSArray *expected = @[@1, @2, @3, @4, @5, @6, @7, @8];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)test5LevelNesting {
    NSArray *input = @[@0, @2, @[@[@2, @3], @8, @100, @4, @[@[@[@50]]]], @(-2)];
    NSArray *expected = @[@0, @2, @2, @3, @8, @100, @4, @50, @(-2)];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)test6LevelNesting {
    NSArray *input = @[@1, @[@2, @[@[@3]], @[@4, @[@[@5]]], @6, @7], @8];
    NSArray *expected = @[@1, @2, @3, @4, @5, @6, @7, @8];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)testNullValuesAreOmittedFromTheFinalResult {
    NSArray *input = @[@1, @2, [NSNull null]];
    NSArray *expected = @[@1, @2];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)testConsecutiveNullValuesAtTheFrontOfTheArrayAreOmittedFromTheFinalResult {
    NSArray *input = @[[NSNull null], [NSNull null], @3];
    NSArray *expected = @[@3];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)testConsecutiveNullValuesInTheMiddleOfTheArrayAreOmittedFromTheFinalResult {
    NSArray *input = @[@1, [NSNull null], [NSNull null], @4];
    NSArray *expected = @[@1, @4];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)test6LevelNestedArrayWithNullValues {
    NSArray *input = @[@0, @2, @[@[@2, @3], @8, @[@[@100]], [NSNull null], @[@[[NSNull null]]]], @(-2)];
    NSArray *expected = @[@0, @2, @2, @3, @8, @100, @(-2)];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

- (void)testAllValuesInNestedArrayAreNull {
    NSArray *input = @[[NSNull null], @[@[@[[NSNull null]]]], [NSNull null], [NSNull null], @[@[[NSNull null], [NSNull null]], [NSNull null]], [NSNull null]];
    NSArray *expected = @[];
    XCTAssertEqualObjects(expected, [FlattenArrayTestSubject flattenArray:input]);
}

@end
