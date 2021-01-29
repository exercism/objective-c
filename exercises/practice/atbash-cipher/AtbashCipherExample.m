#import "AtbashCipherExample.h"

static NSDictionary<NSString *, NSString *> *cipherDictionary;

@implementation AtbashCipher

+ (void)initialize {
    if (self == [AtbashCipher class]) {
        cipherDictionary = [self createCipherDictionary];
    }
}

+ (NSDictionary<NSString *, NSString *> *)createCipherDictionary {
    NSArray<NSString *> *alphabet = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
    NSMutableDictionary<NSString *, NSString *> *cipherDict = [[NSMutableDictionary alloc] initWithCapacity:26];
    
    NSUInteger count = alphabet.count;
    
    for (int i = 0; i < count; i++) {
        NSString *key = alphabet[i];
        NSString *value = alphabet[count - i - 1];
        
        cipherDict[key] = value;
    }

    return cipherDict;
}

+ (NSString *)encode:(NSString *)input {
    input = [input lowercaseString]; //!OCLint
    
    NSCharacterSet *characterSet = [NSCharacterSet alphanumericCharacterSet];
    NSMutableString *result = [[NSMutableString alloc] init];
    int count = 0;
    
    for (int i = 0; i < input.length; i++) {
        unichar character = [input characterAtIndex:i];
        if (![characterSet characterIsMember:character]) {
            continue;
        }
        
        if (count % 5 == 0 && count > 0) {
            [result appendString:@" "];
        }
        
        NSString *string = [NSString stringWithFormat:@"%C", character];
        NSString *resultLetter = cipherDictionary[string];
        
        if (resultLetter) {
            [result appendString:resultLetter];
        } else {
            [result appendString:string];
        }
        
        count++;
    }
    
    return result;
}

@end
