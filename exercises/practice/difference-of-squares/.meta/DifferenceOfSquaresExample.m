#import "DifferenceOfSquaresExample.h"

@implementation DifferenceOfSquares {
    int _max;
}

- (instancetype)initWithMax:(int)max {
    if (self = [super init]) {
        _max = max;
    }
    
    return self;
}

- (int)squareOfSum {
    int sum = 0;
    for (int i = 1; i <= _max; i++) {
        sum += i;
    }
    
    return sum * sum;
}

- (int)sumOfSquares {
    int sum = 0;
    for (int i = 1; i <= _max; i++) {
        sum += i * i;
    }
    
    return sum;
}

- (int)differenceOfSquares {
    return [self squareOfSum] - [self sumOfSquares];
}

@end
