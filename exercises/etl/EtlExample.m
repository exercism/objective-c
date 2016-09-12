#import <Foundation/Foundation.h>
#import "EtlExample.h"


@implementation Etl

+ (NSDictionary *)transform:(NSDictionary *)original {
    
    NSArray *keys = [original allKeys];
    NSMutableDictionary *transformed = [NSMutableDictionary dictionary];
    
    [keys enumerateObjectsUsingBlock:^(id key, NSUInteger keyIdx, BOOL *keyStop) {
        NSArray *values = original[key];
        
        [values enumerateObjectsUsingBlock:^(id value, NSUInteger valueIdx, BOOL *valueStop) {
            NSString *lowercasedString = [value lowercaseString];
            transformed[lowercasedString] = key;
        }];
    }];
    
    return transformed;
}

@end
