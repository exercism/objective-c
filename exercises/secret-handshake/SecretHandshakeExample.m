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
    
    if (number & 1 << 0) { //!OCLINT
        [result addObject:@"wink"];
    }
    
    if (number & 1 << 1) { //!OCLINT
        [result addObject:@"double blink"];
    }
    
    if (number & 1 << 2) { //!OCLINT
        [result addObject:@"close your eyes"];
    }
    
    if (number & 1 << 3) { //!OCLINT
        [result addObject:@"jump"];
    }
    
    if (number & 1 << 4) { //!OCLINT
        return [[result reverseObjectEnumerator] allObjects];
    }
    return result;
}

@end
