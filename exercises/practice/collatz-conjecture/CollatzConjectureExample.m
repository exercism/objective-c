#import "CollatzConjectureExample.h"

@implementation CollatzConjecture

+ (NSInteger)stepsForNumber:(NSInteger)number {
    if (number <= 0) {
        return NSNotFound;
    }
    
    NSInteger current = number;
    NSInteger steps = 0;
    
    while (current > 1) {
        steps++;
        
        if (current % 2 == 0) {
            current /= 2;
        } else {
            current = current * 3 + 1;
        }
    }
    
    return steps;
}

@end
