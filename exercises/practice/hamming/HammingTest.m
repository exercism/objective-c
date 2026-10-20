#import <XCTest/XCTest.h>

#if __has_include("HammingExample.h")
# import "HammingExample.h"
# else
# import "Hamming.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HammingTest : XCTestCase

@end

@implementation HammingTest

- (void)testEmptyStrands {
    NSUInteger result = [Hamming compute:@"" against:@""];
    NSUInteger expected = 0;
    XCTAssertEqual(expected, result);
}

- (void)testSingleLetterIdenticalStrands {
    NSUInteger result = [Hamming compute:@"A" against:@"A"];
    NSUInteger expected = 0;
    XCTAssertEqual(expected, result);
}

- (void)testSingleLetterDifferentStrands {
    NSUInteger result = [Hamming compute:@"G" against:@"T"];
    NSUInteger expected = 1;
    XCTAssertEqual(expected, result);
}

- (void)testLongIdenticalStrands {
    NSUInteger result = [Hamming compute:@"GGACTGAAATCTG" against:@"GGACTGAAATCTG"];
    NSUInteger expected = 0;
    XCTAssertEqual(expected, result);
}

- (void)testLongDifferentStrands {
    NSUInteger result = [Hamming compute:@"GGACGGATTCTG" against:@"AGGACGGATTCT"];
    NSUInteger expected = 9;
    XCTAssertEqual(expected, result);
}

@end
NS_ASSUME_NONNULL_END
