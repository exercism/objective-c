#import <Foundation/Foundation.h>
#import "StrainExample.h"

@implementation NSArray (StrainExample)

-(instancetype)keep:(BOOL)compare where:(BOOL (^)(id _Nonnull arrayElement))completionHandler{
    
    NSMutableArray *filteredArray = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull objectInArray, NSUInteger idx, BOOL * _Nonnull stop) {
        
        BOOL flag = completionHandler(objectInArray);
        
        if(flag == compare){
            
            [filteredArray addObject:objectInArray];
        }
    }];
    
    
    return filteredArray;
    
}

-(instancetype)discard:(BOOL (^)(id _Nonnull arrayElement))completionHandler{
    
    return [self keep:false where:completionHandler];
}


@end
