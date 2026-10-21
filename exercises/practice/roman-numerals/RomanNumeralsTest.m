#import <XCTest/XCTest.h>

#if __has_include("RomanNumeralsExample.h")
# import "RomanNumeralsExample.h"
#else
# import "RomanNumerals.h"
#endif

@interface RomanNumeralsTest : XCTestCase

@end

@implementation RomanNumeralsTest

- (void)test1isI {
    XCTAssertEqualObjects(@"I", [RomanNumerals romanNumeralsForValue:1]);
}

- (void)test2isII {
    XCTAssertEqualObjects(@"II", [RomanNumerals romanNumeralsForValue:2]);
}

- (void)test3isIII {
    XCTAssertEqualObjects(@"III", [RomanNumerals romanNumeralsForValue:3]);
}

- (void)test4isIV {
    XCTAssertEqualObjects(@"IV", [RomanNumerals romanNumeralsForValue:4]);
}

- (void)test5isV {
    XCTAssertEqualObjects(@"V", [RomanNumerals romanNumeralsForValue:5]);
}

- (void)test6isVI {
    XCTAssertEqualObjects(@"VI", [RomanNumerals romanNumeralsForValue:6]);
}

- (void)test9isIX {
    XCTAssertEqualObjects(@"IX", [RomanNumerals romanNumeralsForValue:9]);
}

- (void)test27isXXVII {
    XCTAssertEqualObjects(@"XXVII", [RomanNumerals romanNumeralsForValue:27]);
}

- (void)test48isXLVIII {
    XCTAssertEqualObjects(@"XLVIII", [RomanNumerals romanNumeralsForValue:48]);
}

- (void)test49isXLIX {
    XCTAssertEqualObjects(@"XLIX", [RomanNumerals romanNumeralsForValue:49]);
}

- (void)test59isLIX {
    XCTAssertEqualObjects(@"LIX", [RomanNumerals romanNumeralsForValue:59]);
}

- (void)test93isXCIII {
    XCTAssertEqualObjects(@"XCIII", [RomanNumerals romanNumeralsForValue:93]);
}

- (void)test141isCXLI {
    XCTAssertEqualObjects(@"CXLI", [RomanNumerals romanNumeralsForValue:141]);
}

- (void)test163isCLXIII {
    XCTAssertEqualObjects(@"CLXIII", [RomanNumerals romanNumeralsForValue:163]);
}

- (void)test402isCDII {
    XCTAssertEqualObjects(@"CDII", [RomanNumerals romanNumeralsForValue:402]);
}

- (void)test575isDLXXV {
    XCTAssertEqualObjects(@"DLXXV", [RomanNumerals romanNumeralsForValue:575]);
}

- (void)test911isCMXI {
    XCTAssertEqualObjects(@"CMXI", [RomanNumerals romanNumeralsForValue:911]);
}

- (void)test1024isMXXIV {
    XCTAssertEqualObjects(@"MXXIV", [RomanNumerals romanNumeralsForValue:1024]);
}

- (void)test3000isMMM {
    XCTAssertEqualObjects(@"MMM", [RomanNumerals romanNumeralsForValue:3000]);
}

@end
