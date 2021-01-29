#import <XCTest/XCTest.h>

#if __has_include("LuhnExample.h")
# import "LuhnExample.h"
# else
# import "Luhn.h"
#endif

@interface LuhnTest : XCTestCase

@end

@implementation LuhnTest

- (void)testSingleDigitStringNotValid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"1"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testSingleZeroInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"0"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testSimpleValidSINRemainsValidIfReversed {
    Luhn *luhn = [[Luhn alloc] initWithString:@"059"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testSimpleValidSINInvalidIfReversed {
    Luhn *luhn = [[Luhn alloc] initWithString:@"59"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testValidCanadianSIN {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055 444 285"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testInvalidCanadianSIN {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055 444 286"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testInvalidCreditCard {
    Luhn *luhn = [[Luhn alloc] initWithString:@"8273 1232 7352 0569"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testValidStringsWithANonDigitInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055a 444 285"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testValidStringsWithPunctuationInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055-444-285"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testValidStringWithSymbolsInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"055£ 444$ 285"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testSingleZeroWithSpaceInvalid {
    Luhn *luhn = [[Luhn alloc] initWithString:@" 0"];
    XCTAssertFalse(luhn.isValid);
}

- (void)testMoreThanOneZeroValid {
    Luhn *luhn = [[Luhn alloc] initWithString:@"0000 0"];
    XCTAssertTrue(luhn.isValid);
}

- (void)testInputDigit9CorrectConverted {
    Luhn *luhn = [[Luhn alloc] initWithString:@"091"];
    XCTAssertTrue(luhn.isValid);
}

@end
