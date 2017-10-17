#import <XCTest/XCTest.h>

#if __has_include("BobExample.h")
# import "NthPrimeExample.h"
#else
# import "NthPrime.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NthPrimeTest : XCTestCase

@end

@implementation NthPrimeTest

- (void)testFirstPrime {
	int primeNum = 1;
	int expected = 2;
	int result = [NthPrime primeNum:primeNum];
	XCTAssertEqual(expected, result);
}

- (void)testSecondPrime {
	int primeNum = 2;
	int expected = 3;
	int result = [NthPrime primeNum:primeNum];
	XCTAssertEqual(expected, result);
}

- (void)testSixthPrime {
	int primeNum = 6;
	int expected = 13;
	int result = [NthPrime primeNum:primeNum];
	XCTAssertEqual(expected, result);
}

- (void)testBigPrime {
	int primeNum = 10001;
	int expected = 104743;
	int result = [NthPrime primeNum:primeNum];
	XCTAssertEqual(expected, result);
}

- (void)testZeroPrime {
	int primeNum = 0;
	int expected = 0;
	int result = [NthPrime primeNum:primeNum];
	XCTAssertEqual(expected, result);
}

@end
NS_ASSUME_NONNULL_END
