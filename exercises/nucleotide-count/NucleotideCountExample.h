#import <Foundation/Foundation.h>

@interface DNA : NSObject

- (instancetype)initWithStrand:(NSString *)strand;

- (NSUInteger)count:(NSString *)nucleotide;
- (NSDictionary *)nucleotideCounts;

@end