#import <XCTest/XCTest.h>

#if __has_include("MeetupExample.h")
# import "MeetupExample.h"
#else
# import "Meetup.h"
#endif

@interface MeetupTest : XCTestCase

@end

@implementation MeetupTest

- (void)testWhenTeenthMondayIsThe13ThTheFirstDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:5];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:5 day:13], actual);
}

- (void)testWhenTeenthMondayIsThe19ThTheLastDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:8];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:8 day:19], actual);
}

- (void)testWhenTeenthMondayIsSomeDayInTheMiddleOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:9];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:9 day:16], actual);
}

- (void)testWhenTeenthTuesdayIsThe19ThTheLastDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:19], actual);
}

- (void)testWhenTeenthTuesdayIsSomeDayInTheMiddleOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:16], actual);
}

- (void)testWhenTeenthTuesdayIsThe13ThTheFirstDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:8];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:8 day:13], actual);
}

- (void)testWhenTeenthWednesdayIsSomeDayInTheMiddleOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:1];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:1 day:16], actual);
}

- (void)testWhenTeenthWednesdayIsThe13ThTheFirstDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:2 day:13], actual);
}

- (void)testWhenTeenthWednesdayIsThe19ThTheLastDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:6];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:6 day:19], actual);
}

- (void)testWhenTeenthThursdayIsSomeDayInTheMiddleOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:5];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:5 day:16], actual);
}

- (void)testWhenTeenthThursdayIsThe13ThTheFirstDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:6];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:6 day:13], actual);
}

- (void)testWhenTeenthThursdayIsThe19ThTheLastDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:9];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:9 day:19], actual);
}

- (void)testWhenTeenthFridayIsThe19ThTheLastDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:19], actual);
}

- (void)testWhenTeenthFridayIsSomeDayInTheMiddleOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:8];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:8 day:16], actual);
}

- (void)testWhenTeenthFridayIsThe13ThTheFirstDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:9];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:9 day:13], actual);
}

- (void)testWhenTeenthSaturdayIsSomeDayInTheMiddleOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:2 day:16], actual);
}

- (void)testWhenTeenthSaturdayIsThe13ThTheFirstDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:13], actual);
}

- (void)testWhenTeenthSaturdayIsThe19ThTheLastDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:10];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:10 day:19], actual);
}

- (void)testWhenTeenthSundayIsThe19ThTheLastDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:5];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:5 day:19], actual);
}

- (void)testWhenTeenthSundayIsSomeDayInTheMiddleOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:6];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:6 day:16], actual);
}

- (void)testWhenTeenthSundayIsThe13ThTheFirstDayOfTheTeenthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:10];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsTeenth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:10 day:13], actual);
}

- (void)testWhenFirstMondayIsSomeDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:4], actual);
}

- (void)testWhenFirstMondayIsThe1StTheFirstDayOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:1], actual);
}

- (void)testWhenFirstTuesdayIsThe7ThTheLastDayOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:5];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:5 day:7], actual);
}

- (void)testWhenFirstTuesdayIsSomeDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:6];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:6 day:4], actual);
}

- (void)testWhenFirstWednesdayIsSomeDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:7];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:7 day:3], actual);
}

- (void)testWhenFirstWednesdayIsThe7ThTheLastDayOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:8];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:8 day:7], actual);
}

- (void)testWhenFirstThursdayIsSomeDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:9];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:9 day:5], actual);
}

- (void)testWhenFirstThursdayIsAnotherDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:10];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:10 day:3], actual);
}

- (void)testWhenFirstFridayIsThe1StTheFirstDayOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:11];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:11 day:1], actual);
}

- (void)testWhenFirstFridayIsSomeDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:12];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:12 day:6], actual);
}

- (void)testWhenFirstSaturdayIsSomeDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:1];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:1 day:5], actual);
}

- (void)testWhenFirstSaturdayIsAnotherDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:2 day:2], actual);
}

- (void)testWhenFirstSundayIsSomeDayInTheMiddleOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:3], actual);
}

- (void)testWhenFirstSundayIsThe7ThTheLastDayOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:7], actual);
}

- (void)testWhenSecondMondayIsSomeDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:11], actual);
}

- (void)testWhenSecondMondayIsThe8ThTheFirstDayOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:8], actual);
}

- (void)testWhenSecondTuesdayIsThe14ThTheLastDayOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:5];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:5 day:14], actual);
}

- (void)testWhenSecondTuesdayIsSomeDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:6];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:6 day:11], actual);
}

- (void)testWhenSecondWednesdayIsSomeDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:7];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:7 day:10], actual);
}

- (void)testWhenSecondWednesdayIsThe14ThTheLastDayOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:8];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:8 day:14], actual);
}

- (void)testWhenSecondThursdayIsSomeDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:9];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:9 day:12], actual);
}

- (void)testWhenSecondThursdayIsAnotherDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:10];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:10 day:10], actual);
}

- (void)testWhenSecondFridayIsThe8ThTheFirstDayOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:11];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:11 day:8], actual);
}

- (void)testWhenSecondFridayIsSomeDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:12];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:12 day:13], actual);
}

- (void)testWhenSecondSaturdayIsSomeDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:1];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:1 day:12], actual);
}

- (void)testWhenSecondSaturdayIsAnotherDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:2 day:9], actual);
}

- (void)testWhenSecondSundayIsSomeDayInTheMiddleOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:10], actual);
}

- (void)testWhenSecondSundayIsThe14ThTheLastDayOfTheSecondWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsSecond];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:14], actual);
}

- (void)testWhenThirdMondayIsSomeDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:18], actual);
}

- (void)testWhenThirdMondayIsThe15ThTheFirstDayOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:15], actual);
}

