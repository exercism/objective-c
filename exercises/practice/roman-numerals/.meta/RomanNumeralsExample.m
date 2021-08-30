#import "RomanNumeralsExample.h"

static NSDictionary<NSNumber *, NSString *>* arabicToRoman;

@implementation RomanNumerals

+ (void)initialize {
    if (self == [RomanNumerals class]) {
        arabicToRoman = @{
                          @1000 : @"M",
                          @900 : @"CM",
                          @500 : @"D",
                          @400 : @"CD",
                          @100 : @"C",
                          @90 : @"XC",
                          @50 : @"L",
                          @40 : @"XL",
                          @10 : @"X",
                          @9 : @"IX",
                          @5 : @"V",
                          @4 : @"IV",
                          @1 : @"I"
                        };
    }
}

+ (NSString *)romanNumeralsForValue:(int)value {
    NSMutableString *result = [[NSMutableString alloc] initWithString:@""];
    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    NSArray<NSNumber *> *sortedKeys = [[arabicToRoman allKeys] sortedArrayUsingDescriptors:@[highestToLowest]];
    
    for (NSNumber *arabic in sortedKeys) {
        while (value >= [arabic intValue]) {
            [result appendString:arabicToRoman[arabic]];
            value -= [arabic intValue];
        }
    }
    
    return result;
}

@end
