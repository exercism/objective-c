#import <XCTest/XCTest.h>
#if __has_include("MatchingBracketsExample.h")
# import "MatchingBracketsExample.h"
# else
# import "MatchingBrackets.h"
#endif
@interface MatchingBracketsTest : XCTestCase

@end

@implementation MatchingBracketsTest

- (void)testPairedSquareBrackets {
    XCTAssertTrue([MatchingBracketsExample validateBracketPairingAndNestingInString:@"[]"]);
}

- (void)testEmptyString {
    XCTAssertTrue([MatchingBracketsExample validateBracketPairingAndNestingInString:@""]);
}

- (void)testUnpairedBrackets {
    XCTAssertFalse([MatchingBracketsExample validateBracketPairingAndNestingInString:@"[["]);
}

- (void)testWrongOrderedBrackets {
    XCTAssertFalse([MatchingBracketsExample validateBracketPairingAndNestingInString:@"}{"]);
}

- (void)testPairedWithWhitespace {
    XCTAssertTrue([MatchingBracketsExample validateBracketPairingAndNestingInString:@"{ }"]);
}

- (void)testSimpleNestedBrackets {
    XCTAssertTrue([MatchingBracketsExample validateBracketPairingAndNestingInString:@"{[]}"]);
}

- (void)testSeveralPairedBrackets {
    XCTAssertTrue([MatchingBracketsExample validateBracketPairingAndNestingInString:@"{}[]"]);
}

- (void)testPairedAndNestedBrackets {
    XCTAssertTrue([MatchingBracketsExample validateBracketPairingAndNestingInString:@"([{}({}[])])"]);
}

- (void)testUnopenedClosingBrackets {
    XCTAssertFalse([MatchingBracketsExample validateBracketPairingAndNestingInString:@"{[)][]}"]);
}

- (void)testUnpairedAndNestedBrackets {
    XCTAssertFalse([MatchingBracketsExample validateBracketPairingAndNestingInString:@"([{])"]);
}

- (void)testPairedAndWrongNestedBrackets {
    XCTAssertFalse([MatchingBracketsExample validateBracketPairingAndNestingInString:@"[({]})"]);
}

- (void)testMathExpression {
    XCTAssertTrue([MatchingBracketsExample validateBracketPairingAndNestingInString:@"(((185 + 223.85) * 15) - 543)/2"]);
}

- (void)testComplexLatexExpression {
    XCTAssertTrue([MatchingBracketsExample validateBracketPairingAndNestingInString:@"\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"]);
}
@end
