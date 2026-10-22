#import <XCTest/XCTest.h>

#if __has_include("DifferenceOfSquaresExample.h")
# import "DifferenceOfSquaresExample.h"
#else
# import "DifferenceOfSquares.h"
#endif

@interface DifferenceOfSquaresTest : XCTestCase

@end

@implementation DifferenceOfSquaresTest

- (void)testSquareOfSum1 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:1];
    XCTAssertEqual(1, [difference squareOfSum]);
}

- (void)testSquareOfSum5 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:5];
    XCTAssertEqual(225, [difference squareOfSum]);
}

- (void)testSquareOfSum100 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:100];
    XCTAssertEqual(25502500, [difference squareOfSum]);
}

- (void)testSumOfSquares1 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:1];
    XCTAssertEqual(1, [difference sumOfSquares]);
}

- (void)testSumOfSquares5 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:5];
    XCTAssertEqual(55, [difference sumOfSquares]);
}

- (void)testSumOfSquares100 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:100];
    XCTAssertEqual(338350, [difference sumOfSquares]);
}

- (void)testDifferenceOfSquares1 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:1];
    XCTAssertEqual(0, [difference differenceOfSquares]);
}

- (void)testDifferenceOfSquares5 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:5];
    XCTAssertEqual(170, [difference differenceOfSquares]);
}

- (void)testDifferenceOfSquares100 {
    DifferenceOfSquares *difference = [[DifferenceOfSquares alloc] initWithMax:100];
    XCTAssertEqual(25164150, [difference differenceOfSquares]);
}

@end
