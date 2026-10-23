#import <XCTest/XCTest.h>

#if __has_include("ClockExample.h")
# import "ClockExample.h"
#else
# import "Clock.h"
#endif

@interface ClockTest : XCTestCase

@end

@implementation ClockTest

- (void)testOnTheHour {
    Clock *clock = [Clock clockWithHours:8 minutes:0];
    XCTAssertEqualObjects(@"08:00", [clock description]);
}

- (void)testPastTheHour {
    Clock *clock = [Clock clockWithHours:11 minutes:9];
    XCTAssertEqualObjects(@"11:09", [clock description]);
}

- (void)testMidnightIsZeroHours {
    Clock *clock = [Clock clockWithHours:24 minutes:0];
    XCTAssertEqualObjects(@"00:00", [clock description]);
}

- (void)testHourRollsOver {
    Clock *clock = [Clock clockWithHours:25 minutes:0];
    XCTAssertEqualObjects(@"01:00", [clock description]);
}

- (void)testHourRollsOverContinuously {
    Clock *clock = [Clock clockWithHours:100 minutes:0];
    XCTAssertEqualObjects(@"04:00", [clock description]);
}

- (void)testSixtyMinutesIsNextHour {
    Clock *clock = [Clock clockWithHours:1 minutes:60];
    XCTAssertEqualObjects(@"02:00", [clock description]);
}

- (void)testMinutesRollOver {
    Clock *clock = [Clock clockWithHours:0 minutes:160];
    XCTAssertEqualObjects(@"02:40", [clock description]);
}

- (void)testMinutesRollOverContinuously {
    Clock *clock = [Clock clockWithHours:0 minutes:1723];
    XCTAssertEqualObjects(@"04:43", [clock description]);
}

- (void)testHourAndMinutesRollOver {
    Clock *clock = [Clock clockWithHours:25 minutes:160];
    XCTAssertEqualObjects(@"03:40", [clock description]);
}

- (void)testHourAndMinutesRollOverContinuously {
    Clock *clock = [Clock clockWithHours:201 minutes:3001];
    XCTAssertEqualObjects(@"11:01", [clock description]);
}

- (void)testHourAndMinutesRollOverToExactlyMidnight {
    Clock *clock = [Clock clockWithHours:72 minutes:8640];
    XCTAssertEqualObjects(@"00:00", [clock description]);
}

- (void)testNegativeHour {
    Clock *clock = [Clock clockWithHours:-1 minutes:15];
    XCTAssertEqualObjects(@"23:15", [clock description]);
}

- (void)testNegativeHourRollsOver {
    Clock *clock = [Clock clockWithHours:-25 minutes:0];
    XCTAssertEqualObjects(@"23:00", [clock description]);
}

- (void)testNegativeHourRollsOverContinuously {
    Clock *clock = [Clock clockWithHours:-91 minutes:0];
    XCTAssertEqualObjects(@"05:00", [clock description]);
}

- (void)testNegativeMinutes {
    Clock *clock = [Clock clockWithHours:1 minutes:-40];
    XCTAssertEqualObjects(@"00:20", [clock description]);
}

- (void)testNegativeMinutesRollOver {
    Clock *clock = [Clock clockWithHours:1 minutes:-160];
    XCTAssertEqualObjects(@"22:20", [clock description]);
}

- (void)testNegativeMinutesRollOverContinuously {
    Clock *clock = [Clock clockWithHours:1 minutes:-4820];
    XCTAssertEqualObjects(@"16:40", [clock description]);
}

- (void)testNegativeSixtyMinutesIsPreviousHour {
    Clock *clock = [Clock clockWithHours:2 minutes:-60];
    XCTAssertEqualObjects(@"01:00", [clock description]);
}

- (void)testNegativeHourAndMinutesBothRollOver {
    Clock *clock = [Clock clockWithHours:-25 minutes:-160];
    XCTAssertEqualObjects(@"20:20", [clock description]);
}

- (void)testNegativeHourAndMinutesBothRollOverContinuously {
    Clock *clock = [Clock clockWithHours:-121 minutes:-5810];
    XCTAssertEqualObjects(@"22:10", [clock description]);
}

- (void)testAddMinutes {
    Clock *clock = [Clock clockWithHours:10 minutes:0];
    clock = [clock addMinutes:3];
    XCTAssertEqualObjects(@"10:03", [clock description]);
}

- (void)testAddNoMinutes {
    Clock *clock = [Clock clockWithHours:6 minutes:41];
    clock = [clock addMinutes:0];
    XCTAssertEqualObjects(@"06:41", [clock description]);
}

- (void)testAddToNextHour {
    Clock *clock = [Clock clockWithHours:0 minutes:45];
    clock = [clock addMinutes:40];
    XCTAssertEqualObjects(@"01:25", [clock description]);
}

- (void)testAddMoreThanOneHour {
    Clock *clock = [Clock clockWithHours:10 minutes:0];
    clock = [clock addMinutes:61];
    XCTAssertEqualObjects(@"11:01", [clock description]);
}

- (void)testAddMoreThanTwoHoursWithCarry {
    Clock *clock = [Clock clockWithHours:0 minutes:45];
    clock = [clock addMinutes:160];
    XCTAssertEqualObjects(@"03:25", [clock description]);
}

- (void)testAddAcrossMidnight {
    Clock *clock = [Clock clockWithHours:23 minutes:59];
    clock = [clock addMinutes:2];
    XCTAssertEqualObjects(@"00:01", [clock description]);
}

- (void)testAddMoreThanOneDay1500Min25Hrs {
    Clock *clock = [Clock clockWithHours:5 minutes:32];
    clock = [clock addMinutes:1500];
    XCTAssertEqualObjects(@"06:32", [clock description]);
}

