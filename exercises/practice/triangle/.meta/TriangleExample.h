#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TriangleKind) {
    TriangleKindEquilateral,
    TriangleKindIsosceles,
    TriangleKindScalene
};

@interface Triangle : NSObject

+ (TriangleKind)kindForSides:(double)a :(double)b :(double)c;

@end
