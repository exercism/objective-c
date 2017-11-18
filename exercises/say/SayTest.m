#import <XCTest/XCTest.h>

#if __has_include("SayExample.h")
# import "SayExample.h"
#else
# import "Say.h"
#endif

@interface SayTest : XCTestCase

@end

@implementation SayTest

- (void)testZero {
    XCTAssertEqualObjects(@"zero", [Say say:0]);
}

- (void)testOne {
    XCTAssertEqualObjects(@"one", [Say say:1]);
}

- (void)testFourteen {
    XCTAssertEqualObjects(@"fourteen", [Say say:14]);
}

- (void)testTwenty {
    XCTAssertEqualObjects(@"twenty", [Say say:20]);
}

- (void)testTwentyTwo {
    XCTAssertEqualObjects(@"twenty-two", [Say say:22]);
}

- (void)testOneHundred {
    XCTAssertEqualObjects(@"one hundred", [Say say:100]);
}

- (void)testOneHundredTwentyThree {
    XCTAssertEqualObjects(@"one hundred twenty-three", [Say say:123]);
}

- (void)testOneThousand {
    XCTAssertEqualObjects(@"one thousand", [Say say:1000]);
}

- (void)testOneThousandTwoHundredThirtyFour {
    XCTAssertEqualObjects(@"one thousand two hundred thirty-four", [Say say:1234]);
}

- (void)testOneMillion {
    XCTAssertEqualObjects(@"one million", [Say say:1000000]);
}

- (void)testOneMillionTwoThousandThreeHundredFortyFive {
    XCTAssertEqualObjects(@"one million two thousand three hundred forty-five", [Say say:1002345]);
}

- (void)testOneBillion {
    XCTAssertEqualObjects(@"one billion", [Say say:1000000000]);
}

- (void)testABigNumber {
    XCTAssertEqualObjects(@"nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three", [Say say:987654321123]);
}

- (void)testNumbersBelowZeroAreOutOfRange {
    XCTAssertNil([Say say:-1]);
}

- (void)testNumbersAbove999999999999AreOutOfRange {
    XCTAssertNil([Say say:1000000000000]);
}

@end
