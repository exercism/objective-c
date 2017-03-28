#import <XCTest/XCTest.h>
#if __has_include("BracketPushExample.h")
# import "BracketPushExample.h"
# else
# import "BracketPush.h"
#endif
@interface BracketPushTest : XCTestCase

@end

@implementation BracketPushTest

- (void)testPairedSquareBrackets {
    XCTAssertTrue([BracketPushExample validateBracketPairingAndNestingInString:@"[]"]);
}

- (void)testEmptyString {
    XCTAssertTrue([BracketPushExample validateBracketPairingAndNestingInString:@""]);
}

- (void)testUnpairedBrackets {
    XCTAssertFalse([BracketPushExample validateBracketPairingAndNestingInString:@"[["]);
}

- (void)testWrongOrderedBrackets {
    XCTAssertFalse([BracketPushExample validateBracketPairingAndNestingInString:@"}{"]);
}

- (void)testPairedWithWhitespace {
    XCTAssertTrue([BracketPushExample validateBracketPairingAndNestingInString:@"{ }"]);
}

- (void)testSimpleNestedBrackets {
    XCTAssertTrue([BracketPushExample validateBracketPairingAndNestingInString:@"{[]}"]);
}

- (void)testSeveralPairedBrackets {
    XCTAssertTrue([BracketPushExample validateBracketPairingAndNestingInString:@"{}[]"]);
}

- (void)testPairedAndNestedBrackets {
    XCTAssertTrue([BracketPushExample validateBracketPairingAndNestingInString:@"([{}({}[])])"]);
}

- (void)testUnopenedClosingBrackets {
    XCTAssertFalse([BracketPushExample validateBracketPairingAndNestingInString:@"{[)][]}"]);
}

- (void)testUnpairedAndNestedBrackets {
    XCTAssertFalse([BracketPushExample validateBracketPairingAndNestingInString:@"([{])"]);
}

- (void)testPairedAndWrongNestedBrackets {
    XCTAssertFalse([BracketPushExample validateBracketPairingAndNestingInString:@"[({]})"]);
}

- (void)testMathExpression {
    XCTAssertTrue([BracketPushExample validateBracketPairingAndNestingInString:@"(((185 + 223.85) * 15) - 543)/2"]);
}

- (void)testComplexLatexExpression {
    XCTAssertTrue([BracketPushExample validateBracketPairingAndNestingInString:@"\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"]);
}
@end
