#import <XCTest/XCTest.h>

#if __has_include("RomanNumeralsExample.h")
# import "RomanNumeralsExample.h"
#else
# import "RomanNumerals.h"
#endif

@interface RomanNumeralsTest : XCTestCase

@end

@implementation RomanNumeralsTest

- (void)test1IsI {
    XCTAssertEqualObjects(@"I", [RomanNumerals romanNumeralsForValue:1]);
}

- (void)test2IsIi {
    XCTAssertEqualObjects(@"II", [RomanNumerals romanNumeralsForValue:2]);
}

- (void)test3IsIii {
    XCTAssertEqualObjects(@"III", [RomanNumerals romanNumeralsForValue:3]);
}

- (void)test4IsIv {
    XCTAssertEqualObjects(@"IV", [RomanNumerals romanNumeralsForValue:4]);
}

- (void)test5IsV {
    XCTAssertEqualObjects(@"V", [RomanNumerals romanNumeralsForValue:5]);
}

- (void)test6IsVi {
    XCTAssertEqualObjects(@"VI", [RomanNumerals romanNumeralsForValue:6]);
}

- (void)test9IsIx {
    XCTAssertEqualObjects(@"IX", [RomanNumerals romanNumeralsForValue:9]);
}

- (void)test27IsXxvii {
    XCTAssertEqualObjects(@"XXVII", [RomanNumerals romanNumeralsForValue:27]);
}

- (void)test48IsXlviii {
    XCTAssertEqualObjects(@"XLVIII", [RomanNumerals romanNumeralsForValue:48]);
}

- (void)test49IsXlix {
    XCTAssertEqualObjects(@"XLIX", [RomanNumerals romanNumeralsForValue:49]);
}

- (void)test59IsLix {
    XCTAssertEqualObjects(@"LIX", [RomanNumerals romanNumeralsForValue:59]);
}

- (void)test93IsXciii {
    XCTAssertEqualObjects(@"XCIII", [RomanNumerals romanNumeralsForValue:93]);
}

- (void)test141IsCxli {
    XCTAssertEqualObjects(@"CXLI", [RomanNumerals romanNumeralsForValue:141]);
}

- (void)test163IsClxiii {
    XCTAssertEqualObjects(@"CLXIII", [RomanNumerals romanNumeralsForValue:163]);
}

- (void)test402IsCdii {
    XCTAssertEqualObjects(@"CDII", [RomanNumerals romanNumeralsForValue:402]);
}

- (void)test575IsDlxxv {
    XCTAssertEqualObjects(@"DLXXV", [RomanNumerals romanNumeralsForValue:575]);
}

- (void)test911IsCmxi {
    XCTAssertEqualObjects(@"CMXI", [RomanNumerals romanNumeralsForValue:911]);
}

- (void)test1024IsMxxiv {
    XCTAssertEqualObjects(@"MXXIV", [RomanNumerals romanNumeralsForValue:1024]);
}

- (void)test3000IsMmm {
    XCTAssertEqualObjects(@"MMM", [RomanNumerals romanNumeralsForValue:3000]);
}

@end
