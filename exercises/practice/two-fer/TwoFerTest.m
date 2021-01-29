#import <XCTest/XCTest.h>

#if __has_include("TwoFerExample.h")
# import "TwoFerExample.h"
# else
# import "TwoFer.h"
#endif

@interface TwoFerTest : XCTestCase

@end

@implementation TwoFerTest

NS_ASSUME_NONNULL_BEGIN
    
- (void)testNoNameGiven {
    XCTAssertEqualObjects([TwoFer twoFerWithName:nil], @"One for you, one for me.");
}

- (void)testANameGiven {
    XCTAssertEqualObjects([TwoFer twoFerWithName:@"Alice"], @"One for Alice, one for me.");
}

- (void)testAnotherNameGiven {
    XCTAssertEqualObjects([TwoFer twoFerWithName:@"Bob"], @"One for Bob, one for me.");
}

NS_ASSUME_NONNULL_END
    
@end
