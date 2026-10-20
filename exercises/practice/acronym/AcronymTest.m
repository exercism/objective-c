#import <XCTest/XCTest.h>

#if __has_include("AcronymExample.h")
# import "AcronymExample.h"
# else
# import "Acronym.h"
#endif

@interface AcronymTest : XCTestCase

@end

@implementation AcronymTest

- (void)testBasic {
    XCTAssertEqualObjects(@"PNG", [Acronym abbreviate:@"Portable Network Graphics"]);
}

- (void)testLowercaseWords {
    XCTAssertEqualObjects(@"ROR", [Acronym abbreviate:@"Ruby on Rails"]);
}

- (void)testPunctuation {
    XCTAssertEqualObjects(@"FIFO", [Acronym abbreviate:@"First In, First Out"]);
}

- (void)testAllCapsWord {
    XCTAssertEqualObjects(@"GIMP", [Acronym abbreviate:@"GNU Image Manipulation Program"]);
}

- (void)testPunctuationWithoutWhitespace {
    XCTAssertEqualObjects(@"CMOS", [Acronym abbreviate:@"Complementary metal-oxide semiconductor"]);
}

- (void)testVeryLongAbbreviation {
    XCTAssertEqualObjects(@"ROTFLSHTMDCOALM", [Acronym abbreviate:@"Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"]);
}

- (void)testConsecutiveDelimiters {
    XCTAssertEqualObjects(@"SIMUFTA", [Acronym abbreviate:@"Something - I made up from thin air"]);
}

- (void)testApostrophes {
    XCTAssertEqualObjects(@"HC", [Acronym abbreviate:@"Halley's Comet"]);
}

- (void)testUnderscoreEmphasis {
    XCTAssertEqualObjects(@"TRNT", [Acronym abbreviate:@"The Road _Not_ Taken"]);
}

@end
