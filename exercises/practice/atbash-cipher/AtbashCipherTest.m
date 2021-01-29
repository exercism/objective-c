#import <XCTest/XCTest.h>

#if __has_include("AtbashCipherExample.h")
# import "AtbashCipherExample.h"
# else
# import "AtbashCipher.h"
#endif

@interface AtbashCipherTest : XCTestCase

@end

@implementation AtbashCipherTest

- (void)testEncodeNo {
    XCTAssertEqualObjects(@"ml", [AtbashCipher encode:@"no"]);
}

- (void)testEncodeYes {
    XCTAssertEqualObjects(@"bvh", [AtbashCipher encode:@"yes"]);
}

- (void)testEncodeOMG {
    XCTAssertEqualObjects(@"lnt", [AtbashCipher encode:@"OMG"]);
}

- (void)testEncodeOMGWithSpaces {
    XCTAssertEqualObjects(@"lnt", [AtbashCipher encode:@"O M G"]);
}

- (void)testEncodeLongWord {
    XCTAssertEqualObjects(@"nrmwy oldrm tob", [AtbashCipher encode:@"mindblowingly"]);
}

- (void)testEncodeNumbers {
    XCTAssertEqualObjects(@"gvhgr mt123 gvhgr mt", [AtbashCipher encode:@"Testing, 1 2 3, testing."]);
}

- (void)testEncodeSentence {
    XCTAssertEqualObjects(@"gifgs rhurx grlm", [AtbashCipher encode:@"Truth is fiction."]);
}

- (void)testEncodeAllTheThings {
    NSString *plaintext = @"The quick brown fox jumps over the lazy dog.";
    NSString *cipher = @"gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt";
    XCTAssertEqualObjects(cipher, [AtbashCipher encode:plaintext]);
}

@end
