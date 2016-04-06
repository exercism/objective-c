#import <Foundation/Foundation.h>
#import "PerfectNumbersExample.h"

@implementation NumberClassifier {
    NumberClassification _classification;
}

- (instancetype)initWithNumber:(int)number {
    if (self = [super init]) {
        int sum = [self sumForNumber:number];
        
        if (sum == number) {
            _classification = NumberClassificationPerfect;
        } else if (sum > number) {
            _classification = NumberClassificationAbundant;
        } else {
            _classification = NumberClassificationDeficient;
        }
    }
    
    return self;
}

- (int)sumForNumber:(int)number {
    int sum = 0;
    int factor = 1;
    
    while (factor < number) {
        if (number % factor == 0) {
            sum += factor;
        }
        
        factor++;
    }

    return sum;
}

- (NumberClassification)classification {
    return _classification;
}

@end
