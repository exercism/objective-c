#import <Foundation/Foundation.h>
#import "StrainExample.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSArray (StrainExample)

-(instancetype)keep:(BOOL)compare where:(BOOL (^)(id))completionHandler{
    
    NSMutableArray *filteredArray = [NSMutableArray array];
    
    for(int index = 0;index < self.count;index++){
        
        id objectInArray = self[index];
        
        BOOL flag = completionHandler(objectInArray);
        
        if(flag == compare){
            
            [filteredArray addObject:objectInArray];
        }
    }
    
    return filteredArray;
    
}

-(instancetype)discard:(BOOL (^)(id))completionHandler{
    
    return [self keep:false where:completionHandler];
}


@end

NS_ASSUME_NONNULL_END
