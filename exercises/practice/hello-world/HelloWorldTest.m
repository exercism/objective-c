#import <XCTest/XCTest.h>

#if __has_include("HelloWorldExample.h")
# import "HelloWorldExample.h"
#else
# import "HelloWorld.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HelloWorldTest : XCTestCase

@end

@implementation HelloWorldTest

- (void)testSayHi {
    NSString *expected = @"Hello, World!";
    NSString *result = [[[HelloWorld alloc] init] hello];
    XCTAssertEqualObjects(expected, result);
}

@end

NS_ASSUME_NONNULL_END
