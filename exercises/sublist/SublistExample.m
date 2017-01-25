#import "SublistExample.h"

@implementation SublistExample

+(NSString*)classifierForFirstList:(NSArray *)firstArray andSecondList:(NSArray *)secondArray{
    
    if([firstArray isEqualToArray:secondArray]){
        
        return @"equal";
    
    }else if(firstArray.count == 0 || secondArray.count == 0){
        
        if(firstArray.count == 0){
            
            return @"sublist";
        }
        
        return @"superlist";
    
    }else if(firstArray.count != secondArray.count){
        
        int i = 0;
        int count = 0;
        NSMutableArray *smallerArray = [NSMutableArray array];
        
        int iterations = 0;
        iterations = MAX((int)firstArray.count, (int)secondArray.count) - ((MIN((int)firstArray.count, (int)secondArray.count)-1));
        
        while(iterations > 0){
            
            int j = i;
            while(count <= (MIN(firstArray.count, secondArray.count) - 1)){
                
                if(firstArray.count > secondArray.count){
                    
                    [smallerArray addObject:[firstArray objectAtIndex:j]];
                }else{
                    
                    [smallerArray addObject:[secondArray objectAtIndex:j]];
                }
                j++;
                count++;
            }
            
            if([smallerArray isEqualToArray:firstArray]){
                
                return @"sublist";
            
            }else if([smallerArray isEqualToArray:secondArray]){
                
                return @"superlist";
            }else{
                
                [smallerArray removeAllObjects];
                i++;
                count=0;
            }
            
            
            iterations--;
        }
        
    }
    
        return @"unequal";
}
@end
