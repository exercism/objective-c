#import "ScrabbleScoreExample.h"

NSDictionary<NSString *, NSNumber *> *letterScores;

@implementation ScrabbleScore

+ (void)initialize {
    [super initialize];
    
    if (!letterScores) {
        letterScores =
        @{@"a" : @1, @"e" : @1, @"i" : @1, @"o" : @1, @"u" : @1, @"l" : @1, @"n" : @1, @"r" : @1, @"s" : @1, @"t" : @1,
          @"d" : @2, @"g" : @2,
          @"b" : @3, @"c" : @3, @"m" : @3, @"p" : @3,
          @"f" : @4, @"h" : @4, @"v" : @4, @"w" : @4, @"y" : @4,
          @"k" : @5,
          @"j" : @8, @"x" : @8,
          @"q" : @10, @"z" : @10};
    }
}

+ (int)score:(NSString *)word {
    return [self calculateScoreForWord:word];
}

- (instancetype)initWithWord:(NSString *)word {
    if (self = [super init]) {
        _score = [[self class] calculateScoreForWord:word];
    }
    
    return self;
}

+ (int)calculateScoreForWord:(NSString *)word {
    int score = 0;
    
    for (int i = 0; i < word.length; i++) {
        unichar character = [word characterAtIndex:i];
        
        NSString *letter = [[NSString stringWithFormat: @"%C", character] lowercaseString];
        NSNumber *value = letterScores[letter];
        
        if (value) {
            score += value.intValue;
        }
    }
    
    return score;
}

@end
