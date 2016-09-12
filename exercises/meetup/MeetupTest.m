#import <XCTest/XCTest.h>

#if __has_include("MeetupExample.h")
# import "MeetupExample.h"
# else
# import "Meetup.h"
#endif

@interface MeetupTest : XCTestCase

@end

@implementation MeetupTest

- (void)testMonteenthOfMay2013 {
    NSDate *date = [[[Meetup alloc] initWithYear:2013 andMonth:5]
                    dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects(date, [self dateForMonth:5 day:13 year:2013]);
}

- (void)testSaturteenthOfFebruary2013 {
    NSDate *date = [[[Meetup alloc] initWithYear:2013 andMonth:2]
                    dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects(date, [self dateForMonth:2 day:16 year:2013]);
}

- (void)testFirstTuesdayOfMay2013 {
    NSDate *date = [[[Meetup alloc] initWithYear:2013 andMonth:5]
                    dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects(date, [self dateForMonth:5 day:7 year:2013]);
}

- (void)testSecondMondayOfApril2013 {
    NSDate *date = [[[Meetup alloc] initWithYear:2013 andMonth:4]
                    dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects(date, [self dateForMonth:4 day:8 year:2013]);
}

- (void)testThirdThursdayOfSeptember2013 {
    NSDate *date = [[[Meetup alloc] initWithYear:2013 andMonth:9]
                    dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects(date, [self dateForMonth:9 day:19 year:2013]);
}

- (void)testFourthSundayOfMarch2013 {
    NSDate *date = [[[Meetup alloc] initWithYear:2013 andMonth:3]
                    dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects(date, [self dateForMonth:3 day:24 year:2013]);
}

- (void)testLastThursdayOfOctober2013 {
    NSDate *date = [[[Meetup alloc] initWithYear:2013 andMonth:10]
                    dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects(date, [self dateForMonth:10 day:31 year:2013]);
}

- (void)testLastWednesdayOfFebruary2012 {
    NSDate *date = [[[Meetup alloc] initWithYear:2012 andMonth:2]
                    dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects(date, [self dateForMonth:2 day:29 year:2012]);
}

- (void)testFirstFridayOfDecember2012 {
    NSDate *date = [[[Meetup alloc] initWithYear:2012 andMonth:12]
                    dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects(date, [self dateForMonth:12 day:7 year:2012]);
}

#pragma mark - Helper method

- (NSDate *)dateForMonth:(int)month day:(int)day year:(int)year {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = month;
    components.day = day;
    components.year = year;
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

@end
