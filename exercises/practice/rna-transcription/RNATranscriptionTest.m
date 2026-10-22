#import <XCTest/XCTest.h>

#if __has_include("RNATranscriptionExample.h")
# import "RNATranscriptionExample.h"
#else
# import "RNATranscription.h"
#endif

@interface RNATranscriptionTest : XCTestCase

@end

@implementation RNATranscriptionTest

- (void)testEmptyRnaSequence {
    XCTAssertEqualObjects(@"", [[[RNATranscription alloc] init] rnaFromDNAStrand:@""]);
}

- (void)testRnaComplementOfCytosineIsGuanine {
    XCTAssertEqualObjects(@"G", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"C"]);
}

- (void)testRnaComplementOfGuanineIsCytosine {
    XCTAssertEqualObjects(@"C", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"G"]);
}

- (void)testRnaComplementOfThymineIsAdenine {
    XCTAssertEqualObjects(@"A", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"T"]);
}

- (void)testRnaComplementOfAdenineIsUracil {
    XCTAssertEqualObjects(@"U", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"A"]);
}

- (void)testRnaComplement {
    XCTAssertEqualObjects(@"UGCACCAGAAUU", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"ACGTGGTCTTAA"]);
}

@end
