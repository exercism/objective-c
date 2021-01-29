#import <XCTest/XCTest.h>

#if __has_include("FlattenArrayExample.h")
# import "FlattenArrayExample.h"
# else
# import "FlattenArray.h"
#endif

@interface FlattenArrayTest : XCTestCase

@end

static NSNull *nullValue;

@implementation FlattenArrayTest

- (void)setUp {
    nullValue = [NSNull null];
}

- (void)testFlattenArrayWithJustIntegers {
    NSArray *inputArray = @[@1, @[@2, @3, @4, @5, @6, @7], @8];
    NSArray *expected = @[@1, @2, @3, @4, @5, @6, @7, @8];
    XCTAssertEqualObjects(expected, [FlattenArrayExample flattenArray:inputArray]);
}

- (void)testFiveLevelNesting {
    NSArray *inputArray = @[@0, @2, @[@[@2, @3], @8, @100, @4, @[@[@50]]], @-2];
    NSArray *expected = @[@0, @2, @2, @3, @8, @100, @4, @50, @-2];
    XCTAssertEqualObjects(expected, [FlattenArrayExample flattenArray:inputArray]);
}

- (void)testSixLevelNesting {
    NSArray *inputArray = @[@1, @[@2, @[@[@3]], @[@4, @[@[@5]]], @6, @7], @8];
    NSArray *expected = @[@1, @2, @3, @4, @5, @6, @7, @8];
    XCTAssertEqualObjects(expected, [FlattenArrayExample flattenArray:inputArray]);
}

- (void)testSixLevelNestingWithNullValues {
    NSArray *inputArray = @[@0, @2, @[@[@2, @3], @8, @[@[@100]], nullValue, @[@[nullValue]]], @-2];
    NSArray *expected = @[@0, @2, @2, @3, @8, @100, @-2];
    XCTAssertEqualObjects(expected, [FlattenArrayExample flattenArray:inputArray]);
}

- (void)testAllValuesInNestedListAreNull {
    NSArray *inputArray = @[nullValue, @[@[@[@[nullValue]]]], nullValue, nullValue, @[@[nullValue, nullValue], nullValue], nullValue];
    NSArray *expected = @[];
    XCTAssertEqualObjects(expected, [FlattenArrayExample flattenArray:inputArray]);
}

- (void)testFiveLevelDeepNestedListWithDoubleValuesAndNullValues {
    NSArray *inputArray = @[@0.085, @2.8844557, @[@[@2.00005, @3.13], @8.4, @100, @4.8, @[@[@[nullValue]]]], @-2.5];
    NSArray *expected = @[@0.085, @2.8844557, @2.00005, @3.13, @8.4, @100, @4.8, @-2.5];
    XCTAssertEqualObjects(expected, [FlattenArrayExample flattenArray:inputArray]);
}

- (void)testSixLevelDeepNestedListWithStringsAndNullValues {
    NSArray *inputArray = @[@"Zero", @"two", @[@[@[@"Two", @"three"]], @"eight", @[@[@"One Hundred"]], nullValue, @[@[nullValue]]], @"minus two"];
    NSArray *expected = @[@"Zero", @"two", @"Two", @"three", @"eight", @"One Hundred", @"minus two"];
    XCTAssertEqualObjects(expected, [FlattenArrayExample flattenArray:inputArray]);
}
@end
