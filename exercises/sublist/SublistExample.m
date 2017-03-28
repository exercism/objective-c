#import "SublistExample.h"

@implementation SublistExample

+ (SublistKind)classifierForFirstList:(NSArray *)firstArray andSecondList:(NSArray *)secondArray { //!OCLint
    
    if ([firstArray isEqualToArray:secondArray]){
        return SublistKindEqual;
    } else if (firstArray.count == 0 || secondArray.count == 0) {
        if (firstArray.count == 0) {
            return SublistKindSublist;
        }
        
        return SublistKindSuperlist;
    } else if (firstArray.count != secondArray.count) {
        int i = 0; //!OCLint
        int count = 0;
        NSMutableArray *smallerArray = [NSMutableArray array];
        
        unsigned long iterations = 0;
        iterations = MAX(firstArray.count, secondArray.count) - ((MIN(firstArray.count, secondArray.count) - 1));
        
        while (iterations > 0) {
            int j = i; //!OCLint
            
            while (count <= (MIN(firstArray.count, secondArray.count) - 1)) {
                if (firstArray.count > secondArray.count) {
                    [smallerArray addObject:firstArray[j]];
                } else {
                    [smallerArray addObject:secondArray[j]];
                }
                
                j++;
                count++;
            }
            
            if ([smallerArray isEqualToArray:firstArray]) {
                return SublistKindSublist;
            } else if ([smallerArray isEqualToArray:secondArray]) {
                return SublistKindSuperlist;
            }
            
            [smallerArray removeAllObjects];
            i++;
            count = 0;
            iterations--;
        }
    }
    
    return SublistKindUnequal;
}
@end
