#import <XCTest/XCTest.h>
#if __has_include("CryptoSquareExample.h")
# import "CryptoSquareExample.h"
# else
# import "CryptoSquare.h"
#endif

@interface CryptoSquareTest : XCTestCase

@end

@implementation CryptoSquareTest

- (void)testNormalizeStrangeCharacters {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"s#$%^&plunk"];
    XCTAssertEqualObjects(@"splunk", [crypto normalizePlaintext]);
}

- (void)testNormalizeUppercaseCharacters {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"WHOA HEY!"];
    XCTAssertEqualObjects(@"whoahey", [crypto normalizePlaintext]);
}

- (void)testNormalizeWithNumbers {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"1, 2, 3 GO!"];
    XCTAssertEqualObjects(@"123go", [crypto normalizePlaintext]);
}

- (void)testSizeOfSmallSquare {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"1234"];
    XCTAssertEqual(2, crypto.numberOfColumns);
}

- (void)testSizeOfSlightlyLargerSquare {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"123456789"];
    XCTAssertEqual(3, crypto.numberOfColumns);
}

- (void)testSizeOfNonPerfectSquare {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"123456789abc"];
    XCTAssertEqual(4, crypto.numberOfColumns);
}

- (void)testSizeIsDeterminedByNormalizedPlaintext {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"Oh hey, this is nuts!"];
    XCTAssertEqual(4, crypto.numberOfColumns);
}

- (void)testPlaintextSegments {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"Never vex thine heart with idle woes"];
    NSArray *expected = @[@"neverv", @"exthin", @"eheart", @"withid", @"lewoes"];
    XCTAssertEqualObjects(expected, crypto.plaintextSegments);
}

- (void)testOtherPlaintextSegments {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"ZOMG! ZOMBIES!!!"];
    NSArray *expected = @[@"zomg", @"zomb", @"ies"];
    XCTAssertEqualObjects(expected, crypto.plaintextSegments);
}

- (void)testCiphertext {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"Time is an illusion. Lunchtime doubly so."];
    XCTAssertEqualObjects(@"tasneyinicdsmiohooelntuillibsuuml", crypto.cipherText);
}

- (void)testAnotherCiphertext {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"We all know interspecies romance is weird."];
    XCTAssertEqualObjects(@"wneiaweoreneawssciliprerlneoidktcms", crypto.cipherText);
}

- (void)testNormalizedCiphertext {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"Vampires are people too!"];
    XCTAssertEqualObjects(@"vrel aepe mset paoo irpo", crypto.normalizedCipherText);
}

- (void)testNormalizedCiphertextSpillsIntoShortSegment {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"Madness, and then illumination."];
    XCTAssertEqualObjects(@"msemo aanin dninn dlaet ltshu i", crypto.normalizedCipherText);
}

- (void)testAnotherNormalizedCiphertext {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:
                            @"If man was meant to stay on the ground god would have given us roots"];
    NSString *expected = @"imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghns seoau";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

- (void)testNormalizedCiphertextWithPunctuation {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"Have a nice day. Feed the dog & chill out!"];
    NSString *expected = @"hifei acedl veeol eddgo aatcu nyhht";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

@end
