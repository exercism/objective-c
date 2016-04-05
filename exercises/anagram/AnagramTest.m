#import <XCTest/XCTest.h>
#import "Anagram.h"

@interface test_suite : XCTestCase

@end

@implementation test_suite

- (void)testNoMatches {
  Anagram *anagram = [[Anagram alloc] initWithString:@"diaper"];
  NSArray *results = [anagram match:@[@"hello",@"world",@"zombies",@"pants"]];
  NSArray *expected = @[];

  XCTAssertEqualObjects(results, expected);
}

- (void)testDetectSimpleAnagram {
  Anagram *anagram = [[Anagram alloc] initWithString:@"ant"];
  NSArray *results = [anagram match:@[@"tan",@"stand",@"at"]];
  NSArray *expected = @[@"tan"];
  XCTAssertEqualObjects(results, expected);
}

- (void)testDetectMultipleAnagrams {
  Anagram *anagram = [[Anagram alloc] initWithString:@"master"];
  NSArray *results = [anagram match:@[@"stream",@"pigeon",@"maters"]];
  NSArray *expected = @[@"stream",@"maters"];
  XCTAssertEqualObjects(results, expected);
}

- (void)testDoesNotConfuseDifferentDuplicates {
  Anagram *anagram = [[Anagram alloc] initWithString:@"galea"];
  NSArray *results = [anagram match:@[@"eagle"]];
  NSArray *expected = @[];
  XCTAssertEqualObjects(results, expected);
}

- (void)testIdenticalWordIsNotAnagram {
  Anagram *anagram = [[Anagram alloc] initWithString:@"corn"];
  NSArray *results = [anagram match:@[@"corn", @"dark", @"Corn", @"rank", @"CORN", @"cron", @"park"]];
  NSArray *expected = @[@"cron"];
  XCTAssertEqualObjects(results, expected);
}

- (void)testEliminateAnagramsWithSameChecksum {
  Anagram *anagram = [[Anagram alloc] initWithString:@"mass"];
  NSArray *results = [anagram match:@[@"last"]];
  NSArray *expected = @[];
  XCTAssertEqualObjects(results, expected);
}

- (void)testEliminateAnagramSubsets {
  Anagram *anagram = [[Anagram alloc] initWithString:@"good"];
  NSArray *results = [anagram match:@[@"dog",@"goody"]];
  NSArray *expected = @[];
  XCTAssertEqualObjects(results, expected);
}

- (void)testDetectAnagram {
  Anagram *anagram = [[Anagram alloc] initWithString:@"listen"];
  NSArray *results = [anagram match:@[@"enlists",@"google",@"inlets",@"banana"]];
  NSArray *expected = @[@"inlets"];
  XCTAssertEqualObjects(results, expected);
}

- (void)testMultipleAnagrams {
  Anagram *anagram = [[Anagram alloc] initWithString:@"allergy"];
  NSArray *results = [anagram match:@[@"gallery",@"ballerina",@"regally",@"clergy",@"largely",@"leading"]];
  NSArray *expected = @[@"gallery",@"regally",@"largely"];
  XCTAssertEqualObjects(results, expected);
}

- (void)testAnagramsAreCaseInsensitive {
  Anagram *anagram = [[Anagram alloc] initWithString:@"Orchestra"];
  NSArray *results = [anagram match:@[@"cashregister",@"Carthorse",@"radishes"]];
  NSArray *expected = @[@"Carthorse"];
  XCTAssertEqualObjects(results, expected);
}

@end
