#import "TransposeExample.h"

@implementation Transpose

+ (NSArray<NSString *> *)transpose:(NSArray<NSString *> *)input {
    int maxLength = 0;
    
    for (NSString *line in input) {
        if (line.length > maxLength) {
            maxLength = (int)line.length;
        }
    }
    
    NSMutableArray<NSString *> *result = [NSMutableArray arrayWithCapacity:maxLength];
    
    for (int i = 0; i < maxLength; i++) {
        [result addObject:@""];
        
        for (NSString *line in input) {
            NSString *character;
            
            if (i < line.length) {
                character = [line substringWithRange:NSMakeRange(i, 1)];
            } else {
                character = @" ";
            }
            
            result[i] = [result[i] stringByAppendingString:character];
        }
    }
    
    NSMutableArray<NSString *> *trimmedResult = [[NSMutableArray alloc] init];
    
    for (NSString *line in result) {
        [trimmedResult addObject:[self stringByTrimmingTrailingWhiteSpace:line]];
    }
    
    return trimmedResult;
}

+ (NSString *)stringByTrimmingTrailingWhiteSpace:(NSString *)string {
    NSUInteger location = 0;
    NSUInteger length = [string length];
    unichar charBuffer[length];
    [string getCharacters:charBuffer];
    
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceCharacterSet];
    
    while (length > 0) {
        if (![characterSet characterIsMember:charBuffer[length - 1]]) {
            break;
        }
        length--;
    }
    
    return [string substringWithRange:NSMakeRange(location, length - location)];
}

@end
