#import <XCTest/XCTest.h>
#if __has_include("NucleotideCount.h")
# import "NucleotideCount.h"
# else
# import "NucleotideCountExample.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NucleotideCountTest : XCTestCase

@end

@implementation NucleotideCountTest

- (void)testEmptyDNAStringHasNoAdenosine {
  DNA *dna = [[DNA alloc] initWithStrand:@""];
  NSUInteger result = [dna count:@"A"];
  NSUInteger expected = 0;
  XCTAssertEqual(expected,result);
}

- (void)testEmptyDNAStringHasNoNucleotides {
  DNA *dna = [[DNA alloc] initWithStrand:@""];
  NSDictionary *results = [dna nucleotideCounts];
  NSDictionary *expected = @{ @"A": @0, @"T" : @0, @"C" : @0, @"G" : @0 };
  XCTAssertEqualObjects(results, expected);
}

- (void)testRepetitiveCytidineGetsCounted {
  DNA *dna = [[DNA alloc] initWithStrand:@"CCCCC"];
  NSUInteger result = [dna count:@"C"];
  NSUInteger expected = 5;
  XCTAssertEqual(expected,result);
}

- (void)testRepetitiveSequenceHasOnlyGuanosine {
  DNA *dna = [[DNA alloc] initWithStrand:@"GGGGGGGG"];
  NSDictionary *results = [dna nucleotideCounts];
  NSDictionary *expected = @{ @"A": @0, @"T" : @0, @"C" : @0, @"G" : @8 };
  XCTAssertEqualObjects(results, expected);
}

- (void)testCountsByThymidine {
  DNA *dna = [[DNA alloc] initWithStrand:@"GGGGGTAACCCGG"];
  NSUInteger result = [dna count:@"T"];
  NSUInteger expected = 1;
  XCTAssertEqual(expected,result);
}

- (void)testCountsANucleotideOnlyOnce {
  DNA *dna = [[DNA alloc] initWithStrand:@"CGATTGGG"];
  NSUInteger result = [dna count:@"T"];
  NSUInteger expected = 2;
  XCTAssertEqual(expected,result);
}

- (void)testValidatesDNA {
  XCTAssertThrows([[DNA alloc] initWithStrand:@"John"]);
}

- (void)testCountsAllNucleotides {
  NSString *longStrand = @"AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC";
  DNA *dna = [[DNA alloc] initWithStrand:longStrand];
  NSDictionary *results = [dna nucleotideCounts];
  NSDictionary *expected = @{ @"A": @20, @"T" : @21, @"C" : @12, @"G" : @17 };
  XCTAssertEqualObjects(results, expected);
}

@end
NS_ASSUME_NONNULL_END
