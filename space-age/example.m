// place in SpaceAge.h

#import <Foundation/Foundation.h>

@interface SpaceAge : NSObject

- (instancetype)initWithSeconds:(long)seconds;
- (long)seconds;
- (double)onEarth;
- (double)onMercury;
- (double)onVenus;
- (double)onMars;
- (double)onJupiter;
- (double)onSaturn;
- (double)onUranus;
- (double)onNeptune;

@end

// place in SpaceAge.m

#import "SpaceAge.h"

@implementation SpaceAge {
    long _seconds;
    double _earthYears;
}

- (instancetype)initWithSeconds:(long)seconds {
    if (self = [super init]) {
        _seconds = seconds;
        _earthYears = seconds / 31557600.0;
    }
    
    return self;
}

- (long)seconds {
    return _seconds;
}

- (double)onEarth {
    return _earthYears;
}

- (double)onMercury {
    return _earthYears / 0.2408467;
}

- (double)onVenus {
    return _earthYears / 0.61519726;
}

- (double)onMars {
    return _earthYears / 1.8808158;
}

- (double)onJupiter {
    return _earthYears / 11.862615;
}

- (double)onSaturn {
    return _earthYears / 29.447498;
}

- (double)onUranus {
    return _earthYears / 84.016846;
}

- (double)onNeptune {
    return _earthYears / 164.79132;
}

@end
