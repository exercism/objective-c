#import <Foundation/Foundation.h>

@interface Leap : NSObject

- (instancetype)initWithCalendarYear:(NSNumber *)calendarYear;
- (BOOL)isLeapYear;

@end