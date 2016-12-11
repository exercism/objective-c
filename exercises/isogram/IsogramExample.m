#import "IsogramExample.h"

@implementation Isogram

+ (BOOL)isIsogram:(NSString *)string {
    NSString *lowercasedString = string.lowercaseString;
    NSCharacterSet *lowercaseLetterSet = [NSCharacterSet lowercaseLetterCharacterSet];
    
    NSMutableSet<NSNumber *> *letters = [[NSMutableSet alloc] init];
    
    for (int i = 0; i < [lowercasedString length]; i++) {
        unichar character = [lowercasedString characterAtIndex:i];
        if (![lowercaseLetterSet characterIsMember:character]) {
            continue;
        }
        
        NSNumber *numberForCharacter = [NSNumber numberWithUnsignedShort:character];
        if ([letters containsObject:numberForCharacter]) {
            return NO;
        }
        
        [letters addObject:numberForCharacter];
    }
    
    return YES;
}

@end
