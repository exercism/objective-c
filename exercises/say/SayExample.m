#import "SayExample.h"

@implementation Say

+ (NSString *)say:(long)number {
    NSArray<NSString *> *smallNumbers = @[
                                          @"zero", @"one", @"two", @"three", @"four", @"five",
                                          @"six", @"seven", @"eight", @"nine", @"ten",
                                          @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen",
                                          @"sixteen", @"seventeen", @"eighteen", @"nineteen"
                                          ];
    
    NSArray<NSString *> *decades = @[
                                     @"twenty", @"thirty", @"forty", @"fifty",
                                     @"sixty", @"seventy", @"eighty", @"ninety"
                                     ];
    
    NSArray<NSString *> *largeGroupNames = @[@"billion", @"million", @"thousand", @"hundred"];
    
    NSArray<NSNumber *> *largeGroupAmounts = @[@1000000000, @1000000, @1000, @100];
    
    if (number < 0 || number >= 1000000000000) {
        return NULL;
    }

    if (number < 20) {
        return smallNumbers[number];
    }
    
    for (int i = 0; i < largeGroupAmounts.count; i++) {
        int amount = largeGroupAmounts[i].intValue;
        
        if (number >= amount) {
            NSString *groupName = largeGroupNames[i];
            NSString *result = [[Say say:(number / amount)] stringByAppendingString:[NSString stringWithFormat:@" %@", groupName]];
            long remainder = number % amount;
            
            if (remainder == 0) {
                return result;
            }
            return [result stringByAppendingString:[NSString stringWithFormat:@" %@", [Say say:remainder]]];
        }
    }
    
    long decade = number / 10;
    int remainder = number % 10;
    NSString *decadeName = decades[decade - 2];
    
    if (remainder == 0) {
        return decadeName;
    }
    return [decadeName stringByAppendingString:[NSString stringWithFormat:@"-%@", [Say say:remainder]]];
}

@end
