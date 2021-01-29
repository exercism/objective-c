#import "AcronymExample.h"

@implementation Acronym

+ (NSString *)abbreviate:(NSString *)text {
    NSMutableString *result = [[NSMutableString alloc] init];
    
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet whitespaceCharacterSet];
    [characterSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    NSArray *components = [text componentsSeparatedByCharactersInSet:characterSet];
    
    for (NSString *component in components) {
        unichar previousCharacter = 0;
        
        for (int i = 0; i < [component length]; i++) {
            unichar character = [component characterAtIndex:i];
            BOOL includeForCamelcase = [self isUppercaseCharacter:character] && [self isLowercaseCharacter:previousCharacter];
            
            if (i == 0 || includeForCamelcase) {
                result = [[result stringByAppendingString:[NSString stringWithFormat:@"%c", character]] mutableCopy];
            }
            
            previousCharacter = character;
        }
    }
    
    return [result uppercaseString];
}

+ (BOOL)isUppercaseCharacter:(unichar)character {
    return [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:character];
}

+ (BOOL)isLowercaseCharacter:(unichar)character {
    return [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:character];
}

@end
