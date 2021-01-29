#import "ClockExample.h"

@interface Clock ()

@property (nonatomic, assign) int hours;
@property (nonatomic, assign) int minutes;

@end

@implementation Clock

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
    if (self.minutes >= 60) {
        self.hours += self.minutes / 60;
        self.minutes = self.minutes % 60;
    }
    
    while (self.minutes < 0) {
        self.hours -= 1;
        self.minutes += 60;
    }
    
    if (self.hours >= 24) {
        self.hours = self.hours % 24;
    }
    
    while (self.hours < 0) {
        self.hours += 24;
    }
}

- (Clock *)addMinutes:(int)minutes {
    return [Clock clockWithHours: self.hours minutes: self.minutes + minutes];
}

- (Clock *)subtractMinutes:(int)minutes {
    return [self addMinutes:-minutes];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%.2d:%.2d", self.hours, self.minutes];
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

-(NSUInteger)hash {
    return [[self description] hash];
}

@end
