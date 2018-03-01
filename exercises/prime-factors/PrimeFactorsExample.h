#import <Foundation/Foundation.h>

@interface PrimeFactors : NSObject

NS_ASSUME_NONNULL_BEGIN
+ (NSArray <NSNumber *> *)factorsForInteger:(long long)number;
NS_ASSUME_NONNULL_END

@end
