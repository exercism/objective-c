#import <XCTest/XCTest.h>

#if __has_include("NucleotideCountExample.h")
# import "NucleotideCountExample.h"
# else
# import "NucleotideCount.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NucleotideCountTest : XCTestCase

@end

@implementation NucleotideCountTest

- (void)testEmptyDNAStringHasNoAdenosine {
  NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@""];
  NSUInteger result = [dna count:@"A"];
  NSUInteger expected = 0;
  XCTAssertEqual(expected,result);
}

- (void)testEmptyNucleotideCountStringHasNoNucleotides {
  NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@""];
  NSDictionary<NSString *, NSNumber *> *results = [dna nucleotideCounts];
  NSDictionary<NSString *, NSNumber *> *expected = @{ @"A": @0, @"T" : @0, @"C" : @0, @"G" : @0 };
  XCTAssertEqualObjects(results, expected);
}

- (void)testRepetitiveCytidineGetsCounted {
  NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@"CCCCC"];
  NSUInteger result = [dna count:@"C"];
  NSUInteger expected = 5;
  XCTAssertEqual(expected,result);
}

- (void)testRepetitiveSequenceHasOnlyGuanosine {
  NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@"GGGGGGGG"];
  NSDictionary<NSString *, NSNumber *> *results = [dna nucleotideCounts];
  NSDictionary<NSString *, NSNumber *> *expected = @{ @"A": @0, @"T" : @0, @"C" : @0, @"G" : @8 };
  XCTAssertEqualObjects(results, expected);
}

- (void)testCountsByThymidine {
  NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@"GGGGGTAACCCGG"];
  NSUInteger result = [dna count:@"T"];
  NSUInteger expected = 1;
  XCTAssertEqual(expected,result);
}

- (void)testCountsANucleotideOnlyOnce {
  NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@"CGATTGGG"];
  NSUInteger result = [dna count:@"T"];
  NSUInteger expected = 2;
  XCTAssertEqual(expected,result);
}

- (void)testValidatesNucleotideCount {
  XCTAssertThrows([[NucleotideCount alloc] initWithStrand:@"John"]);
}

- (void)testCountsAllNucleotides {
  NSString *longStrand = @"AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC";
  NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:longStrand];
  NSDictionary<NSString *, NSNumber *> *results = [dna nucleotideCounts];
  NSDictionary<NSString *, NSNumber *> *expected = @{ @"A": @20, @"T" : @21, @"C" : @12, @"G" : @17 };
  XCTAssertEqualObjects(results, expected);
}

@end
NS_ASSUME_NONNULL_END
