#import <XCTest/XCTest.h>

#if __has_include("GrainsExample.h")
# import "GrainsExample.h"
#else
# import "Grains.h"
#endif

@interface GrainsTest : XCTestCase

@end

@implementation GrainsTest

- (void)testGrainsOnSquare1 {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(1ULL, [grains grainsAtSquareNumber:1]);
}

- (void)testGrainsOnSquare2 {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(2ULL, [grains grainsAtSquareNumber:2]);
}

- (void)testGrainsOnSquare3 {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(4ULL, [grains grainsAtSquareNumber:3]);
}

- (void)testGrainsOnSquare4 {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(8ULL, [grains grainsAtSquareNumber:4]);
}

- (void)testGrainsOnSquare16 {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(32768ULL, [grains grainsAtSquareNumber:16]);
}

- (void)testGrainsOnSquare32 {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(2147483648ULL, [grains grainsAtSquareNumber:32]);
}

- (void)testGrainsOnSquare64 {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(9223372036854775808ULL, [grains grainsAtSquareNumber:64]);
}

- (void)testSquare0IsInvalid {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(-1, [grains grainsAtSquareNumber:0]);
}

- (void)testNegativeSquareIsInvalid {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(-1, [grains grainsAtSquareNumber:-1]);
}

- (void)testSquareGreaterThan64IsInvalid {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(-1, [grains grainsAtSquareNumber:65]);
}

- (void)testReturnsTheTotalNumberOfGrainsOnTheBoard {
    Grains *grains = [[Grains alloc] init];
    XCTAssertEqual(18446744073709551615ULL, [grains grainsAtBoard]);
}

@end
