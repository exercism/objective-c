#import "MeetupExample.h"

@implementation Meetup {
    int _year;
    int _month;
}

- (instancetype)initWithYear:(int)year andMonth:(int)month {
    if (self = [super init]) {
        _year = year;
        _month = month;
    }
    
    return self;
}

- (NSDate *)dayForDayOfWeek:(MeetupDayOfWeek)dayOfWeek andOptions:(MeetupOptions)options {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = _year;
    components.month = _month;
    
    switch (options) {
        case MeetupOptionsFirst:
            components.day = 1;
            break;
        case MeetupOptionsSecond:
            components.day = 8;
            break;
        case MeetupOptionsThird:
            components.day = 15;
            break;
        case MeetupOptionsFourth:
            components.day = 22;
            break;
        case MeetupOptionsLast:
            components.day = 0;
            components.month += 1;
            break;
        case MeetupOptionsTeenth:
            components.day = 13;
            break;
        default:
            break;
    }
    
    while ([self weekdayFromComponents:components] != dayOfWeek) {
        if (options == MeetupOptionsLast) {
            components.day -= 1;
        } else {
            components.day += 1;
        }
    }
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (long)weekdayFromComponents:(NSDateComponents *)components {
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:components];
    long weekday = [[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate:date];
    
    return weekday - 1;
}

@end
