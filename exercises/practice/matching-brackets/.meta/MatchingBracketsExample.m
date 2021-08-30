#import "MatchingBracketsExample.h"

@implementation MatchingBracketsExample

+ (BOOL)validateBracketPairingAndNestingInString:(NSString *)string {
    NSDictionary *brackets = @{@")" : @"(",
                               @"]" : @"[",
                               @"}" : @"{" };

    NSMutableArray *stack = [[NSMutableArray alloc] init];
    NSRange textRange = NSMakeRange(0, string.length);
    __block BOOL mismatch = NO;

    [string enumerateSubstringsInRange:textRange
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString * _Nullable
                                         substring,
                                         NSRange substringRange,
                                         NSRange enclosingRange,
                                         BOOL * _Nonnull stop)
     {
         if ([[brackets allValues] containsObject:substring]) {
             [stack addObject:substring];
         } else if ([[brackets allKeys] containsObject:substring]) {
             NSString *last = [stack lastObject];

             if (last) {
                 [stack removeLastObject];

                 if (![last isEqualToString:brackets[substring]]) {
                     mismatch = YES;
                     *stop = YES;
                 }
             } else {
                 mismatch = YES;
                 *stop = YES;
             }
         }
     }];

    if (mismatch) {
        return NO;
    }

    return [stack count] == 0;
}

@end
