#import "FlattenArrayExample.h"
static NSMutableArray *resultArray;
static NSNull *nullValue;

@implementation FlattenArrayExample

+ (NSArray*)flattenArray:(NSArray *)list{
    
    resultArray = [NSMutableArray array];
    nullValue = [NSNull null];
    for(int i=0;i < list.count;i++){
        
        if([list[i] isKindOfClass:[NSArray class]]){
            
            [FlattenArrayExample extractValuesFromArray:list[i]];
        
        }else{
            
            if(list[i] != nullValue){
                
                [resultArray addObject:list[i]];
            }
        }
    }
    return resultArray;
}


+(void)extractValuesFromArray:(NSArray*)array{
    
    for(int i=0;i < array.count;i++){
        
        if([array[i] isKindOfClass:[NSArray class]]){
            
            [FlattenArrayExample extractValuesFromArray:array[i]];
        }else{
            
            if(array[i] != nullValue){
                
                [resultArray addObject:array[i]];
            }
        }
    }
    
}


@end
