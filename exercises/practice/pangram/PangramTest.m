#import <XCTest/XCTest.h>

#if __has_include("PangramExample.h")
# import "PangramExample.h"
#else
# import "Pangram.h"
#endif

@interface PangramTest : XCTestCase

@end

@implementation PangramTest

- (void)testEmptySentence {
    XCTAssertFalse([Pangram isPangram:@""]);
}

- (void)testPerfectLowerCase {
    XCTAssertTrue([Pangram isPangram:@"abcdefghijklmnopqrstuvwxyz"]);
}

- (void)testOnlyLowerCase {
    XCTAssertTrue([Pangram isPangram:@"the quick brown fox jumps over the lazy dog"]);
}

- (void)testMissingTheLetterX {
    XCTAssertFalse([Pangram isPangram:@"a quick movement of the enemy will jeopardize five gunboats"]);
}

- (void)testMissingTheLetterH {
    XCTAssertFalse([Pangram isPangram:@"five boxing wizards jump quickly at it"]);
}

- (void)testWithUnderscores {
    XCTAssertTrue([Pangram isPangram:@"the_quick_brown_fox_jumps_over_the_lazy_dog"]);
}

- (void)testWithNumbers {
    XCTAssertTrue([Pangram isPangram:@"the 1 quick brown fox jumps over the 2 lazy dogs"]);
}

- (void)testMissingLettersReplacedByNumbers {
    XCTAssertFalse([Pangram isPangram:@"7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"]);
}

- (void)testMixedCaseAndPunctuation {
    XCTAssertTrue([Pangram isPangram:@"Five quacking Zephyrs jolt my wax bed."]);
}

- (void)testCaseInsensitive {
    XCTAssertFalse([Pangram isPangram:@"the quick brown fox jumps over with lazy FX"]);
}

@end
