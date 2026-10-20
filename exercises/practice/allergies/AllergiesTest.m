#import <XCTest/XCTest.h>

#if __has_include("AllergiesExample.h")
# import "AllergiesExample.h"
# else
# import "Allergies.h"
#endif

@interface AllergiesTest : XCTestCase

@end

@implementation AllergiesTest

- (void)testEggsNotAllergicToAnything {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    XCTAssertFalse([allergies hasAllergy:AllergenEggs]);
}

- (void)testEggsAllergicOnlyToEggs {
    Allergies *allergies = [[Allergies alloc] initWithScore:1];
    XCTAssertTrue([allergies hasAllergy:AllergenEggs]);
}

- (void)testEggsAllergicToEggsAndSomethingElse {
    Allergies *allergies = [[Allergies alloc] initWithScore:3];
    XCTAssertTrue([allergies hasAllergy:AllergenEggs]);
}

- (void)testEggsAllergicToSomethingButNotEggs {
    Allergies *allergies = [[Allergies alloc] initWithScore:2];
    XCTAssertFalse([allergies hasAllergy:AllergenEggs]);
}

- (void)testEggsAllergicToEverything {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    XCTAssertTrue([allergies hasAllergy:AllergenEggs]);
}

- (void)testPeanutsNotAllergicToAnything {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    XCTAssertFalse([allergies hasAllergy:AllergenPeanuts]);
}

- (void)testPeanutsAllergicOnlyToPeanuts {
    Allergies *allergies = [[Allergies alloc] initWithScore:2];
    XCTAssertTrue([allergies hasAllergy:AllergenPeanuts]);
}

- (void)testPeanutsAllergicToPeanutsAndSomethingElse {
    Allergies *allergies = [[Allergies alloc] initWithScore:7];
    XCTAssertTrue([allergies hasAllergy:AllergenPeanuts]);
}

- (void)testPeanutsAllergicToSomethingButNotPeanuts {
    Allergies *allergies = [[Allergies alloc] initWithScore:5];
    XCTAssertFalse([allergies hasAllergy:AllergenPeanuts]);
}

- (void)testPeanutsAllergicToEverything {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    XCTAssertTrue([allergies hasAllergy:AllergenPeanuts]);
}

- (void)testShellfishNotAllergicToAnything {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    XCTAssertFalse([allergies hasAllergy:AllergenShellfish]);
}

- (void)testShellfishAllergicOnlyToShellfish {
    Allergies *allergies = [[Allergies alloc] initWithScore:4];
    XCTAssertTrue([allergies hasAllergy:AllergenShellfish]);
}

- (void)testShellfishAllergicToShellfishAndSomethingElse {
    Allergies *allergies = [[Allergies alloc] initWithScore:14];
    XCTAssertTrue([allergies hasAllergy:AllergenShellfish]);
}

- (void)testShellfishAllergicToSomethingButNotShellfish {
    Allergies *allergies = [[Allergies alloc] initWithScore:10];
    XCTAssertFalse([allergies hasAllergy:AllergenShellfish]);
}

- (void)testShellfishAllergicToEverything {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    XCTAssertTrue([allergies hasAllergy:AllergenShellfish]);
}

- (void)testStrawberriesNotAllergicToAnything {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    XCTAssertFalse([allergies hasAllergy:AllergenStrawberries]);
}

- (void)testStrawberriesAllergicOnlyToStrawberries {
    Allergies *allergies = [[Allergies alloc] initWithScore:8];
    XCTAssertTrue([allergies hasAllergy:AllergenStrawberries]);
}

- (void)testStrawberriesAllergicToStrawberriesAndSomethingElse {
    Allergies *allergies = [[Allergies alloc] initWithScore:28];
    XCTAssertTrue([allergies hasAllergy:AllergenStrawberries]);
}

- (void)testStrawberriesAllergicToSomethingButNotStrawberries {
    Allergies *allergies = [[Allergies alloc] initWithScore:20];
    XCTAssertFalse([allergies hasAllergy:AllergenStrawberries]);
}

- (void)testStrawberriesAllergicToEverything {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    XCTAssertTrue([allergies hasAllergy:AllergenStrawberries]);
}

- (void)testTomatoesNotAllergicToAnything {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    XCTAssertFalse([allergies hasAllergy:AllergenTomatoes]);
}

- (void)testTomatoesAllergicOnlyToTomatoes {
    Allergies *allergies = [[Allergies alloc] initWithScore:16];
    XCTAssertTrue([allergies hasAllergy:AllergenTomatoes]);
}

- (void)testTomatoesAllergicToTomatoesAndSomethingElse {
    Allergies *allergies = [[Allergies alloc] initWithScore:56];
    XCTAssertTrue([allergies hasAllergy:AllergenTomatoes]);
}

- (void)testTomatoesAllergicToSomethingButNotTomatoes {
    Allergies *allergies = [[Allergies alloc] initWithScore:40];
    XCTAssertFalse([allergies hasAllergy:AllergenTomatoes]);
}

