#import "RaindropsExample.h"

@implementation Raindrops {
    int _number;
}

- (instancetype)initWithNumber:(int)number {
    if (self = [super init]) {
        _number = number;
    }
    
    return self;
}

- (NSString *)sounds {
    NSMutableString *result = [[NSMutableString alloc] init];
    
    if (_number % 3 == 0) {
        [result appendString:@"Pling"];
    }
    
    if (_number % 5 == 0) {
        [result appendString:@"Plang"];
    }
    
    if (_number % 7 == 0) {
        [result appendString:@"Plong"];
    }
    
    if (result.length == 0) {
        [result appendFormat:@"%d", _number];
    }
    
    return result;
}

@end
