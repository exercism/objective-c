#import <XCTest/XCTest.h>

#if __has_include("MatchingBracketsExample.h")
# import "MatchingBracketsExample.h"
#else
# import "MatchingBrackets.h"
#endif

@interface MatchingBracketsTest : XCTestCase

@end

@implementation MatchingBracketsTest

- (void)testPairedSquareBrackets {
    XCTAssertTrue([MatchingBrackets validateBracketPairingAndNestingInString:@"[]"]);
}

- (void)testEmptyString {
    XCTAssertTrue([MatchingBrackets validateBracketPairingAndNestingInString:@""]);
}

- (void)testUnpairedBrackets {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"[["]);
}

- (void)testWrongOrderedBrackets {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"}{"]);
}

- (void)testWrongClosingBracket {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"{]"]);
}

- (void)testPairedWithWhitespace {
    XCTAssertTrue([MatchingBrackets validateBracketPairingAndNestingInString:@"{ }"]);
}

- (void)testPartiallyPairedBrackets {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"{[])"]);
}

- (void)testSimpleNestedBrackets {
    XCTAssertTrue([MatchingBrackets validateBracketPairingAndNestingInString:@"{[]}"]);
}

- (void)testSeveralPairedBrackets {
    XCTAssertTrue([MatchingBrackets validateBracketPairingAndNestingInString:@"{}[]"]);
}

- (void)testPairedAndNestedBrackets {
    XCTAssertTrue([MatchingBrackets validateBracketPairingAndNestingInString:@"([{}({}[])])"]);
}

- (void)testUnopenedClosingBrackets {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"{[)][]}"]);
}

- (void)testUnpairedAndNestedBrackets {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"([{])"]);
}

- (void)testPairedAndWrongNestedBrackets {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"[({]})"]);
}

- (void)testPairedAndIncompleteBrackets {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"{}["]);
}

- (void)testTooManyClosingBrackets {
    XCTAssertFalse([MatchingBrackets validateBracketPairingAndNestingInString:@"[]]"]);
}

- (void)testMathExpression {
    XCTAssertTrue([MatchingBrackets validateBracketPairingAndNestingInString:@"(((185 + 223.85) * 15) - 543)/2"]);
}

- (void)testComplexLatexExpression {
    XCTAssertTrue([MatchingBrackets validateBracketPairingAndNestingInString:@"\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"]);
}

@end