- (void)testTomatoesAllergicToEverything {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    XCTAssertTrue([allergies hasAllergy:AllergenTomatoes]);
}

- (void)testChocolateNotAllergicToAnything {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    XCTAssertFalse([allergies hasAllergy:AllergenChocolate]);
}

- (void)testChocolateAllergicOnlyToChocolate {
    Allergies *allergies = [[Allergies alloc] initWithScore:32];
    XCTAssertTrue([allergies hasAllergy:AllergenChocolate]);
}

- (void)testChocolateAllergicToChocolateAndSomethingElse {
    Allergies *allergies = [[Allergies alloc] initWithScore:112];
    XCTAssertTrue([allergies hasAllergy:AllergenChocolate]);
}

- (void)testChocolateAllergicToSomethingButNotChocolate {
    Allergies *allergies = [[Allergies alloc] initWithScore:80];
    XCTAssertFalse([allergies hasAllergy:AllergenChocolate]);
}

- (void)testChocolateAllergicToEverything {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    XCTAssertTrue([allergies hasAllergy:AllergenChocolate]);
}

- (void)testPollenNotAllergicToAnything {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    XCTAssertFalse([allergies hasAllergy:AllergenPollen]);
}

- (void)testPollenAllergicOnlyToPollen {
    Allergies *allergies = [[Allergies alloc] initWithScore:64];
    XCTAssertTrue([allergies hasAllergy:AllergenPollen]);
}

- (void)testPollenAllergicToPollenAndSomethingElse {
    Allergies *allergies = [[Allergies alloc] initWithScore:224];
    XCTAssertTrue([allergies hasAllergy:AllergenPollen]);
}

- (void)testPollenAllergicToSomethingButNotPollen {
    Allergies *allergies = [[Allergies alloc] initWithScore:160];
    XCTAssertFalse([allergies hasAllergy:AllergenPollen]);
}

- (void)testPollenAllergicToEverything {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    XCTAssertTrue([allergies hasAllergy:AllergenPollen]);
}

- (void)testCatsNotAllergicToAnything {
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    XCTAssertFalse([allergies hasAllergy:AllergenCats]);
}

- (void)testCatsAllergicOnlyToCats {
    Allergies *allergies = [[Allergies alloc] initWithScore:128];
    XCTAssertTrue([allergies hasAllergy:AllergenCats]);
}

- (void)testCatsAllergicToCatsAndSomethingElse {
    Allergies *allergies = [[Allergies alloc] initWithScore:192];
    XCTAssertTrue([allergies hasAllergy:AllergenCats]);
}

- (void)testCatsAllergicToSomethingButNotCats {
    Allergies *allergies = [[Allergies alloc] initWithScore:64];
    XCTAssertFalse([allergies hasAllergy:AllergenCats]);
}

- (void)testCatsAllergicToEverything {
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    XCTAssertTrue([allergies hasAllergy:AllergenCats]);
}

- (void)testListNoAllergies {
    NSArray<NSString *> *expected = @[];
    Allergies *allergies = [[Allergies alloc] initWithScore:0];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListJustEggs {
    NSArray<NSString *> *expected = @[@"eggs"];
    Allergies *allergies = [[Allergies alloc] initWithScore:1];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListJustPeanuts {
    NSArray<NSString *> *expected = @[@"peanuts"];
    Allergies *allergies = [[Allergies alloc] initWithScore:2];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListJustStrawberries {
    NSArray<NSString *> *expected = @[@"strawberries"];
    Allergies *allergies = [[Allergies alloc] initWithScore:8];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListEggsAndPeanuts {
    NSArray<NSString *> *expected = @[@"eggs", @"peanuts"];
    Allergies *allergies = [[Allergies alloc] initWithScore:3];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListMoreThanEggsButNotPeanuts {
    NSArray<NSString *> *expected = @[@"eggs", @"shellfish"];
    Allergies *allergies = [[Allergies alloc] initWithScore:5];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListLotsOfStuff {
    NSArray<NSString *> *expected = @[@"strawberries", @"tomatoes", @"chocolate", @"pollen", @"cats"];
    Allergies *allergies = [[Allergies alloc] initWithScore:248];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListEverything {
    NSArray<NSString *> *expected = @[@"eggs", @"peanuts", @"shellfish", @"strawberries", @"tomatoes", @"chocolate", @"pollen", @"cats"];
    Allergies *allergies = [[Allergies alloc] initWithScore:255];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListNoAllergenScoreParts {
    NSArray<NSString *> *expected = @[@"eggs", @"shellfish", @"strawberries", @"tomatoes", @"chocolate", @"pollen", @"cats"];
    Allergies *allergies = [[Allergies alloc] initWithScore:509];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

- (void)testListNoAllergenScorePartsWithoutHighestValidScore {
    NSArray<NSString *> *expected = @[@"eggs"];
    Allergies *allergies = [[Allergies alloc] initWithScore:257];
    NSArray<NSString *> *result = [allergies list];
    XCTAssertEqualObjects(expected, result);
}

@end
