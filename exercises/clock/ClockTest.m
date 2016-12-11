#import <XCTest/XCTest.h>

#if __has_include("ClockExample.h")
# import "ClockExample.h"
# else
# import "Clock.h"
#endif

@interface ClockTest : XCTestCase

@end

@implementation ClockTest //!OCLint

#pragma mark - Create: Test creating a new clock with an initial time.

- (void)testOnTheHour {
    XCTAssertEqualObjects(@"08:00", [[Clock clockWithHours:8] description]);
}

- (void)testPastTheHour {
    XCTAssertEqualObjects(@"11:09", [[Clock clockWithHours:11 minutes:9] description]);
}

- (void)testMidnightIsZeroHours {
    XCTAssertEqualObjects(@"00:00", [[Clock clockWithHours:24] description]);
}

- (void)testHourRollsOver {
    XCTAssertEqualObjects(@"01:00", [[Clock clockWithHours:25] description]);
}

- (void)testHourRollsOverContinuously {
    XCTAssertEqualObjects(@"04:00", [[Clock clockWithHours:100] description]);
}

- (void)testSixtyMinutesIsNextHour {
    XCTAssertEqualObjects(@"02:00", [[Clock clockWithHours:1 minutes:60] description]);
}

- (void)testMinutesRollOver {
    XCTAssertEqualObjects(@"02:40", [[Clock clockWithHours:0 minutes:160] description]);
}

- (void)testMinutesRollOverContinuously {
    XCTAssertEqualObjects(@"04:43", [[Clock clockWithHours:0 minutes:1723] description]);
}

- (void)testHoursAndMinutesRollOver {
    XCTAssertEqualObjects(@"11:01", [[Clock clockWithHours:201 minutes:3001] description]);
}

- (void)testHoursAndMinutesRollOverToExactlyMidnight {
    XCTAssertEqualObjects(@"00:00", [[Clock clockWithHours:72 minutes:8640] description]);
}

- (void)testNegativeHour {
    XCTAssertEqualObjects(@"23:15", [[Clock clockWithHours:-1 minutes:15] description]);
}

- (void)testNegativeHourRollsOver {
    XCTAssertEqualObjects(@"23:00", [[Clock clockWithHours:-25] description]);
}

- (void)testNegativeHourRollsOverContinuously {
    XCTAssertEqualObjects(@"05:00", [[Clock clockWithHours:-91] description]);
}

- (void)testNegativeMinutes {
    XCTAssertEqualObjects(@"00:20", [[Clock clockWithHours:1 minutes:-40] description]);
}

- (void)testNegativeMinutesRollOver {
    XCTAssertEqualObjects(@"22:20", [[Clock clockWithHours:1 minutes:-160] description]);
}

- (void)testNegativeMinutesRollOverContinuously {
    XCTAssertEqualObjects(@"16:40", [[Clock clockWithHours:1 minutes:-4820] description]);
}

- (void)testNegativeHoursAndMinutesBothRollOverContinuously {
    XCTAssertEqualObjects(@"22:10", [[Clock clockWithHours:-121 minutes:-5810] description]);
}

//#pragma mark - Add: Test adding and subtracting minutes.

- (void)testAddMinutes {
    Clock *clock = [[Clock clockWithHours:10] addMinutes:3];
    XCTAssertEqualObjects(@"10:03", clock.description);
}

- (void)testAddNoMinutes {
    Clock *clock = [[Clock clockWithHours:6 minutes:41] addMinutes:0];
    XCTAssertEqualObjects(@"06:41", clock.description);
}

- (void)testAddToNextHour {
    Clock *clock = [[Clock clockWithHours:0 minutes:45] addMinutes:40];
    XCTAssertEqualObjects(@"01:25", clock.description);
}

- (void)testAddMoreThanOneHour {
    Clock *clock = [[Clock clockWithHours:10] addMinutes:61];
    XCTAssertEqualObjects(@"11:01", clock.description);
}

- (void)testAddMoreThanTwoHoursWithCarry {
    Clock *clock = [[Clock clockWithHours:0 minutes:45] addMinutes:160];
    XCTAssertEqualObjects(@"03:25", clock.description);
}

- (void)testAddAcrossMidnight {
    Clock *clock = [[Clock clockWithHours:23 minutes:59] addMinutes:2];
    XCTAssertEqualObjects(@"00:01", clock.description);
}

- (void)testAddMoreThanOneDay {
    // (1500 min = 25 hrs)
    Clock *clock = [[Clock clockWithHours:5 minutes:32] addMinutes:1500];
    XCTAssertEqualObjects(@"06:32", clock.description);
}

- (void)testAddMoreThanTwoDays {
    Clock *clock = [[Clock clockWithHours:1 minutes:1] addMinutes:3500];
    XCTAssertEqualObjects(@"11:21", clock.description);
}

- (void)testSubtractMinutes {
    Clock *clock = [[Clock clockWithHours:10 minutes:3] subtractMinutes:3];
    XCTAssertEqualObjects(@"10:00", clock.description);
}

- (void)testSubtractToPreviousHour {
    Clock *clock = [[Clock clockWithHours:10 minutes:3] subtractMinutes:30];
    XCTAssertEqualObjects(@"09:33", clock.description);
}

- (void)testSubtractMoreThanAnHour {
    Clock *clock = [[Clock clockWithHours:10 minutes:3] subtractMinutes:70];
    XCTAssertEqualObjects(@"08:53", clock.description);
}

- (void)testSubtractAcrossMidnight {
    Clock *clock = [[Clock clockWithHours:0 minutes:3] subtractMinutes:4];
    XCTAssertEqualObjects(@"23:59", clock.description);
}

- (void)testSubtractMoreThanTwoHours {
    Clock *clock = [[Clock clockWithHours:0 minutes:0] subtractMinutes:160];
    XCTAssertEqualObjects(@"21:20", clock.description);
}

- (void)testSubtractMoreTHanTwoHoursWithBorrow {
    Clock *clock = [[Clock clockWithHours:6 minutes:15] subtractMinutes:160];
    XCTAssertEqualObjects(@"03:35", clock.description);
}

- (void)testSubtractMoreThanOneDay {
    // (1500 min = 25 hrs)
    Clock *clock = [[Clock clockWithHours:5 minutes:32] subtractMinutes:1500];
    XCTAssertEqualObjects(@"04:32", clock.description);
}

- (void)testSubtractMoreThanTwoDays {
    Clock *clock = [[Clock clockWithHours:2 minutes:20] subtractMinutes:3000];
    XCTAssertEqualObjects(@"00:20", clock.description);
}

//#pragma mark - Equal: Construct two separate clocks, set times, test if they are equal.

- (void)testClocksWithSameTime {
    Clock *clock1 = [Clock clockWithHours:15 minutes:37];
    Clock *clock2 = [Clock clockWithHours:15 minutes:37];
    XCTAssertEqualObjects(clock1, clock2);
}

- (void)testClocksAMinuteApart {
    Clock *clock1 = [Clock clockWithHours:15 minutes:36];
    Clock *clock2 = [Clock clockWithHours:15 minutes:37];
    XCTAssertNotEqual(clock1, clock2);
}

- (void)testClocksAnHourApart {
    Clock *clock1 = [Clock clockWithHours:14 minutes:37];
    Clock *clock2 = [Clock clockWithHours:15 minutes:37];
    XCTAssertNotEqual(clock1, clock2);
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

@end
