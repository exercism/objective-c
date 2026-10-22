#import <XCTest/XCTest.h>

#if __has_include("BinarySearchExample.h")
# import "BinarySearchExample.h"
#else
# import "BinarySearch.h"
#endif

@interface BinarySearchTest : XCTestCase

@end

@implementation BinarySearchTest

- (void)testFindsAValueInAnArrayWithOneElement {
    NSArray<NSNumber *> *input = @[@6];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(0, [binary searchFor:6]);
}

- (void)testFindsAValueInTheMiddleOfAnArray {
    NSArray<NSNumber *> *input = @[@1, @3, @4, @6, @8, @9, @11];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(3, [binary searchFor:6]);
}

- (void)testFindsAValueAtTheBeginningOfAnArray {
    NSArray<NSNumber *> *input = @[@1, @3, @4, @6, @8, @9, @11];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(0, [binary searchFor:1]);
}

- (void)testFindsAValueAtTheEndOfAnArray {
    NSArray<NSNumber *> *input = @[@1, @3, @4, @6, @8, @9, @11];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(6, [binary searchFor:11]);
}

- (void)testFindsAValueInAnArrayOfOddLength {
    NSArray<NSNumber *> *input = @[@1, @3, @5, @8, @13, @21, @34, @55, @89, @144, @233, @377, @634];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(9, [binary searchFor:144]);
}

- (void)testFindsAValueInAnArrayOfEvenLength {
    NSArray<NSNumber *> *input = @[@1, @3, @5, @8, @13, @21, @34, @55, @89, @144, @233, @377];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(5, [binary searchFor:21]);
}

- (void)testIdentifiesThatAValueIsNotIncludedInTheArray {
    NSArray<NSNumber *> *input = @[@1, @3, @4, @6, @8, @9, @11];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(NSNotFound, [binary searchFor:7]);
}

- (void)testAValueSmallerThanTheArraySSmallestValueIsNotFound {
    NSArray<NSNumber *> *input = @[@1, @3, @4, @6, @8, @9, @11];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(NSNotFound, [binary searchFor:0]);
}

- (void)testAValueLargerThanTheArraySLargestValueIsNotFound {
    NSArray<NSNumber *> *input = @[@1, @3, @4, @6, @8, @9, @11];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(NSNotFound, [binary searchFor:13]);
}

- (void)testNothingIsFoundInAnEmptyArray {
    NSArray<NSNumber *> *input = @[];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(NSNotFound, [binary searchFor:1]);
}

- (void)testNothingIsFoundWhenTheLeftAndRightBoundsCross {
    NSArray<NSNumber *> *input = @[@1, @2];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:input];
    XCTAssertEqual(NSNotFound, [binary searchFor:0]);
}

@end
