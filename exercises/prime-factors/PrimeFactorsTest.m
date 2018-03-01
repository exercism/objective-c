#import <XCTest/XCTest.h>

#if __has_include("PrimeFactorsExample.h")
#import "PrimeFactorsExample.h"
#else
#import "PrimeFactors.h"
#endif

@interface PrimeFactorsTest : XCTestCase

@end

@implementation PrimeFactorsTest

- (void)test1 {
    XCTAssertEqualObjects(@[], [PrimeFactors factorsForInteger:1]);
}

- (void)test2 {
    XCTAssertEqualObjects(@[@2], [PrimeFactors factorsForInteger:2]);
}

- (void)test3 {
    XCTAssertEqualObjects(@[@3], [PrimeFactors factorsForInteger:3]);
}

- (void)test4 {
    NSArray<NSNumber *> *expected = @[@2, @2];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:4]);
}

- (void)test6 {
    NSArray<NSNumber *> *expected = @[@2, @3];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:6]);
}

- (void)test8 {
    NSArray<NSNumber *> *expected = @[@2, @2, @2];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:8]);
}

- (void)test9 {
    NSArray<NSNumber *> *expected = @[@3, @3];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:9]);
}

- (void)test27 {
    NSArray<NSNumber *> *expected = @[@3, @3, @3];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:27]);
}

- (void)test625 {
    NSArray<NSNumber *> *expected = @[@5, @5, @5, @5];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:625]);
}

- (void)test901255 {
    NSArray<NSNumber *> *expected = @[@5, @17, @23, @461];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:901255]);
}

- (void)test93819012551 {
    NSArray<NSNumber *> *expected = @[@11, @9539, @894119];
    XCTAssertEqualObjects(expected, [PrimeFactors factorsForInteger:93819012551]);
}

@end
