#import "AcronymExample.h"

@implementation Acronym

+ (NSString *)abbreviate:(NSString *)text {
    NSMutableString *result = [[NSMutableString alloc] init];
    
    NSMutableCharacterSet *separators = [NSMutableCharacterSet whitespaceCharacterSet];
    [separators addCharactersInString:@"-"];
    NSMutableCharacterSet *letters = [NSMutableCharacterSet letterCharacterSet];
    
    BOOL take = true;

    for (NSUInteger i = 0; i < [text length]; i++) {
        unichar character = [text characterAtIndex:i];
        if ([separators characterIsMember:character]) {
            take = true;
        } else if (take && [letters characterIsMember:character]) {
            take = false;
            result = [[result stringByAppendingString:[NSString stringWithFormat:@"%c", character]] mutableCopy];
        }
    }

    return [result uppercaseString];
}

@end
