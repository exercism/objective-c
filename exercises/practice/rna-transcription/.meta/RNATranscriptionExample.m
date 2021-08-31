#import "RNATranscriptionExample.h"

@implementation RNATranscription

- (NSString *)rnaFromDNAStrand:(NSString *)dnaStrand
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

@end
