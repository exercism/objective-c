#import <XCTest/XCTest.h>

#if __has_include("PhoneNumberExample.h")
# import "PhoneNumberExample.h"
#else
# import "PhoneNumber.h"
#endif

@interface PhoneNumberTest : XCTestCase

@end

@implementation PhoneNumberTest

- (void)testCleansTheNumber {
    NSString *startingNumber = @"(223) 456-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertEqualObjects(@"2234567890", [phoneNumber number]);
}

- (void)testCleansNumbersWithDots {
    NSString *startingNumber = @"223.456.7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertEqualObjects(@"2234567890", [phoneNumber number]);
}

- (void)testCleansNumbersWithMultipleSpaces {
    NSString *startingNumber = @"223 456   7890   ";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertEqualObjects(@"2234567890", [phoneNumber number]);
}

- (void)testInvalidWhen9Digits {
    NSString *startingNumber = @"123456789";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidWhen11DigitsDoesNotStartWithA1 {
    NSString *startingNumber = @"22234567890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testValidWhen11DigitsAndStartingWith1 {
    NSString *startingNumber = @"12234567890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertEqualObjects(@"2234567890", [phoneNumber number]);
}

- (void)testValidWhen11DigitsAndStartingWith1EvenWithPunctuation {
    NSString *startingNumber = @"+1 (223) 456-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertEqualObjects(@"2234567890", [phoneNumber number]);
}

- (void)testInvalidWhenMoreThan11Digits {
    NSString *startingNumber = @"321234567890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidWithLetters {
    NSString *startingNumber = @"523-abc-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidWithPunctuations {
    NSString *startingNumber = @"523-@:!-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidIfAreaCodeStartsWith0 {
    NSString *startingNumber = @"(023) 456-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidIfAreaCodeStartsWith1 {
    NSString *startingNumber = @"(123) 456-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidIfExchangeCodeStartsWith0 {
    NSString *startingNumber = @"(223) 056-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidIfExchangeCodeStartsWith1 {
    NSString *startingNumber = @"(223) 156-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidIfAreaCodeStartsWith0OnValid11DigitNumber {
    NSString *startingNumber = @"1 (023) 456-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidIfAreaCodeStartsWith1OnValid11DigitNumber {
    NSString *startingNumber = @"1 (123) 456-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidIfExchangeCodeStartsWith0OnValid11DigitNumber {
    NSString *startingNumber = @"1 (223) 056-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

- (void)testInvalidIfExchangeCodeStartsWith1OnValid11DigitNumber {
    NSString *startingNumber = @"1 (223) 156-7890";
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithString:startingNumber];
    XCTAssertThrows([phoneNumber number]);
}

@end
