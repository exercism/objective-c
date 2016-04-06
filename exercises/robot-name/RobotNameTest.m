#import <XCTest/XCTest.h>
#if __has_include("RobotName.h")
# import "RobotName.h"
# else
# import "RobotNameExample.h"
#endif

@interface RobotNameTest : XCTestCase

@end

@implementation RobotNameTest

- (BOOL)string:(NSString *)string matches:(NSString *)regexString {

  NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regexString
                                                                              options:NSRegularExpressionCaseInsensitive
                                                                                error:NULL];

  NSArray *matches = [expression matchesInString:string options:0 range:NSMakeRange(0,[string length])];

  return [matches count] >= 1;
}

- (void)testHasName {
  Robot *robot = [[Robot alloc] init];

  NSString *name = [robot name];
  XCTAssert([self string:name matches:@"\\A\\w{2}\\d{3}\\z"], @"%@ is not a valid robot name", name);
}

- (void)testNameSticks {
  Robot *robot = [[Robot alloc] init];
  [robot name];
  XCTAssertEqualObjects([robot name], [robot name]);
}

- (void)testDifferentRobotsHaveDifferentNames {
  Robot *firstRobot = [[Robot alloc] init];
  Robot *secondRobot = [[Robot alloc] init];
  XCTAssertNotEqualObjects([firstRobot name], [secondRobot name]);
}

- (void)testResetName {
  Robot *robot = [[Robot alloc] init];
  NSString *firstName = [robot name];
  [robot reset];
  NSString *secondName = [robot name];

  XCTAssertNotEqualObjects(firstName, secondName);
}

@end
