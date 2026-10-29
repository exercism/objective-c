#import <XCTest/XCTest.h>

#if __has_include("ReverseStringExample.h")
# import "ReverseStringExample.h"
#else
# import "ReverseString.h"
#endif

@interface ReverseStringTest : XCTestCase
@end

@implementation ReverseStringTest


- (void)testAnEmptyString {
    NSString *expected = @"";
    XCTAssertEqualObjects(expected, [@"" reverseString]);
}


- (void)testAWord {
    NSString *expected = @"tobor";
    XCTAssertEqualObjects(expected, [@"robot" reverseString]);
}


- (void)testACapitalizedWord {
    NSString *expected = @"nemaR";
    XCTAssertEqualObjects(expected, [@"Ramen" reverseString]);
}


- (void)testASentenceWithPunctuation {
    NSString *expected = @"!yrgnuh m'I";
    XCTAssertEqualObjects(expected, [@"I'm hungry!" reverseString]);
}


- (void)testAPalindrome {
    NSString *expected = @"racecar";
    XCTAssertEqualObjects(expected, [@"racecar" reverseString]);
}


- (void)testAnEvenSizedWord {
    NSString *expected = @"reward";
    XCTAssertEqualObjects(expected, [@"drawer" reverseString]);
}


@end
