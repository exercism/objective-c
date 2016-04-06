#import <XCTest/XCTest.h>
#if __has_include("Leap.h")
# import "Leap.h"
# else
# import "LeapExample.h"
#endif


@interface LeapTest : XCTestCase

@end

@implementation LeapTest

- (void)testVanillaLeapYear {
  Year *year = [[Year alloc] initWithCalendarYear:@1996];
  XCTAssert([year isLeapYear]);
}

- (void)testAnyOldYear {
  Year *year = [[Year alloc] initWithCalendarYear:@1997];
  XCTAssertFalse([year isLeapYear]);
}

- (void)testCentury {
  Year *year = [[Year alloc] initWithCalendarYear:@1900];
  XCTAssertFalse([year isLeapYear]);
}

- (void)testExceptionalCentury {
  Year *year = [[Year alloc] initWithCalendarYear:@2400];
  XCTAssert([year isLeapYear]);
}

@end
