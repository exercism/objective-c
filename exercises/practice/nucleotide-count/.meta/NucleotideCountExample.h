#import <Foundation/Foundation.h>

@interface NucleotideCount : NSObject

- (instancetype)initWithStrand:(NSString *)strand;

- (NSDictionary *)nucleotideCounts;

@end
