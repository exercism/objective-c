#import "PascalsTriangleExample.h"

@implementation PascalsTriangle

- (instancetype)initWithNumberOfRows:(int)numberOfRows {
    self = [super init];
    
    if (self) {
        self.rows = [PascalsTriangle triangleForNumberOfRows:numberOfRows];
    }
    
    return self;
}

+ (NSMutableArray<NSArray<NSNumber *> *> *)triangleForNumberOfRows:(int)numberOfRows {
    NSMutableArray<NSArray<NSNumber *> *> *triangle = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < numberOfRows; i++) {
        NSMutableArray *values = [[NSMutableArray alloc] init];
        
        if (i == 0) {
            [values addObject:@1];
        } else {
            NSArray<NSNumber *> *lastRow = triangle[i - 1];
            NSUInteger length = lastRow.count;
            
            for (int j = 0; j <= length; j++) {
                int left;
                
                if (j == 0) {
                    left = 0;
                } else {
                    left = [lastRow[j - 1] intValue];
                }
                
                int right;
                
                if (j < length) {
                    right = [lastRow[j] intValue];
                } else {
                    right = 0;
                }
                
                [values addObject:@(left + right)];
            }
        }
        
        [triangle addObject:values];
    }

    return triangle;
}

@end
