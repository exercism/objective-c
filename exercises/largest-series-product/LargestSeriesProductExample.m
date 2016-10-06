#import "LargestSeriesProductExample.h"

@implementation LargestSeriesProduct {
    NSArray<NSNumber *> *_numbers;
}

- (instancetype)initWithNumberString:(NSString *)numberString {
    if (self = [super init]) {
        NSMutableArray<NSNumber *> *numbers = [[NSMutableArray alloc] initWithCapacity:[numberString length]];
        NSCharacterSet *decimalSet = [NSCharacterSet decimalDigitCharacterSet];
        
        for (int i = 0; i < [numberString length]; i++) {
            unichar character = [numberString characterAtIndex:i];
            if (![decimalSet characterIsMember:character]) {
                @throw [NSException exceptionWithName:@"Invalid input" reason:@"Non-decimal character" userInfo:nil];
            }
            
            NSString *digit = [NSString stringWithFormat:@"%c", character];
            
            [numbers addObject:[NSNumber numberWithInt:[digit intValue]]];
        }
        
        _numbers = numbers;
    }
    
    return self;
}

- (long)largestProduct:(int)numberOfDigits {
    if (numberOfDigits < 0) {
        @throw [NSException exceptionWithName:@"Invalid request" reason:@"Negative span" userInfo:nil];
    }
    
    int endIndex = (int)[_numbers count] - numberOfDigits;
    
    if (endIndex < 0) {
        @throw [NSException exceptionWithName:@"Invalid request" reason:@"Span longer than string length" userInfo:nil];
    }
    
    long result = 0;
    
    for (int i = 0; i <= endIndex; i++) {
        NSMutableArray *selectedNumbers = [[NSMutableArray alloc] init];
        
        for (int j = i; j < i + numberOfDigits; j++) {
            [selectedNumbers addObject:_numbers[j]];
        }
        
        long total = 1;
        
        for (NSNumber *selectedNumber in selectedNumbers) {
            total *= [selectedNumber intValue];
        }
        
        if (total > result) {
            result = total;
        }
    }
    
    return result;
}

@end
