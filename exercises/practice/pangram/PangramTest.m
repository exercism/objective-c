#import <XCTest/XCTest.h>

#if __has_include("PangramExample.h")
# import "PangramExample.h"
# else
# import "Pangram.h"
#endif

@interface PangramTest : XCTestCase

@end

@implementation PangramTest

- (void)testSentenceEmpty {
    XCTAssertFalse([Pangram isPangram:@""]);
}

- (void)test_pangram_with_only_lower_case {
    XCTAssertTrue([Pangram isPangram:@"the quick brown fox jumps over the lazy dog"]);
}

- (void)testMissingCharacterX {
    XCTAssertFalse([Pangram isPangram:@"a quick movement of the enemy will jeopardize five gunboats"]);
}

- (void)testAnotherMissingCharacterX {
    XCTAssertFalse([Pangram isPangram:@"the quick brown fish jumps over the lazy dog"]);
}

- (void)testPangramWithUnderscores {
    XCTAssertTrue([Pangram isPangram:@"the_quick_brown_fox_jumps_over_the_lazy_dog"]);
}

- (void)testPangramWithNumbers {
    XCTAssertTrue([Pangram isPangram:@"the 1 quick brown fox jumps over the 2 lazy dogs"]);
}

- (void)testMissingLettersReplacedByNumbers {
    XCTAssertFalse([Pangram isPangram:@"7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"]);
}

- (void)testPangramWithMixedCaseAndPunctuation {
    XCTAssertTrue([Pangram isPangram:@"Five quacking Zephyrs jolt my wax bed."]);
}

- (void)testPangramWithNonAsciiCharacters {
    XCTAssertTrue([Pangram isPangram:@"Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."]);
}

@end
