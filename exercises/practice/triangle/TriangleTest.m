#import <XCTest/XCTest.h>

#if __has_include("TriangleExample.h")
# import "TriangleExample.h"
# else
# import "Triangle.h"
#endif

@interface TriangleTest : XCTestCase

@end

@implementation TriangleTest

- (void)testEquilateralTrianglesHaveEqualSides {
    XCTAssertEqual(TriangleKindEquilateral, [Triangle kindForSides:2 :2 :2]);
}

- (void)testLargerEquilateralTrianglesAlsoHaveEqualSides {
    XCTAssertEqual(TriangleKindEquilateral, [Triangle kindForSides:10 :10 :10]);
}

- (void)testIsoscelesTrianglesHaveLastTwoSidesEqual {
    XCTAssertEqual(TriangleKindIsosceles, [Triangle kindForSides:3 :4 :4]);
}

- (void)testIsoscelesTrianglesHaveFirstAndLastSidesEqual {
    XCTAssertEqual(TriangleKindIsosceles, [Triangle kindForSides:4 :3 :4]);
}

- (void)testIsoscelesTrianglesHaveTwoFirstSidesEqual {
    XCTAssertEqual(TriangleKindIsosceles, [Triangle kindForSides:4 :4 :3]);
}

- (void)testIsoscelesTrianglesHaveInFactExactlyTwoSidesEqual {
    XCTAssertEqual(TriangleKindIsosceles, [Triangle kindForSides:10 :10 :2]);
}

- (void)testScaleneTrianglesHaveNoEqualSides {
    XCTAssertEqual(TriangleKindScalene, [Triangle kindForSides:3 :4 :5]);
}

- (void)testScaleneTrianglesHaveNoEqualSidesAtALargerScaleToo {
    XCTAssertEqual(TriangleKindScalene, [Triangle kindForSides:10 :11 :12]);
}

- (void)testScaleneTrianglesHaveNoEqualSidesInDescendingOrderEither {
    XCTAssertEqual(TriangleKindScalene, [Triangle kindForSides:5 :4 :2]);
}

- (void)testVerySmallTrianglesAreLegal {
    XCTAssertEqual(TriangleKindScalene, [Triangle kindForSides:0.4 :0.6 :0.3]);
}

- (void)testTrianglesWithNoSizeAreIllegal {
    XCTAssertThrows([Triangle kindForSides:0 :0 :0]);
}

- (void)testTrianglesWithNegativeSidesAreIllegal {
    XCTAssertThrows([Triangle kindForSides:3 :4 :-5]);
}

- (void)testTrianglesViolatingTriangleInequalityAreIllegal {
    XCTAssertThrows([Triangle kindForSides:1 :1 :3]);
}

- (void)testTrianglesViolatingTriangleInequalityAreIllegal3 {
    XCTAssertThrows([Triangle kindForSides:7 :3 :2]);
}

@end