#import <XCTest/XCTest.h>

#if __has_include("AllYourBaseExample.h")
# import "AllYourBaseExample.h"
# else
# import "AllYourBase.h"
#endif

@interface AllYourBaseTest : XCTestCase

@end

@implementation AllYourBaseTest

- (void)testSingleBitOneToDecimal {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:2 inputDigits:@[@1] outputBase:10];
    NSArray<NSNumber *> *expected = @[@1];
    XCTAssertEqualObjects(result, expected);
}

- (void)testBinaryToSingleDecimal {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:2 inputDigits:@[@1, @0, @1] outputBase:10];
    NSArray<NSNumber *> *expected = @[@5];
    XCTAssertEqualObjects(result, expected);
}

- (void)testSingleDecimalToBinary {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:10 inputDigits:@[@5] outputBase:2];
    NSArray<NSNumber *> *expected = @[@1, @0, @1];
    XCTAssertEqualObjects(result, expected);
}

- (void)testBinaryToMultipleDecimal {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:2 inputDigits:@[@1, @0, @1, @0, @1, @0] outputBase:10];
    NSArray<NSNumber *> *expected = @[@4, @2];
    XCTAssertEqualObjects(result, expected);
}

- (void)testDecimalToBinary {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:10 inputDigits:@[@4, @2] outputBase:2];
    NSArray<NSNumber *> *expected = @[@1, @0, @1, @0, @1, @0];
    XCTAssertEqualObjects(result, expected);
}

- (void)testTrinaryToHexadecimal {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:3 inputDigits:@[@1, @1, @2, @0] outputBase:16];
    NSArray<NSNumber *> *expected = @[@2, @10];
    XCTAssertEqualObjects(result, expected);
}

- (void)testHexadecimalToTrinary {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:16 inputDigits:@[@2, @10] outputBase:3];
    NSArray<NSNumber *> *expected = @[@1, @1, @2, @0];
    XCTAssertEqualObjects(result, expected);
}

- (void)test15BitInteger {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:97 inputDigits:@[@3, @46, @60] outputBase:73];
    NSArray<NSNumber *> *expected = @[@6, @10, @45];
    XCTAssertEqualObjects(result, expected);
}

- (void)testEmptyList {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:2 inputDigits:@[] outputBase:10];
    NSArray<NSNumber *> *expected = @[];
    XCTAssertEqualObjects(result, expected);
}

- (void)testSingleZero {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:10 inputDigits:@[@0] outputBase:2];
    NSArray<NSNumber *> *expected = @[];
    XCTAssertEqualObjects(result, expected);
}

- (void)testMultipleZeros {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:10 inputDigits:@[@0, @0, @0] outputBase:2];
    NSArray<NSNumber *> *expected = @[];
    XCTAssertEqualObjects(result, expected);
}

- (void)testLeadingZeros {
    NSArray<NSNumber *> *result = [AllYourBase outputDigitsForInputBase:7 inputDigits:@[@0, @6, @0] outputBase:10];
    NSArray<NSNumber *> *expected = @[@4, @2];
    XCTAssertEqualObjects(result, expected);
}

- (void)testNegativeDigit {
    NSArray<NSNumber *> *inputDigits = @[@1, @(-1), @1, @0, @1, @0];
    XCTAssertThrows([AllYourBase outputDigitsForInputBase:2 inputDigits:inputDigits outputBase:10]);
}

- (void)testInvalidPositiveDigit {
    NSArray<NSNumber *> *inputDigits = @[@1, @2, @1, @0, @1, @0];
    XCTAssertThrows([AllYourBase outputDigitsForInputBase:2 inputDigits:inputDigits outputBase:10]);
}

- (void)testFirstBaseIsOne {
    NSArray<NSNumber *> *inputDigits = @[];
    XCTAssertThrows([AllYourBase outputDigitsForInputBase:1 inputDigits:inputDigits outputBase:10]);
}

- (void)testSecondBaseIsOne {
    NSArray<NSNumber *> *inputDigits = @[@1, @0, @1, @0, @1, @0];
    XCTAssertThrows([AllYourBase outputDigitsForInputBase:2 inputDigits:inputDigits outputBase:1]);
}

- (void)testFirstBaseIsZero {
    NSArray<NSNumber *> *inputDigits = @[];
    XCTAssertThrows([AllYourBase outputDigitsForInputBase:0 inputDigits:inputDigits outputBase:10]);
}

- (void)testSecondBaseIsZero {
    NSArray<NSNumber *> *inputDigits = @[@7];
    XCTAssertThrows([AllYourBase outputDigitsForInputBase:10 inputDigits:inputDigits outputBase:0]);
}

- (void)testFirstBaseIsNegative {
    NSArray<NSNumber *> *inputDigits = @[@1];
    XCTAssertThrows([AllYourBase outputDigitsForInputBase:-2 inputDigits:inputDigits outputBase:10]);
}

- (void)testSecondBaseIsNegative {
    NSArray<NSNumber *> *inputDigits = @[@1];
    XCTAssertThrows([AllYourBase outputDigitsForInputBase:2 inputDigits:inputDigits outputBase:-7]);
}

@end
