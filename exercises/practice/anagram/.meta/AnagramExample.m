#import "AnagramExample.h"
#import <Foundation/Foundation.h>

@interface Anagram ()

@property (nonatomic,strong,readwrite) NSString *baseWord;

@end

@implementation Anagram

- (instancetype)initWithString:(NSString *)string {
    
    self = [super init];
    
    if (self) {
        self.baseWord = string;
    }
    
    return self;
}

- (NSArray<NSString *> *)match:(NSArray<NSString *> *)potentialMatches {
    
    NSMutableArray<NSString *> *matches = [NSMutableArray array];
    
    [potentialMatches enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
        
        if ([self isWord:self.baseWord anagramOf:obj]) {
            [matches addObject:(NSString *)obj];
        }
        
    }];
    
    return matches;
}

- (BOOL)isWord:(NSString *)word anagramOf:(NSString *)otherWord {
    
    return ![self isString:word equalToString:otherWord ignoreCase:YES] &&
    [[self sortedLettersFor:word] isEqualToArray:[self sortedLettersFor:otherWord]];
    
}

- (BOOL)isString:(NSString *)string equalToString:(NSString *)other ignoreCase:(BOOL)ignoreCase {
    if (ignoreCase) {
        return [[string lowercaseString] isEqualToString:[other lowercaseString]];
    }
    return [string isEqualToString:other];

}


- (NSArray<NSString *> *)sortedLettersFor:(NSString *)word {
    NSArray<NSString *> *letters = [self letterArrayFor:[word lowercaseString]];
    
    NSArray<NSString *> *sortedLetters = [letters sortedArrayUsingComparator:^(id first, id second) {
        if (first > second) {
            return (NSComparisonResult)NSOrderedAscending;
        } else if (first < second) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;

    }];
    
    return sortedLetters;
}

- (NSArray<NSString *> *)letterArrayFor:(NSString *)word {
    NSMutableArray<NSString *> *letters = [NSMutableArray array];
    
    for (int i = 0; i < word.length; i++) {
        unichar aCharacter = [word characterAtIndex:i];
        [letters addObject:[NSString stringWithFormat:@"%c",aCharacter]];
    }
    
    return letters;
}

@end