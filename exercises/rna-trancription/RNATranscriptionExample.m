#import "RNATranscriptionExample.h"

@implementation RNATranscription

- (NSString *)rnaFromDNAStrand:(NSString *)dnaStrand
{
    NSDictionary *dnaToRNADict = @{ @"G" : @"C",
                                    @"C" : @"G",
                                    @"T" : @"A",
                                    @"A" : @"U" };
    
    NSArray *dnaKeys = [dnaToRNADict allKeys];
    NSString *dnaKeyString = [dnaKeys componentsJoinedByString:@""];
    NSCharacterSet *invertedSet = [[NSCharacterSet characterSetWithCharactersInString:dnaKeyString] invertedSet];
    NSRange invertedSetMemberRange = [dnaStrand rangeOfCharacterFromSet:invertedSet];
    if (invertedSetMemberRange.location != NSNotFound) {
        return nil;
    }
    
    NSMutableString *rna = [NSMutableString stringWithString:dnaStrand];
    NSMutableDictionary *dnaToRnaRanges = [NSMutableDictionary dictionary];
    
    [[dnaToRNADict allKeys] enumerateObjectsUsingBlock:^(NSString *dnaKey, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:dnaKey options:0 error:NULL];
        NSMutableArray *ranges = [NSMutableArray array];
        
        [regex enumerateMatchesInString:dnaStrand options:0 range:NSMakeRange(0, [dnaStrand length]) usingBlock:^(NSTextCheckingResult * _Nullable match, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            NSRange range = [match rangeAtIndex:0];
            [ranges addObject:[NSValue valueWithRange:range]];
        }];
        
        dnaToRnaRanges[dnaKey] = [ranges copy];
    }];
    
    [dnaToRNADict enumerateKeysAndObjectsUsingBlock:^(NSString *dnaKey, NSString *rnaValue, BOOL * _Nonnull stop) {
        NSArray *dnaRanges = dnaToRnaRanges[dnaKey];
        
        [dnaRanges enumerateObjectsUsingBlock:^(NSValue *dnaRangeValue, NSUInteger idx, BOOL * _Nonnull stop) {
            [rna replaceOccurrencesOfString:dnaKey withString:rnaValue options:NSLiteralSearch range:[dnaRangeValue rangeValue]];
        }];
    }];
    
    return [rna copy];
}

@end
