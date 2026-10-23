#import <XCTest/XCTest.h>

#if __has_include("TriangleExample.h")
# import "TriangleExample.h"
#else
# import "Triangle.h"
#endif

@interface TriangleTest : XCTestCase

@end

@implementation TriangleTest

- (void)testEquilateralAllSidesAreEqual {
    XCTAssertEqual(TriangleKindEquilateral, [Triangle kindForSides:2 :2 :2]);
}

- (void)testEquilateralAnySideIsUnequal {
    XCTAssertNotEqual(TriangleKindEquilateral, [Triangle kindForSides:2 :3 :2]);
}

- (void)testEquilateralNoSidesAreEqual {
    XCTAssertNotEqual(TriangleKindEquilateral, [Triangle kindForSides:5 :4 :6]);
}

- (void)testEquilateralAllZeroSidesIsNotATriangle {
    XCTAssertThrows([Triangle kindForSides:0 :0 :0]);
}

- (void)testEquilateralSidesMayBeFloats {
    XCTAssertEqual(TriangleKindEquilateral, [Triangle kindForSides:0.5 :0.5 :0.5]);
}

- (void)testIsoscelesLastTwoSidesAreEqual {
    XCTAssertEqual(TriangleKindIsosceles, [Triangle kindForSides:3 :4 :4]);
}

- (void)testIsoscelesFirstTwoSidesAreEqual {
    XCTAssertEqual(TriangleKindIsosceles, [Triangle kindForSides:4 :4 :3]);
}

- (void)testIsoscelesFirstAndLastSidesAreEqual {
    XCTAssertEqual(TriangleKindIsosceles, [Triangle kindForSides:4 :3 :4]);
}

- (void)testIsoscelesNoSidesAreEqual {
    XCTAssertNotEqual(TriangleKindIsosceles, [Triangle kindForSides:2 :3 :4]);
}

- (void)testIsoscelesFirstTriangleInequalityViolation {
    XCTAssertThrows([Triangle kindForSides:1 :1 :3]);
}

- (void)testIsoscelesSecondTriangleInequalityViolation {
    XCTAssertThrows([Triangle kindForSides:1 :3 :1]);
}

- (void)testIsoscelesThirdTriangleInequalityViolation {
    XCTAssertThrows([Triangle kindForSides:3 :1 :1]);
}

- (void)testIsoscelesSidesMayBeFloats {
    XCTAssertEqual(TriangleKindIsosceles, [Triangle kindForSides:0.5 :0.4 :0.5]);
}

- (void)testScaleneNoSidesAreEqual {
    XCTAssertEqual(TriangleKindScalene, [Triangle kindForSides:5 :4 :6]);
}

- (void)testScaleneAllSidesAreEqual {
    XCTAssertNotEqual(TriangleKindScalene, [Triangle kindForSides:4 :4 :4]);
}

- (void)testScaleneFirstAndSecondSidesAreEqual {
    XCTAssertNotEqual(TriangleKindScalene, [Triangle kindForSides:4 :4 :3]);
}

- (void)testScaleneFirstAndThirdSidesAreEqual {
    XCTAssertNotEqual(TriangleKindScalene, [Triangle kindForSides:3 :4 :3]);
}

- (void)testScaleneSecondAndThirdSidesAreEqual {
    XCTAssertNotEqual(TriangleKindScalene, [Triangle kindForSides:4 :3 :3]);
}

- (void)testScaleneMayNotViolateTriangleInequality {
    XCTAssertThrows([Triangle kindForSides:7 :3 :2]);
}

- (void)testScaleneSidesMayBeFloats {
    XCTAssertEqual(TriangleKindScalene, [Triangle kindForSides:0.5 :0.4 :0.6]);
}

@end
