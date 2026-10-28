#import <XCTest/XCTest.h>

#if __has_include("NucleotideCountExample.h")
# import "NucleotideCountExample.h"
#else
# import "NucleotideCount.h"
#endif

@interface NucleotideCountTest : XCTestCase

@end

@implementation NucleotideCountTest

- (void)testEmptyStrand {
    NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@""];
    NSDictionary<NSString *, NSNumber *> *expected = @{ @"A" : @0, @"C" : @0, @"G" : @0, @"T" : @0 };
    XCTAssertEqualObjects(expected, [dna nucleotideCounts]);
}

- (void)testCanCountOneNucleotideInSingleCharacterInput {
    NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@"G"];
    NSDictionary<NSString *, NSNumber *> *expected = @{ @"A" : @0, @"C" : @0, @"G" : @1, @"T" : @0 };
    XCTAssertEqualObjects(expected, [dna nucleotideCounts]);
}

- (void)testStrandWithRepeatedNucleotide {
    NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@"GGGGGGG"];
    NSDictionary<NSString *, NSNumber *> *expected = @{ @"A" : @0, @"C" : @0, @"G" : @7, @"T" : @0 };
    XCTAssertEqualObjects(expected, [dna nucleotideCounts]);
}

- (void)testStrandWithMultipleNucleotides {
    NucleotideCount *dna = [[NucleotideCount alloc] initWithStrand:@"AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"];
    NSDictionary<NSString *, NSNumber *> *expected = @{ @"A" : @20, @"C" : @12, @"G" : @17, @"T" : @21 };
    XCTAssertEqualObjects(expected, [dna nucleotideCounts]);
}

- (void)testStrandWithInvalidNucleotides {
    XCTAssertThrows([[NucleotideCount alloc] initWithStrand:@"AGXXACT"]);
}

@end
