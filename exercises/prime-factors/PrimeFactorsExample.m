#import "PrimeFactorsExample.h"

@implementation PrimeFactors

+ (NSArray <NSNumber *> *)factorsForInteger:(long long)integer {
    
    long long number = integer;
    long long divisor = 2;
    NSMutableArray <NSNumber *> *primes = [[NSMutableArray alloc] init];
    
    while (number > 1) {
        
        while (number % divisor == 0) { // !OCLint
            [primes addObject:[NSNumber numberWithLongLong:divisor]];
            number /= divisor;
        }
        
        divisor++;
    }
    
    return primes;
}

@end
