#import <XCTest/XCTest.h>

#if __has_include("ScrabbleScoreExample.h")
# import "ScrabbleScoreExample.h"
# else
# import "ScrabbleScore.h"
#endif

@interface ScrabbleScoreTest : XCTestCase

@end

@implementation ScrabbleScoreTest

- (void)testEmptyWordScoresZero {
    XCTAssertEqual(0, [[[ScrabbleScore alloc] initWithWord:@""] score]);
}

- (void)testWhitespaceScoresZero {
    XCTAssertEqual(0, [[[ScrabbleScore alloc] initWithWord:@" \t\n"] score]);
}

- (void)testNilScoresZero {
    XCTAssertEqual(0, [[[ScrabbleScore alloc] initWithWord:nil] score]);
}

- (void)testScoresVeryShortWord {
    XCTAssertEqual(1, [[[ScrabbleScore alloc] initWithWord:@"a"] score]);
}

- (void)testScoresOtherVeryShortWord {
    XCTAssertEqual(4, [[[ScrabbleScore alloc] initWithWord:@"f"] score]);
}

- (void)testSimpleWordScoresTheNumberOfLetters {
    XCTAssertEqual(6, [[[ScrabbleScore alloc] initWithWord:@"street"] score]);
}

- (void)testComplicatedWordScoresMore {
    XCTAssertEqual(22, [[[ScrabbleScore alloc] initWithWord:@"quirky"] score]);
}

- (void)testScoresAreCaseInsensitive {
    XCTAssertEqual(41, [[[ScrabbleScore alloc] initWithWord:@"OXYPHENBUTAZONE"] score]);
}

- (void)testConvenientScoring {
    XCTAssertEqual(13, [ScrabbleScore score:@"alacrity"]);
}

@end
