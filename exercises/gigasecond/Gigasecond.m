#import "Gigasecond.h"

@implementation Gigasecond {
    NSDate *_startDate;
}

- (instancetype)initWithStartDate:(NSDate *)date {
    if (self = [super init]) {
        _startDate = date;
    }
    
    return self;
}

- (NSDate *)gigasecondDate {
    NSTimeInterval gigasecondInterval = pow(10.0, 9);
    
    return [NSDate dateWithTimeInterval:gigasecondInterval sinceDate:_startDate];
}

@end
