#import <XCTest/XCTest.h>

#if __has_include("PrimeFactorsExample.h")
# import "PrimeFactorsExample.h"
#else
# import "PrimeFactors.h"
#endif

@interface PrimeFactorsTest : XCTestCase

@end

@implementation PrimeFactorsTest

- (void)testNoFactors {
    NSArray<NSNumber *> *expected = @[];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:1]);
}

- (void)testPrimeNumber {
    NSArray<NSNumber *> *expected = @[@2];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:2]);
}

- (void)testAnotherPrimeNumber {
    NSArray<NSNumber *> *expected = @[@3];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:3]);
}

- (void)testSquareOfAPrime {
    NSArray<NSNumber *> *expected = @[@3, @3];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:9]);
}

- (void)testProductOfFirstPrime {
    NSArray<NSNumber *> *expected = @[@2, @2];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:4]);
}

- (void)testCubeOfAPrime {
    NSArray<NSNumber *> *expected = @[@2, @2, @2];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:8]);
}

- (void)testProductOfSecondPrime {
    NSArray<NSNumber *> *expected = @[@3, @3, @3];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:27]);
}

- (void)testProductOfThirdPrime {
    NSArray<NSNumber *> *expected = @[@5, @5, @5, @5];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:625]);
}

- (void)testProductOfFirstAndSecondPrime {
    NSArray<NSNumber *> *expected = @[@2, @3];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:6]);
}

- (void)testProductOfPrimesAndNonPrimes {
    NSArray<NSNumber *> *expected = @[@2, @2, @3];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:12]);
}

- (void)testProductOfPrimes {
    NSArray<NSNumber *> *expected = @[@5, @17, @23, @461];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:901255]);
}

- (void)testFactorsIncludeALargePrime {
    NSArray<NSNumber *> *expected = @[@11, @9539, @894119];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:93819012551]);
}

@end
