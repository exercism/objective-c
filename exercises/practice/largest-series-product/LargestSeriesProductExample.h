#import <Foundation/Foundation.h>

@interface LargestSeriesProduct : NSObject

- (instancetype)initWithNumberString:(NSString *)numberString;
- (long)largestProduct:(int)numberOfDigits;

@end
