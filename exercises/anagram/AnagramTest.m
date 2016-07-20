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

- (void)testDetectSimpleAnagram {
    Anagram *anagram = [[Anagram alloc] initWithString:@"ant"];
    NSArray<NSString *> *results = [anagram match:@[@"tan",@"stand",@"at"]];
    NSArray<NSString *> *expected = @[@"tan"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectMultipleAnagrams {
    Anagram *anagram = [[Anagram alloc] initWithString:@"master"];
    NSArray<NSString *> *results = [anagram match:@[@"stream",@"pigeon",@"maters"]];
    NSArray<NSString *> *expected = @[@"stream",@"maters"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDoesNotConfuseDifferentDuplicates {
    Anagram *anagram = [[Anagram alloc] initWithString:@"galea"];
    NSArray<NSString *> *results = [anagram match:@[@"eagle"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testIdenticalWordIsNotAnagram {
    Anagram *anagram = [[Anagram alloc] initWithString:@"corn"];
    NSArray<NSString *> *results = [anagram match:@[@"corn", @"dark", @"Corn", @"rank", @"CORN", @"cron", @"park"]];
    NSArray<NSString *> *expected = @[@"cron"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testEliminateAnagramsWithSameChecksum {
    Anagram *anagram = [[Anagram alloc] initWithString:@"mass"];
    NSArray<NSString *> *results = [anagram match:@[@"last"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testEliminateAnagramSubsets {
    Anagram *anagram = [[Anagram alloc] initWithString:@"good"];
    NSArray<NSString *> *results = [anagram match:@[@"dog",@"goody"]];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(results, expected);
}

- (void)testDetectAnagram {
    Anagram *anagram = [[Anagram alloc] initWithString:@"listen"];
    NSArray<NSString *> *results = [anagram match:@[@"enlists",@"google",@"inlets",@"banana"]];
    NSArray<NSString *> *expected = @[@"inlets"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testMultipleAnagrams {
    Anagram *anagram = [[Anagram alloc] initWithString:@"allergy"];
    NSArray<NSString *> *results = [anagram match:@[@"gallery",@"ballerina",@"regally",@"clergy",@"largely",@"leading"]];
    NSArray<NSString *> *expected = @[@"gallery",@"regally",@"largely"];
    XCTAssertEqualObjects(results, expected);
}

- (void)testAnagramsAreCaseInsensitive {
    Anagram *anagram = [[Anagram alloc] initWithString:@"Orchestra"];
    NSArray<NSString *> *results = [anagram match:@[@"cashregister",@"Carthorse",@"radishes"]];
    NSArray<NSString *> *expected = @[@"Carthorse"];
    XCTAssertEqualObjects(results, expected);
}

@end
NS_ASSUME_NONNULL_END
