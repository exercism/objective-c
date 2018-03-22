#import <Foundation/Foundation.h>

@interface NSArray (StrainExample)

-(NSArray*)keep:(BOOL)compare where:(BOOL (^_Nonnull)(id _Nonnull arrayElement))completionHandler;

-(NSArray* _Nullable)discard:(BOOL (^_Nonnull)(id _Nonnull arrayElement))completionHandler;


@end
