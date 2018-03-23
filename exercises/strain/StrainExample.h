#import <Foundation/Foundation.h>

@interface NSArray (StrainExample)

-(instancetype)keep:(BOOL)compare where:(BOOL (^)(id arrayElement))completionHandler;

-(instancetype)discard:(BOOL (^)(id arrayElement))completionHandler;


@end
