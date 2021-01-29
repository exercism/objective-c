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

- (void)testLongestReportedEnglishIsogram {
    XCTAssertTrue([Isogram isIsogram:@"subdermatoglyphic"]);
}

- (void)testWordWithDuplicatedCharacterInMixedCase {
    XCTAssertFalse([Isogram isIsogram:@"Alphabet"]);
}

- (void)testHypotheticalIsogrammicWordWithHyphen {
    XCTAssertTrue([Isogram isIsogram:@"thumbscrew-japingly"]);
}

- (void)testIsogramWithDuplicatedNonLetterCharacter {
    XCTAssertTrue([Isogram isIsogram:@"Hjelmqvist-Gryb-Zock-Pfund-Wax"]);
}

- (void)testMadeUpNameThatIsAnIsogram {
    XCTAssertTrue([Isogram isIsogram:@"Emily Jung Schwartzkopf"]);
}

@end
