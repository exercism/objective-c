#import <XCTest/XCTest.h>

#if __has_include("LargestSeriesProductExample.h")
# import "LargestSeriesProductExample.h"
#else
# import "LargestSeriesProduct.h"
#endif

@interface LargestSeriesProductTest : XCTestCase

@end

@implementation LargestSeriesProductTest

- (void)testFindsTheLargestProductIfSpanEqualsLength {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"29"];
    XCTAssertEqual(18, [series largestProduct:2]);
}

- (void)testCanFindTheLargestProductOf2WithNumbersInOrder {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"0123456789"];
    XCTAssertEqual(72, [series largestProduct:2]);
}

- (void)testCanFindTheLargestProductOf2 {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"576802143"];
    XCTAssertEqual(48, [series largestProduct:2]);
}

- (void)testCanFindTheLargestProductOf3WithNumbersInOrder {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"0123456789"];
    XCTAssertEqual(504, [series largestProduct:3]);
}

- (void)testCanFindTheLargestProductOf3 {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"1027839564"];
    XCTAssertEqual(270, [series largestProduct:3]);
}

- (void)testCanFindTheLargestProductOf5WithNumbersInOrder {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"0123456789"];
    XCTAssertEqual(15120, [series largestProduct:5]);
}

- (void)testCanGetTheLargestProductOfABigNumber {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"73167176531330624919225119674426574742355349194934"];
    XCTAssertEqual(23520, [series largestProduct:6]);
}

- (void)testReportsZeroIfTheOnlyDigitsAreZero {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"0000"];
    XCTAssertEqual(0, [series largestProduct:2]);
}

- (void)testReportsZeroIfAllSpansIncludeZero {
    LargestSeriesProduct *series = [[LargestSeriesProduct alloc] initWithNumberString:@"99099"];
    XCTAssertEqual(0, [series largestProduct:3]);
}

- (void)testRejectsSpanLongerThanStringLength {
    XCTAssertThrows([[[LargestSeriesProduct alloc] initWithNumberString:@"123"] largestProduct:4]);
}

- (void)testRejectsEmptyStringAndNonzeroSpan {
    XCTAssertThrows([[[LargestSeriesProduct alloc] initWithNumberString:@""] largestProduct:1]);
}

- (void)testRejectsInvalidCharacterInDigits {
    XCTAssertThrows([[[LargestSeriesProduct alloc] initWithNumberString:@"1234a5"] largestProduct:2]);
}

- (void)testRejectsNegativeSpan {
    XCTAssertThrows([[[LargestSeriesProduct alloc] initWithNumberString:@"12345"] largestProduct:-1]);
}

@end