- (void)testAddMoreThanTwoDays {
    Clock *clock = [Clock clockWithHours:1 minutes:1];
    clock = [clock addMinutes:3500];
    XCTAssertEqualObjects(@"11:21", [clock description]);
}

- (void)testSubtractMinutes {
    Clock *clock = [Clock clockWithHours:10 minutes:3];
    clock = [clock subtractMinutes:3];
    XCTAssertEqualObjects(@"10:00", [clock description]);
}

- (void)testSubtractToPreviousHour {
    Clock *clock = [Clock clockWithHours:10 minutes:3];
    clock = [clock subtractMinutes:30];
    XCTAssertEqualObjects(@"09:33", [clock description]);
}

- (void)testSubtractMoreThanAnHour {
    Clock *clock = [Clock clockWithHours:10 minutes:3];
    clock = [clock subtractMinutes:70];
    XCTAssertEqualObjects(@"08:53", [clock description]);
}

- (void)testSubtractAcrossMidnight {
    Clock *clock = [Clock clockWithHours:0 minutes:3];
    clock = [clock subtractMinutes:4];
    XCTAssertEqualObjects(@"23:59", [clock description]);
}

- (void)testSubtractMoreThanTwoHours {
    Clock *clock = [Clock clockWithHours:0 minutes:0];
    clock = [clock subtractMinutes:160];
    XCTAssertEqualObjects(@"21:20", [clock description]);
}

- (void)testSubtractMoreThanTwoHoursWithBorrow {
    Clock *clock = [Clock clockWithHours:6 minutes:15];
    clock = [clock subtractMinutes:160];
    XCTAssertEqualObjects(@"03:35", [clock description]);
}

- (void)testSubtractMoreThanOneDay1500Min25Hrs {
    Clock *clock = [Clock clockWithHours:5 minutes:32];
    clock = [clock subtractMinutes:1500];
    XCTAssertEqualObjects(@"04:32", [clock description]);
}

- (void)testSubtractMoreThanTwoDays {
    Clock *clock = [Clock clockWithHours:2 minutes:20];
    clock = [clock subtractMinutes:3000];
    XCTAssertEqualObjects(@"00:20", [clock description]);
}

- (void)testClocksWithSameTime {
    Clock *clock1 = [Clock clockWithHours:15 minutes:37];
    Clock *clock2 = [Clock clockWithHours:15 minutes:37];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksAMinuteApart {
    Clock *clock1 = [Clock clockWithHours:15 minutes:36];
    Clock *clock2 = [Clock clockWithHours:15 minutes:37];
    XCTAssertNotEqualObjects(clock1, clock2);
}

- (void)testClocksAnHourApart {
    Clock *clock1 = [Clock clockWithHours:14 minutes:37];
    Clock *clock2 = [Clock clockWithHours:15 minutes:37];
    XCTAssertNotEqualObjects(clock1, clock2);
}

- (void)testClocksWithHourOverflow {
    Clock *clock1 = [Clock clockWithHours:10 minutes:37];
    Clock *clock2 = [Clock clockWithHours:34 minutes:37];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithHourOverflowBySeveralDays {
    Clock *clock1 = [Clock clockWithHours:3 minutes:11];
    Clock *clock2 = [Clock clockWithHours:99 minutes:11];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithNegativeHour {
    Clock *clock1 = [Clock clockWithHours:22 minutes:40];
    Clock *clock2 = [Clock clockWithHours:-2 minutes:40];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithNegativeHourThatWraps {
    Clock *clock1 = [Clock clockWithHours:17 minutes:3];
    Clock *clock2 = [Clock clockWithHours:-31 minutes:3];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithNegativeHourThatWrapsMultipleTimes {
    Clock *clock1 = [Clock clockWithHours:13 minutes:49];
    Clock *clock2 = [Clock clockWithHours:-83 minutes:49];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithMinuteOverflow {
    Clock *clock1 = [Clock clockWithHours:0 minutes:1];
    Clock *clock2 = [Clock clockWithHours:0 minutes:1441];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithMinuteOverflowBySeveralDays {
    Clock *clock1 = [Clock clockWithHours:2 minutes:2];
    Clock *clock2 = [Clock clockWithHours:2 minutes:4322];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithNegativeMinute {
    Clock *clock1 = [Clock clockWithHours:2 minutes:40];
    Clock *clock2 = [Clock clockWithHours:3 minutes:-20];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithNegativeMinuteThatWraps {
    Clock *clock1 = [Clock clockWithHours:4 minutes:10];
    Clock *clock2 = [Clock clockWithHours:5 minutes:-1490];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithNegativeMinuteThatWrapsMultipleTimes {
    Clock *clock1 = [Clock clockWithHours:6 minutes:15];
    Clock *clock2 = [Clock clockWithHours:6 minutes:-4305];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithNegativeHoursAndMinutes {
    Clock *clock1 = [Clock clockWithHours:7 minutes:32];
    Clock *clock2 = [Clock clockWithHours:-12 minutes:-268];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksWithNegativeHoursAndMinutesThatWrap {
    Clock *clock1 = [Clock clockWithHours:18 minutes:7];
    Clock *clock2 = [Clock clockWithHours:-54 minutes:-11513];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testFullClockAndZeroedClock {
    Clock *clock1 = [Clock clockWithHours:24 minutes:0];
    Clock *clock2 = [Clock clockWithHours:0 minutes:0];
    XCTAssertEqualObjects(clock1, clock2);
}

@end
