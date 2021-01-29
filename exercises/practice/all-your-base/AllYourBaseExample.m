#import <Foundation/Foundation.h>
#import "AllYourBaseExample.h"

@implementation AllYourBase

+ (NSArray<NSNumber *> *)outputDigitsForInputBase:(int)inputBase inputDigits:(NSArray<NSNumber *> *)inputDigits outputBase:(int)outputBase {
    
    if (inputBase < 2) {
        @throw [NSException exceptionWithName:@"Invalid input base" reason:@"Less than 2" userInfo:nil];
    }
    
    if (outputBase < 2) {
        @throw [NSException exceptionWithName:@"Invalid output base" reason:@"Less than 2" userInfo:nil];
    }

    int sum = [self getSumForDigits:inputDigits andBase:inputBase];
    return [self getDigitsForSum:sum andBase:outputBase];
}

+ (int)getSumForDigits:(NSArray<NSNumber *> *)digits andBase:(int)base {
    int multiplier = 1;
    int sum = 0;
    
    for (NSNumber *digit in [[digits reverseObjectEnumerator] allObjects]) {
        int digitValue = [digit intValue];
        
        if (digitValue < 0) {
            @throw [NSException exceptionWithName:@"Invalid digit" reason:@"Negative value" userInfo:nil];
        }
        
        if (digitValue >= base) {
            @throw [NSException exceptionWithName:@"Invalid digit" reason:@"Too high for base" userInfo:nil];
        }
        
        sum += digitValue * multiplier;
        multiplier *= base;
    }
    
    return sum;
}

+ (NSArray<NSNumber *> *)getDigitsForSum:(int)sum andBase:(int)base {
    NSMutableArray<NSNumber *> *digits = [[NSMutableArray alloc] init];
    int multiplier = 1;
    
    while (sum > 0) {
        multiplier *= base;
        int value = sum % multiplier;
        int digit = value / (multiplier / base);
        [digits addObject:@(digit)];
        sum -= value;
    }
    
    return [[digits reverseObjectEnumerator] allObjects];
}

@end

