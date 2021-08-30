#import <Foundation/Foundation.h>

@interface BinarySearch : NSObject

@property (nonatomic, strong) NSArray *list;

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array;
- (NSInteger)searchFor:(int)number;
- (NSInteger)middle;

@end
