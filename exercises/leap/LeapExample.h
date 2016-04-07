#import <Foundation/Foundation.h>

@interface Year : NSObject

- (instancetype)initWithCalendarYear:(NSNumber *)calendarYear;
- (BOOL)isLeapYear;

@end