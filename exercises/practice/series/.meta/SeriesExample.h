#import <Foundation/Foundation.h>

@interface Series : NSObject

NS_ASSUME_NONNULL_BEGIN

- (instancetype)initWithNumberString:(NSString *)numberString;
- (nullable NSArray<NSArray<NSNumber *> *> *)slicesWithSize:(NSInteger)size;

NS_ASSUME_NONNULL_END

@end
