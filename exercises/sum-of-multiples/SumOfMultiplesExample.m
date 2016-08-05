#import "SumOfMultiplesExample.h"

@implementation SumOfMultiples

+ (NSNumber *)toLimit:(NSNumber *)limit inMultiples:(NSArray<NSNumber *> *)multiples {
    NSMutableSet<NSNumber *> *multiplesFound = [[NSMutableSet alloc] init];
    
    for (NSNumber *multiple in multiples) {
        if ([multiple isEqual: @0]) {
            continue;
        }
        
        int x = 1;
        
        while (x * [multiple intValue] < [limit intValue]) {
            [multiplesFound addObject:@(x * [multiple intValue])];
            ++x;
        }
    }
    
    int result = 0;
    
    for (NSNumber *multiple in multiplesFound) {
        result += multiple.intValue;
    }
    
    return @(result);
}

@end
