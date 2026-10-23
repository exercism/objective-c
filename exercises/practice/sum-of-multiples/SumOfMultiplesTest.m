#import <XCTest/XCTest.h>

#if __has_include("SumOfMultiplesExample.h")
# import "SumOfMultiplesExample.h"
#else
# import "SumOfMultiples.h"
#endif

@interface SumOfMultiplesTest : XCTestCase

@end

@implementation SumOfMultiplesTest

- (void)testNoMultiplesWithinLimit {
    NSNumber *sum = [SumOfMultiples toLimit:@1 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@0, sum);
}

- (void)testOneFactorHasMultiplesWithinLimit {
    NSNumber *sum = [SumOfMultiples toLimit:@4 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@3, sum);
}

- (void)testMoreThanOneMultipleWithinLimit {
    NSNumber *sum = [SumOfMultiples toLimit:@7 inMultiples:@[@3]];
    XCTAssertEqualObjects(@9, sum);
}

- (void)testMoreThanOneFactorWithMultiplesWithinLimit {
    NSNumber *sum = [SumOfMultiples toLimit:@10 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@23, sum);
}

- (void)testEachMultipleIsOnlyCountedOnce {
    NSNumber *sum = [SumOfMultiples toLimit:@100 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@2318, sum);
}

- (void)testAMuchLargerLimit {
    NSNumber *sum = [SumOfMultiples toLimit:@1000 inMultiples:@[@3, @5]];
    XCTAssertEqualObjects(@233168, sum);
}

- (void)testThreeFactors {
    NSNumber *sum = [SumOfMultiples toLimit:@20 inMultiples:@[@7, @13, @17]];
    XCTAssertEqualObjects(@51, sum);
}

- (void)testFactorsNotRelativelyPrime {
    NSNumber *sum = [SumOfMultiples toLimit:@15 inMultiples:@[@4, @6]];
    XCTAssertEqualObjects(@30, sum);
}

- (void)testSomePairsOfFactorsRelativelyPrimeAndSomeNot {
    NSNumber *sum = [SumOfMultiples toLimit:@150 inMultiples:@[@5, @6, @8]];
    XCTAssertEqualObjects(@4419, sum);
}

- (void)testOneFactorIsAMultipleOfAnother {
    NSNumber *sum = [SumOfMultiples toLimit:@51 inMultiples:@[@5, @25]];
    XCTAssertEqualObjects(@275, sum);
}

- (void)testMuchLargerFactors {
    NSNumber *sum = [SumOfMultiples toLimit:@10000 inMultiples:@[@43, @47]];
    XCTAssertEqualObjects(@2203160, sum);
}

- (void)testAllNumbersAreMultiplesOf1 {
    NSNumber *sum = [SumOfMultiples toLimit:@100 inMultiples:@[@1]];
    XCTAssertEqualObjects(@4950, sum);
}

- (void)testNoFactorsMeansAnEmptySum {
    NSNumber *sum = [SumOfMultiples toLimit:@10000 inMultiples:@[]];
    XCTAssertEqualObjects(@0, sum);
}

- (void)testTheOnlyMultipleOf0Is0 {
    NSNumber *sum = [SumOfMultiples toLimit:@1 inMultiples:@[@0]];
    XCTAssertEqualObjects(@0, sum);
}

- (void)testTheFactor0DoesNotAffectTheSumOfMultiplesOfOtherFactors {
    NSNumber *sum = [SumOfMultiples toLimit:@4 inMultiples:@[@3, @0]];
    XCTAssertEqualObjects(@3, sum);
}

- (void)testSolutionsUsingIncludeExcludeMustExtendToCardinalityGreaterThan3 {
    NSNumber *sum = [SumOfMultiples toLimit:@10000 inMultiples:@[@2, @3, @5, @7, @11]];
    XCTAssertEqualObjects(@39614537, sum);
}

@end
