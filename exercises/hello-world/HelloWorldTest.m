#import <XCTest/XCTest.h>

#if __has_include("HelloWorldExample.h")
# import "HelloWorldExample.h"
# else
# import "HelloWorld.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HelloWorldTest : XCTestCase

@end

@implementation HelloWorldTest

- (HelloWorld *)helloWorld {
  return [[HelloWorld alloc] init];
}

- (void)testNoName {
  NSString *input = nil;
  NSString *expected = @"Hello, World!";
  NSString *result = [[self helloWorld] hello:input];
  XCTAssertEqualObjects(expected, result);
}

- (void)testSampleName {
  NSString *input = @"Alice";
  NSString *expected = @"Hello, Alice!";
  NSString *result = [[self helloWorld] hello:input];
  XCTAssertEqualObjects(expected, result);
}
  
- (void)testOtherSampleName {
  NSString *input = @"Bob";
  NSString *expected = @"Hello, Bob!";
  NSString *result = [[self helloWorld] hello:input];
  XCTAssertEqualObjects(expected, result);
}

@end
NS_ASSUME_NONNULL_END
