#import <Foundation/Foundation.h>

@interface NSArray (StrainExample)

-(instancetype)keep:(BOOL)compare where:(BOOL (^)(id))completionHandler;

-(instancetype)discard:(BOOL (^)(id))completionHandler;


@end
