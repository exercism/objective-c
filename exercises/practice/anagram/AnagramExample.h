#import <Foundation/Foundation.h>

@interface Anagram : NSObject

- (instancetype)initWithString:(NSString *)string;
- (NSArray<NSString *> *)match:(NSArray<NSString *> *)potentialMatches;

@end
