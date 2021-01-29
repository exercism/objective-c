#import "SeriesExample.h"

@interface Series()

@property (nonatomic, strong) NSString *numberString;

@end

@implementation Series

- (instancetype)initWithNumberString:(NSString *)numberString {
    if (self = [super init]) {
        self.numberString = numberString;
    }
    
    return self;
}

- (nullable NSArray<NSArray<NSNumber *> *> *)slicesWithSize:(NSInteger)size {
    NSUInteger length = [self.numberString length];
    
    if (length < size) {
        return nil;
    }
    
    NSMutableArray<NSNumber *> *numberArray = [NSMutableArray arrayWithCapacity:length];
    
    for (NSUInteger i = 0; i < length; i++) {
        unichar digit = [self.numberString characterAtIndex:i] - '0';
        if (digit < 0 || digit > 10) {
            // Invalid character
            return nil;
        }
        
        [numberArray addObject:[NSNumber numberWithUnsignedShort:digit]];
    }
    
    NSInteger numberOfSlices = length - size + 1;
    NSMutableArray<NSArray<NSNumber *> *> *result = [NSMutableArray arrayWithCapacity:numberOfSlices];
    
    for (NSUInteger start = 0; start < numberOfSlices; start++) {
        NSRange range = NSMakeRange(start, size);
        NSArray *slice = [numberArray subarrayWithRange:range];
        [result addObject:slice];
    }
    
    return result;
}

@end
