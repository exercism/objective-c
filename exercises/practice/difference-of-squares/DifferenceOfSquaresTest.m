#import <XCTest/XCTest.h>

#if __has_include("DifferenceOfSquaresExample.h")
# import "DifferenceOfSquaresExample.h"
# else
# import "DifferenceOfSquares.h"
#endif

@interface DifferenceOfSquaresTest : XCTestCase

@end

@implementation DifferenceOfSquaresTest

- (void)testSquareOfSumTo5 {
    XCTAssertEqual(225, [[[DifferenceOfSquares alloc] initWithMax:5] squareOfSum]);
}

- (void)testSumOfSquaresTo5 {
    XCTAssertEqual(55, [[[DifferenceOfSquares alloc] initWithMax:5] sumOfSquares]);
}

- (void)testDifferenceOfSquaresOfSumTo5 {
    XCTAssertEqual(170, [[[DifferenceOfSquares alloc] initWithMax:5] differenceOfSquares]);
}

- (void)testSquareOfSumTo10 {
    XCTAssertEqual(3025, [[[DifferenceOfSquares alloc] initWithMax:10] squareOfSum]);
}

- (void)testSumOfSquaresTo10 {
    XCTAssertEqual(385, [[[DifferenceOfSquares alloc] initWithMax:10] sumOfSquares]);
}

- (void)testDifferenceOfSquaresOfSumTo10 {
    XCTAssertEqual(2640, [[[DifferenceOfSquares alloc] initWithMax:10] differenceOfSquares]);
}

- (void)testSquareOfSumTo100 {
    XCTAssertEqual(25502500, [[[DifferenceOfSquares alloc] initWithMax:100] squareOfSum]);
}

- (void)testSumOfSquaresTo100 {
    XCTAssertEqual(338350, [[[DifferenceOfSquares alloc] initWithMax:100] sumOfSquares]);
}

- (void)testDifferenceOfSquaresOfSumTo100 {
    XCTAssertEqual(25164150, [[[DifferenceOfSquares alloc] initWithMax:100] differenceOfSquares]);
}

@end
