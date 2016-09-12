#import <XCTest/XCTest.h>

#if __has_include("RomanNumeralsExample.h")
# import "RomanNumeralsExample.h"
# else
# import "RomanNumerals.h"
#endif

@interface RomanNumeralsTest : XCTestCase

@end

@implementation RomanNumeralsTest

- (void)test1 {
    XCTAssertEqualObjects(@"I", [RomanNumerals romanNumeralsForValue:1]);
}

- (void)test2 {
    XCTAssertEqualObjects(@"II", [RomanNumerals romanNumeralsForValue:2]);
}

- (void)test3 {
    XCTAssertEqualObjects(@"III", [RomanNumerals romanNumeralsForValue:3]);
}

- (void)test4 {
    XCTAssertEqualObjects(@"IV", [RomanNumerals romanNumeralsForValue:4]);
}

- (void)test5 {
    XCTAssertEqualObjects(@"V", [RomanNumerals romanNumeralsForValue:5]);
}

- (void)test6 {
    XCTAssertEqualObjects(@"VI", [RomanNumerals romanNumeralsForValue:6]);
}

- (void)test9 {
    XCTAssertEqualObjects(@"IX", [RomanNumerals romanNumeralsForValue:9]);
}

- (void)test27 {
    XCTAssertEqualObjects(@"XXVII", [RomanNumerals romanNumeralsForValue:27]);
}

- (void)test48 {
    XCTAssertEqualObjects(@"XLVIII", [RomanNumerals romanNumeralsForValue:48]);
}

- (void)test59 {
    XCTAssertEqualObjects(@"LIX", [RomanNumerals romanNumeralsForValue:59]);
}

- (void)test93 {
    XCTAssertEqualObjects(@"XCIII", [RomanNumerals romanNumeralsForValue:93]);
}

- (void)test141 {
    XCTAssertEqualObjects(@"CXLI", [RomanNumerals romanNumeralsForValue:141]);
}

- (void)test163 {
    XCTAssertEqualObjects(@"CLXIII", [RomanNumerals romanNumeralsForValue:163]);
}

- (void)test402 {
    XCTAssertEqualObjects(@"CDII", [RomanNumerals romanNumeralsForValue:402]);
}

- (void)test575 {
    XCTAssertEqualObjects(@"DLXXV", [RomanNumerals romanNumeralsForValue:575]);
}

- (void)test911 {
    XCTAssertEqualObjects(@"CMXI", [RomanNumerals romanNumeralsForValue:911]);
}

- (void)test1024 {
    XCTAssertEqualObjects(@"MXXIV", [RomanNumerals romanNumeralsForValue:1024]);
}

- (void)test3000 {
    XCTAssertEqualObjects(@"MMM", [RomanNumerals romanNumeralsForValue:3000]);
}

@end
