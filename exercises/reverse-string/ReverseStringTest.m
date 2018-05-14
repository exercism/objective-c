#import <XCTest/XCTest.h>

#if __has_include("ReverseStringExample.h")
# import "ReverseStringExample.h"
# else
# import "ReverseString.h"
#endif

@interface ReverseStringTest : XCTestCase

@end

@implementation ReverseStringTest

-(void)testReverseEmptyString {
    
    NSString *inputString = [NSString string];
    NSString *expectedOutput = [NSString string];
    XCTAssertEqualObjects(expectedOutput, [inputString reverseString]);
}

-(void)testReverseWord {
    
    NSString *inputString = @"robot";
    NSString *expectedOutput = @"tobor";
    XCTAssertEqualObjects(expectedOutput,[inputString reverseString]);
}

-(void)testReverseCapitalisedWord {
    
    NSString *inputString = @"Ramen";
    NSString *expectedOutput = @"nemaR";
    XCTAssertEqualObjects(expectedOutput, [inputString reverseString]);
    
}

-(void)testReverseSentenceWithPunctuation {
    
    NSString *inputString = @"I'm hungry!";
    NSString *expectedOutput = @"!yrgnuh m'I";
    XCTAssertEqualObjects(expectedOutput, [inputString reverseString]);
}

-(void)testReversePalindrome {
    
    NSString *inputString = @"racecar";
    NSString *expectedOutput = @"racecar";
    XCTAssertEqualObjects(expectedOutput, [inputString reverseString]);
}

@end
