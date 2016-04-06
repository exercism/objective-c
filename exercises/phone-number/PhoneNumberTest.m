#import <XCTest/XCTest.h>
#if __has_include("PhoneNumber.h")
# import "PhoneNumber.h"
# else
# import "PhoneNumberExample.h"
#endif


@interface PhoneNumberTest : XCTestCase

@end

@implementation PhoneNumberTest

- (void)testCleansNumber {
  NSString *startingNumber = @"(123) 456-7890";
  NSString *expected = @"1234567890";
  PhoneNumber *number = [[PhoneNumber alloc] initWithString:startingNumber];
  NSString *result = [number number];
  XCTAssertEqualObjects(result, expected);
}

- (void)testCleansNumberWithDots {
  NSString *startingNumber = @"123.456.7890";
  NSString *expected = @"1234567890";
  PhoneNumber *number = [[PhoneNumber alloc] initWithString:startingNumber];
  NSString *result = [number number];
  XCTAssertEqualObjects(result, expected);
}

- (void)testValidWithElevenDigitsAndFirstIsOne {
  NSString *startingNumber = @"11234567890";
  NSString *expected = @"1234567890";
  PhoneNumber *number = [[PhoneNumber alloc] initWithString:startingNumber];
  NSString *result = [number number];
  XCTAssertEqualObjects(result, expected);
}

- (void)testInvalidWhenElevenDigits {
  NSString *startingNumber = @"21234567890";
  NSString *expected = @"0000000000";
  PhoneNumber *number = [[PhoneNumber alloc] initWithString:startingNumber];
  NSString *result = [number number];
  XCTAssertEqualObjects(result, expected);
}

- (void)testInvalidWhenNineDigits {
  NSString *startingNumber = @"123456789";
  NSString *expected = @"0000000000";
  PhoneNumber *number = [[PhoneNumber alloc] initWithString:startingNumber];
  NSString *result = [number number];
  XCTAssertEqualObjects(result, expected);
}

- (void)testAreaCode {
  NSString *startingNumber = @"1234567890";
  NSString *expected = @"123";
  PhoneNumber *number = [[PhoneNumber alloc] initWithString:startingNumber];
  NSString *result = [number areaCode];
  XCTAssertEqualObjects(result, expected);
}

- (void)testPrettyPrint {
  NSString *startingNumber = @"1234567890";
  NSString *expected = @"(123) 456-7890";
  PhoneNumber *number = [[PhoneNumber alloc] initWithString:startingNumber];
  NSString *result = [number description];
  XCTAssertEqualObjects(result, expected);
}

- (void)testPrettyPrintWithFullUSPhoneNumber {
  NSString *startingNumber = @"11234567890";
  NSString *expected = @"(123) 456-7890";
  PhoneNumber *number = [[PhoneNumber alloc] initWithString:startingNumber];
  NSString *result = [number description];
  XCTAssertEqualObjects(result, expected);
}

@end