#import <XCTest/XCTest.h>

#if __has_include("RunLengthEncodingExample.h")
# import "RunLengthEncodingExample.h"
#else
# import "RunLengthEncoding.h"
#endif

@interface RunLengthEncodingTest : XCTestCase

@end

@implementation RunLengthEncodingTest

- (void)testEncodeEmptyString {
    XCTAssertEqualObjects([RunLengthEncoding encode:@""], @"");
}

- (void)testEncodeSingleCharactersOnlyAreEncodedWithoutCount {
    XCTAssertEqualObjects([RunLengthEncoding encode:@"XYZ"], @"XYZ");
}

- (void)testEncodeStringWithNoSingleCharacters {
    XCTAssertEqualObjects([RunLengthEncoding encode:@"AABBBCCCC"], @"2A3B4C");
}

- (void)testEncodeSingleCharactersMixedWithRepeatedCharacters {
    XCTAssertEqualObjects([RunLengthEncoding encode:@"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"], @"12WB12W3B24WB");
}

- (void)testEncodeMultipleWhitespaceMixedInString {
    XCTAssertEqualObjects([RunLengthEncoding encode:@"  hsqq qww  "], @"2 hs2q q2w2 ");
}

- (void)testEncodeLowercaseCharacters {
    XCTAssertEqualObjects([RunLengthEncoding encode:@"aabbbcccc"], @"2a3b4c");
}

- (void)testDecodeEmptyString {
    XCTAssertEqualObjects([RunLengthEncoding decode:@""], @"");
}

- (void)testDecodeSingleCharactersOnly {
    XCTAssertEqualObjects([RunLengthEncoding decode:@"XYZ"], @"XYZ");
}

- (void)testDecodeStringWithNoSingleCharacters {
    XCTAssertEqualObjects([RunLengthEncoding decode:@"2A3B4C"], @"AABBBCCCC");
}

- (void)testDecodeSingleCharactersWithRepeatedCharacters {
    XCTAssertEqualObjects([RunLengthEncoding decode:@"12WB12W3B24WB"], @"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB");
}

- (void)testDecodeMultipleWhitespaceMixedInString {
    XCTAssertEqualObjects([RunLengthEncoding decode:@"2 hs2q q2w2 "], @"  hsqq qww  ");
}

- (void)testDecodeLowercaseString {
    XCTAssertEqualObjects([RunLengthEncoding decode:@"2a3b4c"], @"aabbbcccc");
}

@end
