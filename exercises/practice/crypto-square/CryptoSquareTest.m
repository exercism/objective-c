#import <XCTest/XCTest.h>

#if __has_include("CryptoSquareExample.h")
# import "CryptoSquareExample.h"
#else
# import "CryptoSquare.h"
#endif

@interface CryptoSquareTest : XCTestCase

@end

@implementation CryptoSquareTest

- (void)testEmptyPlaintextResultsInAnEmptyCiphertext {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@""];
    NSString *expected = @"";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

- (void)testNormalizationResultsInEmptyPlaintext {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"... --- ..."];
    NSString *expected = @"";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

- (void)testLowercase {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"A"];
    NSString *expected = @"a";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

- (void)testRemoveSpaces {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"  b "];
    NSString *expected = @"b";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

- (void)testRemovePunctuation {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"@1,%!"];
    NSString *expected = @"1";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

- (void)test9CharacterPlaintextResultsIn3ChunksOf3Characters {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"This is fun!"];
    NSString *expected = @"tsf hiu isn";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

- (void)test8CharacterPlaintextResultsIn3ChunksTheLastOneWithATrailingSpace {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"Chill out."];
    NSString *expected = @"clu hlt io ";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

- (void)test54CharacterPlaintextResultsIn8ChunksTheLastTwoWithTrailingSpaces {
    CryptoSquare *crypto = [[CryptoSquare alloc] initWithText:@"If man was meant to stay on the ground, god would have given us roots."];
    NSString *expected = @"imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ";
    XCTAssertEqualObjects(expected, crypto.normalizedCipherText);
}

@end
