#import "ClockExample.h"

@implementation Clock {
    int _hours, _minutes;
}

+ (Clock *)clockWithHours:(int)hours minutes:(int)minutes {
    return [[Clock alloc] initWithHours:hours minutes:minutes];
}

+ (Clock *)clockWithHours:(int)hours {
    return [[Clock alloc] initWithHours:hours minutes:0];
}

- (instancetype)initWithHours:(int)hours minutes:(int)minutes {
    if (self = [super init]) {
        _hours = hours;
        _minutes = minutes;
        [self normalize];
    }
    
    return self;
}

- (void)normalize {
    if (_minutes >= 60) {
        _hours += _minutes / 60;
        _minutes = _minutes % 60;
    }
    
    while (_minutes < 0) {
        _hours -= 1;
        _minutes += 60;
    }
    
    if (_hours >= 24) {
        _hours = _hours % 24;
    }
    
    while (_hours < 0) {
        _hours += 24;
    }
}

- (Clock *)addMinutes:(int)minutes {
    return [Clock clockWithHours: _hours minutes: _minutes + minutes];
}

- (Clock *)subtractMinutes:(int)minutes {
    return [self addMinutes:-minutes];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%.2d:%.2d", _hours, _minutes];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[Clock class]]) {
        return NO;
    }
    
    return [self isEqualToClock:(Clock *)object];
}

- (BOOL)isEqualToClock:(Clock *)clock {
    return [[self description] isEqualToString:[clock description]];
}

@end