- (void)testWhenThirdTuesdayIsThe21StTheLastDayOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:5];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:5 day:21], actual);
}

- (void)testWhenThirdTuesdayIsSomeDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:6];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:6 day:18], actual);
}

- (void)testWhenThirdWednesdayIsSomeDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:7];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:7 day:17], actual);
}

- (void)testWhenThirdWednesdayIsThe21StTheLastDayOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:8];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:8 day:21], actual);
}

- (void)testWhenThirdThursdayIsSomeDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:9];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:9 day:19], actual);
}

- (void)testWhenThirdThursdayIsAnotherDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:10];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:10 day:17], actual);
}

- (void)testWhenThirdFridayIsThe15ThTheFirstDayOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:11];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:11 day:15], actual);
}

- (void)testWhenThirdFridayIsSomeDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:12];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:12 day:20], actual);
}

- (void)testWhenThirdSaturdayIsSomeDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:1];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:1 day:19], actual);
}

- (void)testWhenThirdSaturdayIsAnotherDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:2 day:16], actual);
}

- (void)testWhenThirdSundayIsSomeDayInTheMiddleOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:17], actual);
}

- (void)testWhenThirdSundayIsThe21StTheLastDayOfTheThirdWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsThird];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:21], actual);
}

- (void)testWhenFourthMondayIsSomeDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:25], actual);
}

- (void)testWhenFourthMondayIsThe22NdTheFirstDayOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:22], actual);
}

- (void)testWhenFourthTuesdayIsThe28ThTheLastDayOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:5];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:5 day:28], actual);
}

- (void)testWhenFourthTuesdayIsSomeDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:6];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:6 day:25], actual);
}

- (void)testWhenFourthWednesdayIsSomeDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:7];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:7 day:24], actual);
}

- (void)testWhenFourthWednesdayIsThe28ThTheLastDayOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:8];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:8 day:28], actual);
}

- (void)testWhenFourthThursdayIsSomeDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:9];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:9 day:26], actual);
}

- (void)testWhenFourthThursdayIsAnotherDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:10];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:10 day:24], actual);
}

- (void)testWhenFourthFridayIsThe22NdTheFirstDayOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:11];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:11 day:22], actual);
}

- (void)testWhenFourthFridayIsSomeDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:12];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:12 day:27], actual);
}

- (void)testWhenFourthSaturdayIsSomeDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:1];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:1 day:26], actual);
}

- (void)testWhenFourthSaturdayIsAnotherDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:2 day:23], actual);
}

- (void)testWhenFourthSundayIsSomeDayInTheMiddleOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:24], actual);
}

- (void)testWhenFourthSundayIsThe28ThTheLastDayOfTheFourthWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsFourth];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:28], actual);
}

- (void)testLastMondayInAMonthWithFourMondays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:25], actual);
}

- (void)testLastMondayInAMonthWithFiveMondays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekMonday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:29], actual);
}

- (void)testLastTuesdayInAMonthWithFourTuesdays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:5];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:5 day:28], actual);
}

- (void)testLastTuesdayInAnotherMonthWithFourTuesdays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:6];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekTuesday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:6 day:25], actual);
}

- (void)testLastWednesdayInAMonthWithFiveWednesdays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:7];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:7 day:31], actual);
}

- (void)testLastWednesdayInAMonthWithFourWednesdays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:8];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:8 day:28], actual);
}

- (void)testLastThursdayInAMonthWithFourThursdays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:9];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:9 day:26], actual);
}

- (void)testLastThursdayInAMonthWithFiveThursdays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:10];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekThursday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:10 day:31], actual);
}

- (void)testLastFridayInAMonthWithFiveFridays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:11];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:11 day:29], actual);
}

- (void)testLastFridayInAMonthWithFourFridays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:12];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:12 day:27], actual);
}

- (void)testLastSaturdayInAMonthWithFourSaturdays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:1];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:1 day:26], actual);
}

- (void)testLastSaturdayInAnotherMonthWithFourSaturdays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSaturday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:2 day:23], actual);
}

- (void)testLastSundayInAMonthWithFiveSundays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:3];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:3 day:31], actual);
}

- (void)testLastSundayInAMonthWithFourSundays {
    Meetup *meetup = [[Meetup alloc] initWithYear:2013 andMonth:4];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2013 month:4 day:28], actual);
}

- (void)testWhenLastWednesdayInFebruaryInALeapYearIsThe29Th {
    Meetup *meetup = [[Meetup alloc] initWithYear:2012 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2012 month:2 day:29], actual);
}

- (void)testLastWednesdayInDecemberThatIsAlsoTheLastDayOfTheYear {
    Meetup *meetup = [[Meetup alloc] initWithYear:2014 andMonth:12];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekWednesday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2014 month:12 day:31], actual);
}

- (void)testWhenLastSundayInFebruaryInANonLeapYearIsNotThe29Th {
    Meetup *meetup = [[Meetup alloc] initWithYear:2015 andMonth:2];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekSunday andOptions:MeetupOptionsLast];
    XCTAssertEqualObjects([self dateWithYear:2015 month:2 day:22], actual);
}

- (void)testWhenFirstFridayIsThe7ThTheLastDayOfTheFirstWeek {
    Meetup *meetup = [[Meetup alloc] initWithYear:2012 andMonth:12];
    NSDate *actual = [meetup dayForDayOfWeek:MeetupDayOfWeekFriday andOptions:MeetupOptionsFirst];
    XCTAssertEqualObjects([self dateWithYear:2012 month:12 day:7], actual);
}

#pragma mark - Helper method

- (NSDate *)dateWithYear:(int)year month:(int)month day:(int)day {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = year;
    components.month = month;
    components.day = day;

    return [[NSCalendar currentCalendar] dateFromComponents:components];
}
@end
