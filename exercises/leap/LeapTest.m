#import <XCTest/XCTest.h>

#if __has_include("LeapExample.h")
# import "LeapExample.h"
# else
# import "Leap.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface LeapTest : XCTestCase

@end

@implementation LeapTest

- (void)testVanillaLeapYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@1996];
  XCTAssert(year.isLeapYear);
}

- (void)testAnyOldYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@1997];
  XCTAssertFalse(year.isLeapYear);
}

- (void)testCentury {
  Leap *year = [[Leap alloc] initWithCalendarYear:@1900];
  XCTAssertFalse(year.isLeapYear);
}

- (void)testExceptionalCentury {
  Leap *year = [[Leap alloc] initWithCalendarYear:@2400];
  XCTAssert(year.isLeapYear);
}

@end
NS_ASSUME_NONNULL_END
