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
	int primeNo = 1;
	int expected = 2;
	int result = [NthPrime primeNo:primeNo];
	XCTAssertEqual(expected, result);
}

- (void)testSecondPrime {
	int primeNo = 2;
	int expected = 3;
	int result = [NthPrime primeNo:primeNo];
	XCTAssertEqual(expected, result);
}

- (void)testSixthPrime {
	int primeNo = 6;
	int expected = 13;
	int result = [NthPrime primeNo:primeNo];
	XCTAssertEqual(expected, result);
}

- (void)testBigPrime {
	int primeNo = 10001;
	int expected = 104743;
	int result = [NthPrime primeNo:primeNo];
	XCTAssertEqual(expected, result);
}

- (void)testZeroPrime {
	int primeNo = 0;
	int expected = 0;
	int result = [NthPrime primeNo:primeNo];
	XCTAssertEqual(expected, result);
}

@end
NS_ASSUME_NONNULL_END
