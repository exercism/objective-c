#import <XCTest/XCTest.h>

#if __has_include("RunLengthEncodingExample.h")
# import "RunLengthEncodingExample.h"
# else
# import "RunLengthEncoding.h"
#endif

@interface RunLengthEncodingTest : XCTestCase

@end

@implementation RunLengthEncodingTest

- (void)testEncodeSimple {
    XCTAssertEqualObjects([RunLengthEncoding encode:@"AABBBCCCC"], @"2A3B4C");
}

- (void)testDecodeSimple {
    XCTAssertEqualObjects([RunLengthEncoding decode:@"2A3B4C"], @"AABBBCCCC");
}

- (void)testEncodeWithSingleValues {
    XCTAssertEqualObjects([RunLengthEncoding encode:@"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"], @"12WB12W3B24WB");
}

- (void)testDecodeWithSingleValues {
    XCTAssertEqualObjects([RunLengthEncoding decode:@"12WB12W3B24WB"], @"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB");
}

- (void)testDecodeEncodeCombination {
    XCTAssertEqualObjects([RunLengthEncoding decode:[RunLengthEncoding encode:@"zzz ZZ  zZ"]], @"zzz ZZ  zZ");
}

- (void)testEncodeUnicode {
    XCTAssertEqualObjects([RunLengthEncoding encode:@"⏰⚽⚽⚽⭐⭐⏰"], @"⏰3⚽2⭐⏰");
}

- (void)testDecodeUnicode {
    XCTAssertEqualObjects([RunLengthEncoding decode:@"⏰3⚽2⭐⏰"], @"⏰⚽⚽⚽⭐⭐⏰");
}

@end
