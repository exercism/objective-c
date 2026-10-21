#import <XCTest/XCTest.h>

#if __has_include("LeapExample.h")
# import "LeapExample.h"
#else
# import "Leap.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface LeapTest : XCTestCase

@end

@implementation LeapTest

- (void)testYearNotDivisibleBy4InCommonYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@2015];
  XCTAssertFalse(year.isLeapYear);
}

- (void)testYearDivisibleBy2NotDivisibleBy4InCommonYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@1970];
  XCTAssertFalse(year.isLeapYear);
}

- (void)testYearDivisibleBy4NotDivisibleBy100InLeapYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@1996];
  XCTAssert(year.isLeapYear);
}

- (void)testYearDivisibleBy4And5IsStillALeapYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@1960];
  XCTAssert(year.isLeapYear);
}

- (void)testYearDivisibleBy100NotDivisibleBy400InCommonYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@2100];
  XCTAssertFalse(year.isLeapYear);
}

- (void)testYearDivisibleBy100ButNotBy3IsStillNotALeapYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@1900];
  XCTAssertFalse(year.isLeapYear);
}

- (void)testYearDivisibleBy400IsLeapYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@2000];
  XCTAssert(year.isLeapYear);
}

- (void)testYearDivisibleBy400ButNotBy125IsStillALeapYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@2400];
  XCTAssert(year.isLeapYear);
}

- (void)testYearDivisibleBy200NotDivisibleBy400InCommonYear {
  Leap *year = [[Leap alloc] initWithCalendarYear:@1800];
  XCTAssertFalse(year.isLeapYear);
}

@end
NS_ASSUME_NONNULL_END
