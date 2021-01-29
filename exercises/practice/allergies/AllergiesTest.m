#import <XCTest/XCTest.h>

#if __has_include("AllergiesExample.h")
# import "AllergiesExample.h"
# else
# import "Allergies.h"
#endif

@interface AllergiesTest : XCTestCase

@end

@implementation AllergiesTest

- (NSArray<NSNumber *> *)allAllergens {
    return @[@(AllergenEggs), @(AllergenPeanuts), @(AllergenShellfish), @(AllergenStrawberries), @(AllergenTomatoes), @(AllergenChocolate), @(AllergenPollen), @(AllergenCats)];
}

- (void)testAllergicToEggs { //!OCLint
    Allergies *allergies = [[Allergies alloc] initWithScore:1];
    XCTAssertTrue([allergies hasAllergy:AllergenEggs]);
    XCTAssertFalse([allergies hasAllergy:AllergenPeanuts]);
    XCTAssertFalse([allergies hasAllergy:AllergenPollen]);
}

- (void)testAllergicToChocolate { //!OCLint
    Allergies *allergies = [[Allergies alloc] initWithScore:32];
    XCTAssertTrue([allergies hasAllergy:AllergenChocolate]);
    XCTAssertFalse([allergies hasAllergy:AllergenEggs]);
    XCTAssertFalse([allergies hasAllergy:AllergenTomatoes]);
}

- (void)testBob { //!OCLint
    Allergies *allergies = [[Allergies alloc] initWithScore:34];
    XCTAssertTrue([allergies hasAllergy:AllergenPeanuts], "Bob is allergic to peanuts");
    XCTAssertTrue([allergies hasAllergy:AllergenChocolate], "Bob is allergic to chocolate");
    XCTAssertFalse([allergies hasAllergy:AllergenCats], "Bob is not allergic to cats");
}

- (void)testEggsAndCats { //!OCLint
    Allergies *allergies = [[Allergies alloc] initWithScore:129];
    XCTAssertTrue([allergies hasAllergy:AllergenEggs]);
    XCTAssertTrue([allergies hasAllergy:AllergenCats]);
    XCTAssertFalse([allergies hasAllergy:AllergenChocolate]);
}

- (void)testNone {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    for (NSNumber *allergen in [self allAllergens]) {
        XCTAssertFalse([allergies hasAllergy:[allergen intValue]]);
    }
}

- (void)testAll {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    for (NSNumber *allergen in [self allAllergens]) {
        XCTAssertTrue([allergies hasAllergy:[allergen intValue]]);
    }
}

@end
