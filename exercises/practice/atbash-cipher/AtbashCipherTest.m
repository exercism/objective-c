#import <XCTest/XCTest.h>

#if __has_include("AtbashCipherExample.h")
# import "AtbashCipherExample.h"
#else
# import "AtbashCipher.h"
#endif

@interface AtbashCipherTest : XCTestCase

@end

@implementation AtbashCipherTest

- (void)testEncodeYes {
    XCTAssertEqualObjects(@"bvh", [AtbashCipher encode:@"yes"]);
}

- (void)testEncodeNo {
    XCTAssertEqualObjects(@"ml", [AtbashCipher encode:@"no"]);
}

- (void)testEncodeOmg {
    XCTAssertEqualObjects(@"lnt", [AtbashCipher encode:@"OMG"]);
}

- (void)testEncodeSpaces {
    XCTAssertEqualObjects(@"lnt", [AtbashCipher encode:@"O M G"]);
}

- (void)testEncodeMindblowingly {
    XCTAssertEqualObjects(@"nrmwy oldrm tob", [AtbashCipher encode:@"mindblowingly"]);
}

- (void)testEncodeNumbers {
    XCTAssertEqualObjects(@"gvhgr mt123 gvhgr mt", [AtbashCipher encode:@"Testing,1 2 3, testing."]);
}

- (void)testEncodeDeepThought {
    XCTAssertEqualObjects(@"gifgs rhurx grlm", [AtbashCipher encode:@"Truth is fiction."]);
}

- (void)testEncodeAllTheLetters {
    XCTAssertEqualObjects(@"gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt", [AtbashCipher encode:@"The quick brown fox jumps over the lazy dog."]);
}

@end
