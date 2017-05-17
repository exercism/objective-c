#import "LuhnExample.h"

@implementation Luhn

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    
    if (self) {
        _isValid = [Luhn validateString:string];
    }
    
    return self;
}

+ (BOOL)validateString:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""]; //!OCLint
    
    if (string.length < 2) {
        return NO;
    }
    
    NSCharacterSet *digitCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([string rangeOfCharacterFromSet:digitCharacterSet].location != NSNotFound) {
        return NO;
    }
    
    int total = 0;
    
    for (int i = 1; i <= string.length; i++) {
        NSString *character = [NSString stringWithFormat:@"%c", [string characterAtIndex:string.length - i]];
        int digit = character.intValue;
        
        if (i % 2 == 0) {
            digit *= 2;
            if (digit > 9) {
                digit -= 9;
            }
        }
        
        total += digit;
    }
    
    if (total % 10 == 0) {
        return YES;
    }
    
    return NO;
}

@end
