#import "TriangleExample.h"

@implementation Triangle

+ (TriangleKind)kindForSides:(double)a :(double)b :(double)c {
    if (a <= 0 || b <= 0 || c <= 0) {
        @throw [NSException exceptionWithName:@"Invalid triangle" reason:@"All lengths must be positive" userInfo:nil];
    } else if (a + b <= c || b + c <= a || a + c <= b) {
        @throw [NSException exceptionWithName:@"Invalid triangle" reason:@"Violation of triangle inequality" userInfo:nil];
    }
    
    if (a == b && b == c) {
        return TriangleKindEquilateral;
    } else if (a == b || b == c || a == c) {
        return TriangleKindIsosceles;
    } else {
        return TriangleKindScalene;
    }
}

@end
