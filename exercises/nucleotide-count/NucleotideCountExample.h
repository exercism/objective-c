#import <Foundation/Foundation.h>

@interface NucleotideCount : NSObject

- (instancetype)initWithStrand:(NSString *)strand;

- (NSUInteger)count:(NSString *)nucleotide;
- (NSDictionary *)nucleotideCounts;

@end