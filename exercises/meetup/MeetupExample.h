#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MeetupDayOfWeek) {
    MeetupDayOfWeekSunday,
    MeetupDayOfWeekMonday,
    MeetupDayOfWeekTuesday,
    MeetupDayOfWeekWednesday,
    MeetupDayOfWeekThursday,
    MeetupDayOfWeekFriday,
    MeetupDayOfWeekSaturday
};

typedef NS_ENUM(NSInteger, MeetupOptions) {
    MeetupOptionsFirst,
    MeetupOptionsSecond,
    MeetupOptionsThird,
    MeetupOptionsFourth,
    MeetupOptionsLast,
    MeetupOptionsTeenth
};

@interface Meetup : NSObject

- (instancetype)initWithYear:(int)year andMonth:(int)month;
- (NSDate *)dayForDayOfWeek:(MeetupDayOfWeek)dayOfWeek andOptions:(MeetupOptions)options;

@end
