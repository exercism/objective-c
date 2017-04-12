#import "SieveExample.h"

@implementation Sieve

+ (NSArray<NSNumber *> *)primesUpTo:(int)limit {
    if (limit < 2) {
        return @[];
    }
    
    NSMutableArray<NSNumber *> *numbers = [[NSMutableArray alloc] init];
    NSMutableArray<NSNumber *> *primes = [[NSMutableArray alloc] init];
    
    for (int i = 2; i <= limit; i++) {
        [numbers addObject:@(i)];
    }
    
    while (numbers.count > 0) {
        NSNumber *target = [numbers objectAtIndex:0];
        
        if (target) {
            [numbers removeObjectAtIndex:0];
            [primes addObject:target];
            NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSNumber *number, NSDictionary *bindings) {
                return number.intValue % target.intValue != 0;
            }];
            [numbers filterUsingPredicate:predicate];
        }
    }
    
    return primes;
}

@end
