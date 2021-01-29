#import <XCTest/XCTest.h>

#if __has_include("RNATranscriptionExample.h")
# import "RNATranscriptionExample.h"
# else
# import "RNATranscription.h"
#endif

@interface RNATranscriptionTest : XCTestCase

@end

@implementation RNATranscriptionTest

- (void)test1 {
    XCTAssertEqualObjects(@"G", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"C"]);
}

- (void)test2 {
    XCTAssertEqualObjects(@"C", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"G"]);
}

- (void)test3 {
    XCTAssertEqualObjects(@"A", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"T"]);
}

- (void)test4 {
    XCTAssertEqualObjects(@"U", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"A"]);
}

- (void)test5 {
    XCTAssertEqualObjects(@"UGCACCAGAAUU", [[[RNATranscription alloc] init] rnaFromDNAStrand:@"ACGTGGTCTTAA"]);
}

- (void)test6 {
    XCTAssertEqualObjects(nil, [[[RNATranscription alloc] init] rnaFromDNAStrand:@"U"]);
}

- (void)test7 {
    XCTAssertEqualObjects(nil, [[[RNATranscription alloc] init] rnaFromDNAStrand:@"XXX"]);
}

- (void)test8 {
    XCTAssertEqualObjects(nil, [[[RNATranscription alloc] init] rnaFromDNAStrand:@"ACGTXXXCTTAA"]);
}

@end
