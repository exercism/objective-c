#import <XCTest/XCTest.h>

#if __has_include("GrainsExample.h")
# import "GrainsExample.h"
# else
# import "Grains.h"
#endif


NS_ASSUME_NONNULL_BEGIN

@interface GrainsTest : XCTestCase

@end

@implementation GrainsTest

- (void)testNumberOfGrainsOnSquare1 {
    long long expected = 1;
    long long result = [[[Grains alloc]init]grainsAtSquareNumber:1];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquare2 {
    long long expected = 2;
    long long result = [[[Grains alloc]init]grainsAtSquareNumber:2];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquare3 {
    unsigned long long expected = 4;
    unsigned long long result = [[[Grains alloc]init]grainsAtSquareNumber:3];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquare4 {
    unsigned long long expected = 8;
    unsigned long long result = [[[Grains alloc]init]grainsAtSquareNumber:4];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquare16 {
    unsigned long long expected = 32768;
    unsigned long long result = [[[Grains alloc]init]grainsAtSquareNumber:16];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquare32 {
    unsigned long long expected = 2147483648;
    unsigned long long result = [[[Grains alloc]init]grainsAtSquareNumber:32];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquare64 {
    unsigned long long expected = 9223372036854775808;
    unsigned long long result = [[[Grains alloc]init]grainsAtSquareNumber:64];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquare65 {
    unsigned long long expected = -1;
    unsigned long long result = [[[Grains alloc]init]grainsAtSquareNumber:65];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquareNeg1 {
    unsigned long long expected = -1;
    unsigned long long result = [[[Grains alloc]init]grainsAtSquareNumber:-1];
    XCTAssertEqual(expected,result);
}

- (void)testNumberOfGrainsOnSquare0 {
    unsigned long long expected = -1;
    unsigned long long result = [[[Grains alloc]init]grainsAtSquareNumber:0];
    XCTAssertEqual(expected,result);
}

- (void)testTotalNumberOfGrains {
    unsigned long long expected = 18446744073709551615;
    unsigned long long result = [[[Grains alloc]init]grainsAtBoard];
    XCTAssertEqual(expected,result);
}

@end
NS_ASSUME_NONNULL_END
