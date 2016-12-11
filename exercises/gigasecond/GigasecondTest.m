#import <XCTest/XCTest.h>

#if __has_include("GigasecondExample.h")
# import "GigasecondExample.h"
# else
# import "Gigasecond.h"
#endif

@interface GigasecondTest : XCTestCase

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation GigasecondTest

- (void)setUp {
    [super setUp];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
}

- (void)test1 {
    NSDate *startDate = [self.dateFormatter dateFromString:@"2011-04-25T00:00:00"];
    Gigasecond *gigasecond = [[Gigasecond alloc] initWithStartDate:startDate];
    NSDate *expectedDate = [self.dateFormatter dateFromString:@"2043-01-01T01:46:40"];
    XCTAssertEqualObjects(expectedDate, [gigasecond gigasecondDate]);
}

- (void)test2 {
    NSDate *startDate = [self.dateFormatter dateFromString:@"1977-06-13T00:00:00"];
    Gigasecond *gigasecond = [[Gigasecond alloc] initWithStartDate:startDate];
    NSDate *expectedDate = [self.dateFormatter dateFromString:@"2009-02-19T01:46:40"];
    XCTAssertEqualObjects(expectedDate, [gigasecond gigasecondDate]);
}

- (void)test3 {
    NSDate *startDate = [self.dateFormatter dateFromString:@"1959-07-19T00:00:00"];
    Gigasecond *gigasecond = [[Gigasecond alloc] initWithStartDate:startDate];
    NSDate *expectedDate = [self.dateFormatter dateFromString:@"1991-03-27T01:46:40"];
    XCTAssertEqualObjects(expectedDate, [gigasecond gigasecondDate]);
}

- (void)test24HourTime {
    NSDate *startDate = [self.dateFormatter dateFromString:@"2015-01-24T22:00:00"];
    Gigasecond *gigasecond = [[Gigasecond alloc] initWithStartDate:startDate];
    NSDate *expectedDate = [self.dateFormatter dateFromString:@"2046-10-02T23:46:40"];
    XCTAssertEqualObjects(expectedDate, [gigasecond gigasecondDate]);
}

- (void)testTimeWithSeconds {
    NSDate *startDate = [self.dateFormatter dateFromString:@"1959-07-19T23:59:59"];
    Gigasecond *gigasecond = [[Gigasecond alloc] initWithStartDate:startDate];
    NSDate *expectedDate = [self.dateFormatter dateFromString:@"1991-03-28T01:46:39"];
    XCTAssertEqualObjects(expectedDate, [gigasecond gigasecondDate]);
}

- (void)testFullTimeWithDayRollOver {
    NSDate *startDate = [self.dateFormatter dateFromString:@"2015-01-24T23:59:59"];
    Gigasecond *gigasecond = [[Gigasecond alloc] initWithStartDate:startDate];
    NSDate *expectedDate = [self.dateFormatter dateFromString:@"2046-10-03T01:46:39"];
    XCTAssertEqualObjects(expectedDate, [gigasecond gigasecondDate]);
}

@end
