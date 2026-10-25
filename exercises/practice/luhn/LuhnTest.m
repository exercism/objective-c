#import <XCTest/XCTest.h>

#if __has_include("LuhnExample.h")
# import "LuhnExample.h"
#else
# import "Luhn.h"
#endif

@interface LuhnTest : XCTestCase

@end

@implementation LuhnTest

- (void)testSingleDigitStringsCanNotBeValid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"1"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testASingleZeroIsInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"0"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testASimpleValidSinThatRemainsValidIfReversed {
    Luhn *luhn = [[Luhn alloc] initWithString:@"059"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testASimpleValidSinThatBecomesInvalidIfReversed {
    Luhn *luhn = [[Luhn alloc] initWithString:@"59"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testAValidCanadianSin {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055 444 285"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testInvalidCanadianSin {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055 444 286"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testInvalidCreditCard {
    Luhn *luhn = [[Luhn alloc] initWithString:@"8273 1232 7352 0569"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testInvalidLongNumberWithAnEvenRemainder {
    Luhn *luhn = [[Luhn alloc] initWithString:@"1 2345 6789 1234 5678 9012"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testInvalidLongNumberWithARemainderDivisibleBy5 {
    Luhn *luhn = [[Luhn alloc] initWithString:@"1 2345 6789 1234 5678 9013"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testValidNumberWithAnEvenNumberOfDigits {
    Luhn *luhn = [[Luhn alloc] initWithString:@"095 245 88"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testValidNumberWithAnOddNumberOfSpaces {
    Luhn *luhn = [[Luhn alloc] initWithString:@"234 567 891 234"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testValidStringsWithANonDigitAddedAtTheEndBecomeInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"059a"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testValidStringsWithPunctuationIncludedBecomeInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055-444-285"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testValidStringsWithSymbolsIncludedBecomeInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055# 444$ 285"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testSingleZeroWithSpaceIsInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@" 0"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testMoreThanASingleZeroIsValid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"0000 0"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testInputDigit9IsCorrectlyConvertedToOutputDigit9 {
    Luhn *luhn = [[Luhn alloc] initWithString:@"091"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testVeryLongInputIsValid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"9999999999 9999999999 9999999999 9999999999"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testValidLuhnWithAnOddNumberOfDigitsAndNonZeroFirstDigit {
    Luhn *luhn = [[Luhn alloc] initWithString:@"109"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testUsingAsciiValueForNonDoubledNonDigitIsnTAllowed {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055b 444 285"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testUsingAsciiValueForDoubledNonDigitIsnTAllowed {
    Luhn *luhn = [[Luhn alloc] initWithString:@":9"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testNonNumericNonSpaceCharInTheMiddleWithASumThatSDivisibleBy10IsnTAllowed {
    Luhn *luhn = [[Luhn alloc] initWithString:@"59%59"];
    XCTAssertFalse(luhn.isValid);
}

@end
