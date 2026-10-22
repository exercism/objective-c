#import <XCTest/XCTest.h>

#if __has_include("EtlExample.h")
# import "EtlExample.h"
#else
# import "Etl.h"
#endif

@interface EtlTest : XCTestCase

@end

@implementation EtlTest

- (void)testSingleLetter {
    NSDictionary *input = @{ @1: @[@"A"] };
    NSDictionary *expected = @{ @"a": @1 };
    XCTAssertEqualObjects(expected, [Etl transform:input]);
}

- (void)testSingleScoreWithMultipleLetters {
    NSDictionary *input = @{ @1: @[@"A", @"E", @"I", @"O", @"U"] };
    NSDictionary *expected = @{ @"a": @1, @"e": @1, @"i": @1, @"o": @1, @"u": @1 };
    XCTAssertEqualObjects(expected, [Etl transform:input]);
}

- (void)testMultipleScoresWithMultipleLetters {
    NSDictionary *input = @{ @1: @[@"A", @"E"], @2: @[@"D", @"G"] };
    NSDictionary *expected = @{ @"a": @1, @"d": @2, @"e": @1, @"g": @2 };
    XCTAssertEqualObjects(expected, [Etl transform:input]);
}

- (void)testMultipleScoresWithDifferingNumbersOfLetters {
    NSDictionary *input = @{ @1: @[@"A", @"E", @"I", @"O", @"U", @"L", @"N", @"R", @"S", @"T"], @2: @[@"D", @"G"], @3: @[@"B", @"C", @"M", @"P"], @4: @[@"F", @"H", @"V", @"W", @"Y"], @5: @[@"K"], @8: @[@"J", @"X"], @10: @[@"Q", @"Z"] };
    NSDictionary *expected = @{ @"a": @1, @"b": @3, @"c": @3, @"d": @2, @"e": @1, @"f": @4, @"g": @2, @"h": @4, @"i": @1, @"j": @8, @"k": @5, @"l": @1, @"m": @3, @"n": @1, @"o": @1, @"p": @3, @"q": @10, @"r": @1, @"s": @1, @"t": @1, @"u": @1, @"v": @4, @"w": @4, @"x": @8, @"y": @4, @"z": @10 };
    XCTAssertEqualObjects(expected, [Etl transform:input]);
}

@end
