#import <XCTest/XCTest.h>

#if __has_include("AnagramExample.h")
# import "AnagramExample.h"
# else
# import "Anagram.h"
#endif

NS_ASSUME_NONNULL_BEGIN


@interface AnagramTest : XCTestCase

@end

@implementation AnagramTest

- (void)testNoMatches {
    Anagram *anagram = [[Anagram alloc] initWithString:@"diaper"];
    NSArray<NSString *> *results = [anagram match:@[@"hello",@"world",@"zombies",@"pants"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectsTwoAnagrams {
    Anagram *anagram = [[Anagram alloc] initWithString:@"solemn"];
    NSArray<NSString *> *results = [anagram match:@[@"lemons",@"cherry",@"melons"]];
    NSArray<NSString *> *expected = @[@"lemons",@"melons"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDoesNotDetectAnagramSubsets {
    Anagram *anagram = [[Anagram alloc] initWithString:@"good"];
    NSArray<NSString *> *results = [anagram match:@[@"dog",@"goody"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectsAnagram {
    Anagram *anagram = [[Anagram alloc] initWithString:@"listen"];
    NSArray<NSString *> *results = [anagram match:@[@"enlists",@"google",@"inlets",@"banana"]];
    NSArray<NSString *> *expected = @[@"inlets"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectsThreeAnagrams {
    Anagram *anagram = [[Anagram alloc] initWithString:@"allergy"];
    NSArray<NSString *> *results = [anagram match:@[@"gallery",@"ballerina",@"regally",@"clergy",@"largely",@"leading"]];
    NSArray<NSString *> *expected = @[@"gallery",@"regally",@"largely"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectsMultipleAnagramsWithDifferentCase {
    Anagram *anagram = [[Anagram alloc] initWithString:@"nose"];
    NSArray<NSString *> *results = [anagram match:@[@"Eons",@"ONES"]];
    NSArray<NSString *> *expected = @[@"Eons",@"ONES"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDoesNotDetectNonAnagramsWithIdenticalChecksum {
    Anagram *anagram = [[Anagram alloc] initWithString:@"mass"];
    NSArray<NSString *> *results = [anagram match:@[@"last"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectsAnagramsCaseInsensitively {
    Anagram *anagram = [[Anagram alloc] initWithString:@"Orchestra"];
    NSArray<NSString *> *results = [anagram match:@[@"cashregister",@"Carthorse",@"radishes"]];
    NSArray<NSString *> *expected = @[@"Carthorse"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectsAnagramsUsingCaseInsensitiveSubject {
    Anagram *anagram = [[Anagram alloc] initWithString:@"Orchestra"];
    NSArray<NSString *> *results = [anagram match:@[@"cashregister",@"carthorse",@"radishes"]];
    NSArray<NSString *> *expected = @[@"carthorse"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectsAnagramsUsingCaseInsensitivePossibleMatches {
    Anagram *anagram = [[Anagram alloc] initWithString:@"orchestra"];
    NSArray<NSString *> *results = [anagram match:@[@"cashregister",@"Carthorse",@"radishes"]];
    NSArray<NSString *> *expected = @[@"Carthorse"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDoesNotDetectAnAnagramIfTheOriginalWordIsRepeated {
    Anagram *anagram = [[Anagram alloc] initWithString:@"go"];
    NSArray<NSString *> *results = [anagram match:@[@"go Go GO"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testAnagramsMustUseAllLettersExactlyOnce {
    Anagram *anagram = [[Anagram alloc] initWithString:@"tapper"];
    NSArray<NSString *> *results = [anagram match:@[@"patter"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testWordsAreNotAnagramsOfThemselvesCaseInsensitive {
    Anagram *anagram = [[Anagram alloc] initWithString:@"BANANA"];
    NSArray<NSString *> *results = [anagram match:@[@"BANANA",@"Banana",@"banana"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testWordsOtherThanThemselvesCanBeAnagrams {
    Anagram *anagram = [[Anagram alloc] initWithString:@"LISTEN"];
    NSArray<NSString *> *results = [anagram match:@[@"Listen",@"Silent",@"LISTEN"]];
    NSArray<NSString *> *expected = @[@"Silent"];
    XCTAssertEqualObjects(results, expected);
}

@end
NS_ASSUME_NONNULL_END
