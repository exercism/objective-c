#import "PangramExample.h"

@implementation Pangram

+ (BOOL)isPangram:(NSString *)text {
    NSString *lowercasedText = [[text stringByApplyingTransform:NSStringTransformStripCombiningMarks reverse:NO] lowercaseString];
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0; i < [letters length]; i++) {
        unichar character = [letters characterAtIndex:i];
        NSString *letter = [NSString stringWithFormat:@"%c", character];
        
        if (![lowercasedText containsString:letter]) {
            return NO;
        }
    }
    
    return YES;
}

@end
