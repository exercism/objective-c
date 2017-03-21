#import "BinarySearchExample.h"

@implementation BinarySearch

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array {
    self = [super init];
        
    if (self) {
        // This binary search algorithm only works if the array is already is ascending order.
        if ([array isEqualToArray:[array sortedArrayUsingSelector:@selector(compare:)]]) {
            _list = array;
        } else {
            return nil;
        }
    }
    
    return self;
}

- (NSInteger)searchFor:(int)number {
    NSInteger middleIndex = [self middle];
    int middle = [self.list[middleIndex] intValue];
    
    if (middle == number) {
        return middleIndex;
    } else if (middle > number) {
        NSArray *sublist = [self.list subarrayWithRange:NSMakeRange(0, middleIndex)];
        
        BinarySearch *binary = [[BinarySearch alloc] initWithArray:sublist];
        if (!binary) {
            return NSNotFound;
        }
        
        return [binary searchFor:number];
    } else {
        NSUInteger length = self.list.count - middleIndex;
        NSArray *sublist = [self.list subarrayWithRange:NSMakeRange(middleIndex, length)];
        if ([sublist isEqualToArray:self.list]) {
            return NSNotFound;
        }
        
        BinarySearch *binary = [[BinarySearch alloc] initWithArray:sublist];
        if (!binary) {
            return NSNotFound;
        }
        
        return [binary searchFor:number] + middleIndex;
    }
}

- (NSInteger)middle {
    return self.list.count / 2;
}

@end

