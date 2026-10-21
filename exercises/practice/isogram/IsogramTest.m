#import <XCTest/XCTest.h>

#if __has_include("IsogramExample.h")
# import "IsogramExample.h"
# else
# import "Isogram.h"
#endif

@interface IsogramTest : XCTestCase

@end

@implementation IsogramTest

- (void)testEmptyString {
    XCTAssertTrue([Isogram isIsogram:@""]);
}

- (void)testIsogramWithOnlyLowerCaseCharacters {
    XCTAssertTrue([Isogram isIsogram:@"isogram"]);
}

- (void)testWordWithOneDuplicatedCharacter {
    XCTAssertFalse([Isogram isIsogram:@"eleven"]);
}

- (void)testWordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet {
    XCTAssertFalse([Isogram isIsogram:@"zzyzx"]);
}

- (void)testLongestReportedEnglishIsogram {
    XCTAssertTrue([Isogram isIsogram:@"subdermatoglyphic"]);
}

- (void)testWordWithDuplicatedCharacterInMixedCase {
    XCTAssertFalse([Isogram isIsogram:@"Alphabet"]);
}

- (void)testWordWithDuplicatedCharacterInMixedCaseLowercaseFirst {
    XCTAssertFalse([Isogram isIsogram:@"alphAbet"]);
}

- (void)testHypotheticalIsogrammicWordWithHyphen {
    XCTAssertTrue([Isogram isIsogram:@"thumbscrew-japingly"]);
}

- (void)testHypotheticalWordWithDuplicatedCharacterFollowingHyphen {
    XCTAssertFalse([Isogram isIsogram:@"thumbscrew-jappingly"]);
}

- (void)testIsogramWithDuplicatedHyphen {
    XCTAssertTrue([Isogram isIsogram:@"six-year-old"]);
}

- (void)testMadeUpNameThatIsAnIsogram {
    XCTAssertTrue([Isogram isIsogram:@"Emily Jung Schwartzkopf"]);
}

- (void)testDuplicatedCharacterInTheMiddle {
    XCTAssertFalse([Isogram isIsogram:@"accentor"]);
}

- (void)testSameFirstAndLastCharacters {
    XCTAssertFalse([Isogram isIsogram:@"angola"]);
}

- (void)testWordWithDuplicatedCharacterAndWithTwoHyphens {
    XCTAssertFalse([Isogram isIsogram:@"up-to-date"]);
}

@end
