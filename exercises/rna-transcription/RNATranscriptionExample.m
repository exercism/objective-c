#import "RNATranscriptionExample.h"

@implementation RNATranscription

- (NSString *)rnaFromDNAStrand:(NSString *)dnaStrand
{
    return [self rnaFromDNAStrandSimple:dnaStrand];
}

- (NSString *)rnaFromDNAStrandSimple:(NSString *)dnaStrand
{
    NSDictionary *dnaToRNADict = @{ @"G" : @"C",
                                    @"C" : @"G",
                                    @"T" : @"A",
                                    @"A" : @"U" };
        
    NSMutableString *rnaStrand = [NSMutableString stringWithString:dnaStrand];
    
    for (NSUInteger i = 0; i < [dnaStrand length]; i++) {
        NSRange charRange = [dnaStrand rangeOfComposedCharacterSequenceAtIndex:i];
        NSString *dnaNucleotide = [dnaStrand substringWithRange:charRange];
        NSString *rnaNucleotide = dnaToRNADict[dnaNucleotide];
        if (!rnaNucleotide) return nil;
        [rnaStrand replaceCharactersInRange:charRange withString:rnaNucleotide];
    }
    
    return [rnaStrand copy];
}

- (NSString *)rnaFromDNAStrandComplex:(NSString *)dnaStrand
{
    NSDictionary *dnaToRNADict = @{ @"G" : @"C",
                                    @"C" : @"G",
                                    @"T" : @"A",
                                    @"A" : @"U" };
    
    NSArray *dnaKeys = [dnaToRNADict allKeys];
    NSString *dnaKeyString = [dnaKeys componentsJoinedByString:@""];
    NSCharacterSet *invertedSet = [[NSCharacterSet characterSetWithCharactersInString:dnaKeyString] invertedSet];
    NSRange invertedSetRange = [dnaStrand rangeOfCharacterFromSet:invertedSet];
    if (invertedSetRange.location != NSNotFound) {
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
