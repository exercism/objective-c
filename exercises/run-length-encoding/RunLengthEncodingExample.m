#import "RunLengthEncodingExample.h"

@implementation RunLengthEncoding

+ (NSString *)encode:(NSString *)text {
    NSMutableString *result = [[NSMutableString alloc] init];
    __block NSString *previousCharacter;
    __block int count = 0;
    
    NSRange textRange = NSMakeRange(0, text.length);
    // Enumeration by composed character sequences is required to handle Emoji
    [text enumerateSubstringsInRange:textRange
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring,
                                       NSRange substringRange,
                                       NSRange enclosingRange,
                                       BOOL *stop)
     {
         if (!previousCharacter) {
             previousCharacter = substring;
         }
         
         if ([substring isEqualToString:previousCharacter]) {
             count++;
         }
         
         if (![substring isEqualToString:previousCharacter]) {
             [self addCharacter:previousCharacter toString:result withCount:count];
             
             previousCharacter = substring;
             count = 1;
         }
         
         BOOL isLastCharacter = (substringRange.location + substringRange.length) == text.length;
         
         if (isLastCharacter) {
             [self addCharacter:previousCharacter toString:result withCount:count];
         }
     }];
    
    return result;
}

+ (void)addCharacter:(NSString *)character toString:(NSMutableString *)string withCount:(int)count {
    if (count == 1) {
        [string appendString:character];
    } else {
        [string appendFormat:@"%d%@", count, character];
    }
}

+ (NSString *)decode:(NSString *)text {
    NSMutableString *result = [[NSMutableString alloc] init];
    __block int multiplier = 0;
    
    NSRange textRange = NSMakeRange(0, text.length);
    // Enumeration by composed character sequences is required to handle Emoji
    [text enumerateSubstringsInRange:textRange
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring,
                                       NSRange substringRange,
                                       NSRange enclosingRange,
                                       BOOL *stop)
     {
         // Is this character a numeric digit (0-9)?
         if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:[text characterAtIndex:substringRange.location]]) {
             if (multiplier) {
                 multiplier = multiplier * 10 + [substring intValue];
             } else {
                 multiplier = [substring intValue];
             }
         } else {
             if (!multiplier) {
                 multiplier = 1;
             }
             
             for (int i = 0; i < multiplier; i++) {
                 [result appendString:substring];
             }
             
             multiplier = 0;
         }
     }];
    
    return result;
}

@end
