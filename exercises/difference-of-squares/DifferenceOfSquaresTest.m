#import <XCTest/XCTest.h>

#if __has_include("DifferenceOfSquaresExample.h")
# import "DifferenceOfSquaresExample.h"
# else
# import "DifferenceOfSquares.h"
#endif

@interface DifferenceOfSquaresTest : XCTestCase

@end

@implementation DifferenceOfSquaresTest

- (void)testSquareOfSumsTo5 {
    XCTAssertEqual(225, [[[DifferenceOfSquares alloc] initWithMax:5] squareOfSums]);
}

- (void)testSumOfSquaresTo5 {
    XCTAssertEqual(55, [[[DifferenceOfSquares alloc] initWithMax:5] sumOfSquares]);
}

- (void)testDifferenceOfSquaresOfSumsTo5 {
    XCTAssertEqual(170, [[[DifferenceOfSquares alloc] initWithMax:5] differenceOfSquares]);
}

- (void)testSquareOfSumsTo10 {
    XCTAssertEqual(3025, [[[DifferenceOfSquares alloc] initWithMax:10] squareOfSums]);
}

- (void)testSumOfSquaresTo10 {
    XCTAssertEqual(385, [[[DifferenceOfSquares alloc] initWithMax:10] sumOfSquares]);
}

- (void)testDifferenceOfSquaresOfSumsTo10 {
    XCTAssertEqual(2640, [[[DifferenceOfSquares alloc] initWithMax:10] differenceOfSquares]);
}

- (void)testSquareOfSumsTo100 {
    XCTAssertEqual(25502500, [[[DifferenceOfSquares alloc] initWithMax:100] squareOfSums]);
}

- (void)testSumOfSquaresTo100 {
    XCTAssertEqual(338350, [[[DifferenceOfSquares alloc] initWithMax:100] sumOfSquares]);
}

- (void)testDifferenceOfSquaresOfSumsTo100 {
    XCTAssertEqual(25164150, [[[DifferenceOfSquares alloc] initWithMax:100] differenceOfSquares]);
}

@end
