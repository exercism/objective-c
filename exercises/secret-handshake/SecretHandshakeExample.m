#import "SecretHandshakeExample.h"

@implementation SecretHandshake

- (instancetype)initWithNumber:(int)number {
    if (self = [super init]) {
        _commands = [[self class] commandsForNumber:number];
    }
    
    return self;
}

+ (NSArray<NSString *> *)commandsForNumber:(int)number {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if (number & 1 << 0) {
        [result addObject:@"wink"];
    }
    
    if (number & 1 << 1) {
        [result addObject:@"double blink"];
    }
    
    if (number & 1 << 2) {
        [result addObject:@"close your eyes"];
    }
    
    if (number & 1 << 3) {
        [result addObject:@"jump"];
    }
    
    if (number & 1 << 4) {
        return [[result reverseObjectEnumerator] allObjects];
    } else {
        return result;
    }
}

@end
