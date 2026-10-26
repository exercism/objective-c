#import <XCTest/XCTest.h>

#if __has_include("ScrabbleScoreExample.h")
# import "ScrabbleScoreExample.h"
#else
# import "ScrabbleScore.h"
#endif

@interface ScrabbleScoreTest : XCTestCase

@end

@implementation ScrabbleScoreTest

- (void)testLowercaseLetter {
    XCTAssertEqual(1, [ScrabbleScore score:@"a"]);
}

- (void)testUppercaseLetter {
    XCTAssertEqual(1, [ScrabbleScore score:@"A"]);
}

- (void)testValuableLetter {
    XCTAssertEqual(4, [ScrabbleScore score:@"f"]);
}

- (void)testShortWord {
    XCTAssertEqual(2, [ScrabbleScore score:@"at"]);
}

- (void)testShortValuableWord {
    XCTAssertEqual(12, [ScrabbleScore score:@"zoo"]);
}

- (void)testMediumWord {
    XCTAssertEqual(6, [ScrabbleScore score:@"street"]);
}

- (void)testMediumValuableWord {
    XCTAssertEqual(22, [ScrabbleScore score:@"quirky"]);
}

- (void)testLongMixedCaseWord {
    XCTAssertEqual(41, [ScrabbleScore score:@"OxyphenButazone"]);
}

- (void)testEnglishLikeWord {
    XCTAssertEqual(8, [ScrabbleScore score:@"pinata"]);
}

- (void)testEmptyInput {
    XCTAssertEqual(0, [ScrabbleScore score:@""]);
}

- (void)testEntireAlphabetAvailable {
    XCTAssertEqual(87, [ScrabbleScore score:@"abcdefghijklmnopqrstuvwxyz"]);
}

@end
