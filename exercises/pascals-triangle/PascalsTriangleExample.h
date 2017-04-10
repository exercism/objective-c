#import <Foundation/Foundation.h>

@interface PascalsTriangle : NSObject

@property (nonatomic, strong) NSArray<NSArray <NSNumber *> *> *rows;

- (instancetype)initWithNumberOfRows:(int)numberOfRows;

@end
