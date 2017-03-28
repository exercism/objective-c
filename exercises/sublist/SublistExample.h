#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SublistKind) {
    SublistKindSublist,
    SublistKindSuperlist,
    SublistKindEqual,
    SublistKindUnequal
};

@interface SublistExample : NSObject

+ (SublistKind)classifierForFirstList:(NSArray *)firstArray andSecondList:(NSArray *)secondArray;

@end
