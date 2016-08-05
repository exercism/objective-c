#import <XCTest/XCTest.h>

#if __has_include("SumOfMultiplesExample.h")
# import "SumOfMultiplesExample.h"
# else
# import "SumOfMultiples.h"
#endif

@interface SumOfMultiplesTest : XCTestCase

@end

@implementation SumOfMultiplesTest

- (void)testSumTo1 {
    NSNumber *sum = [SumOfMultiples toLimit:@1 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@0, sum);
}

- (void)testSumTo3 {
    NSNumber *sum = [SumOfMultiples toLimit:@4 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@3, sum);
}

- (void)testSumTo10 {
    NSNumber *sum = [SumOfMultiples toLimit:@10 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@23, sum);
}

- (void)testSumTo100 {
    NSNumber *sum = [SumOfMultiples toLimit:@100 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@2318, sum);
}

- (void)testSumTo1000 {
    NSNumber *sum = [SumOfMultiples toLimit:@1000 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@233168, sum);
}

- (void)testConfigurable_7_13_17_to_20 {
    NSNumber *sum = [SumOfMultiples toLimit:@20 inMultiples:@[@7, @13, @17]];
    XCTAssertEqualObjects(@51, sum);
}

- (void)testConfigurable_4_6_to_15 {
    NSNumber *sum = [SumOfMultiples toLimit:@15 inMultiples:@[@4, @6]];
    XCTAssertEqualObjects(@30, sum);
}

- (void)testConfigurable_5_6_8_to_150 {
    NSNumber *sum = [SumOfMultiples toLimit:@150 inMultiples:@[@5, @6, @8]];
    XCTAssertEqualObjects(@4419, sum);
}

- (void)testConfigurable_43_47_to_10000 {
    NSNumber *sum = [SumOfMultiples toLimit:@10000 inMultiples:@[@43, @47]];
    XCTAssertEqualObjects(@2203160, sum);
}

- (void)testConfigurable_0_to_10 {
    NSNumber *sum = [SumOfMultiples toLimit:@10 inMultiples:@[@0]];
    XCTAssertEqualObjects(@0, sum);
}

- (void)testConfigurable_0_1_to_10 {
    NSNumber *sum = [SumOfMultiples toLimit:@10 inMultiples:@[@0, @1]];
    XCTAssertEqualObjects(@45, sum);
}

@end
