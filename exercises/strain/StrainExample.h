#import <Foundation/Foundation.h>

@interface NSArray (StrainExample)

-(instancetype _Nonnull)keep:(BOOL)compare where:(BOOL (^_Nonnull)(id _Nonnull arrayElement))completionHandler;

-(instancetype _Nonnull)discard:(BOOL (^_Nonnull)(id _Nonnull arrayElement))completionHandler;


@end
