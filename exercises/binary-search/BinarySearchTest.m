#import <XCTest/XCTest.h>

#if __has_include("BinarySearchExample.h")
# import "BinarySearchExample.h"
# else
# import "BinarySearch.h"
#endif

@interface BinarySearchTest : XCTestCase

@end

@implementation BinarySearchTest

- (void)testHasListData {
    NSArray *array = @[@1, @3, @4, @6, @8, @9, @11];
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:array];
    XCTAssertEqualObjects(binary.list, array);
}

- (void)testNilForUnsortedList {
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:@[@2, @1, @4, @3, @6]];
    XCTAssertNil(binary);
}

- (void)testNotFoundForDataNotInList {
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:@[@1, @3, @6]];
    XCTAssertEqual([binary searchFor:2], NSNotFound);
}

- (void)testFindsPositionOfMiddleItem {
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:@[@1, @3, @4, @6, @8, @9, @11]];
    XCTAssertEqual(3, [binary middle]);
}

- (void)testFindsPositionOfSearchData {
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:@[@1, @3, @4, @6, @8, @9, @11]];
    XCTAssertEqual(5, [binary searchFor:9]);
}

- (void)testFindsPositionInALargerList {
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:@[@1, @3, @5, @8, @13, @21, @34, @55, @89, @144]];
    XCTAssertEqual(1, [binary searchFor:3]);
    XCTAssertEqual(7, [binary searchFor:55]);
}

- (void)testFindsCorrectPositionInAListWithAnEvenNumberOfElements {
    BinarySearch *binary = [[BinarySearch alloc] initWithArray:@[@1, @3, @5, @8, @13, @21, @34, @55, @89, @144, @233, @377]];
    XCTAssertEqual(5, [binary searchFor:21]);
    XCTAssertEqual(6, [binary searchFor:34]);
}

@end
