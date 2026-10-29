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
    XCTAssertEqualObjects(@"", [@"" reverseString]);
}


- (void)testAWord {
    XCTAssertEqualObjects(@"tobor", [@"robot" reverseString]);
}


- (void)testACapitalizedWord {
    XCTAssertEqualObjects(@"nemaR", [@"Ramen" reverseString]);
}


- (void)testASentenceWithPunctuation {
    XCTAssertEqualObjects(@"!yrgnuh m'I", [@"I'm hungry!" reverseString]);
}


- (void)testAPalindrome {
    XCTAssertEqualObjects(@"racecar", [@"racecar" reverseString]);
}


- (void)testAnEvenSizedWord {
    XCTAssertEqualObjects(@"reward", [@"drawer" reverseString]);
}


@end
