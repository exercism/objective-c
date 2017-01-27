#import <XCTest/XCTest.h>

#if __has_include("FlattenArrayExample.h")
# import "FlattenArrayExample.h"
# else
# import "FlattenArray.h"
#endif

@interface FlattenArrayTest : XCTestCase

@end

@implementation FlattenArrayTest

- (void)testFlattenArrayWithJustIntegers {
    
    NSArray *innerArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],[NSNumber numberWithInt:6],[NSNumber numberWithInt:7], nil];
    NSArray *inputArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],innerArray,[NSNumber numberWithInt:8], nil];
    NSArray *expected = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],[NSNumber numberWithInt:6],[NSNumber numberWithInt:7],[NSNumber numberWithInt:8], nil];
    XCTAssertTrue([expected isEqualToArray:[FlattenArrayExample flattenArray:inputArray]]);
    
    
}

-(void)testFiveLevelNesting{
    
    NSArray *innerArray5 = [NSArray arrayWithObject:[NSNumber numberWithInt:50]];
    NSArray *innerArray4 = [NSArray arrayWithObject:innerArray5];
    NSArray *innerArray3 = [NSArray arrayWithObject:innerArray4];
    NSArray *innerArray2 = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSArray *innerArray1 = [NSArray arrayWithObjects:innerArray2,[NSNumber numberWithInt:8],[NSNumber numberWithInt:100],[NSNumber numberWithInt:4],innerArray3, nil];
    NSArray *inputArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:2],innerArray1,[NSNumber numberWithInt:-2], nil];
    
    NSArray *expected = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:8],[NSNumber numberWithInt:100],[NSNumber numberWithInt:4],[NSNumber numberWithInt:50],[NSNumber numberWithInt:-2], nil];
    XCTAssertTrue([expected isEqualToArray:[FlattenArrayExample flattenArray:inputArray]]);
}

-(void)testSixLevelNesting{
    
    NSArray *innerArray6 = [NSArray arrayWithObject:[NSNumber numberWithInt:5]];
    NSArray *innerArray5 = [NSArray arrayWithObject:innerArray6];
    NSArray *innerArray4 = [NSArray arrayWithObjects:[NSNumber numberWithInt:4],innerArray5, nil];
    NSArray *innerArray3 = [NSArray arrayWithObject:[NSNumber numberWithInt:3]];
    NSArray *innerArray2 = [NSArray arrayWithObject:innerArray3];
    NSArray *innerArray1 = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],innerArray2,innerArray4,[NSNumber numberWithInt:6],[NSNumber numberWithInt:7], nil];
    NSArray *inputArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],innerArray1,[NSNumber numberWithInt:8], nil];
    NSArray *expected = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],[NSNumber numberWithInt:6],[NSNumber numberWithInt:7],[NSNumber numberWithInt:8], nil];
    XCTAssertTrue([expected isEqualToArray:[FlattenArrayExample flattenArray:inputArray]]);
}

-(void)testSixLevelNestingWithNullValues{
    
    NSNull *nullValue = [NSNull null];
    NSArray *innerArray6 = [NSArray arrayWithObject:nullValue];
    NSArray *innerArray5 = [NSArray arrayWithObject:innerArray6];
    NSArray *innerArray4  = [NSArray arrayWithObject:[NSNumber numberWithInt:100]];
    NSArray *innerArray3 = [NSArray arrayWithObject:innerArray4];
    NSArray *innerArray2 = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSArray *innerArray1 = [NSArray arrayWithObjects:innerArray2,[NSNumber numberWithInt:8],innerArray3,nullValue,innerArray5, nil];
    NSArray *inputArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:2],innerArray1,[NSNumber numberWithInt:-2], nil];
    NSArray *expected = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:8],[NSNumber numberWithInt:100],[NSNumber numberWithInt:-2], nil];
    XCTAssertTrue([expected isEqualToArray:[FlattenArrayExample flattenArray:inputArray]]);
    
}

-(void)testAllValuesInNestedListAreNull{
    
    NSNull *nullValue = [NSNull null];
    NSArray *innerArray6 = [NSArray arrayWithObjects:nullValue,nullValue, nil];
    NSArray *innerArray5 = [NSArray arrayWithObjects:innerArray6,nullValue, nil];
    NSArray *innerArray4 = [NSArray arrayWithObject:nullValue];
    NSArray *innerArray3 = [NSArray arrayWithObject:innerArray4];
    NSArray *innerArray2 = [NSArray arrayWithObject:innerArray3];
    NSArray *innerArray1 = [NSArray arrayWithObject:innerArray2];
    NSArray *inputArray = [NSArray arrayWithObjects:nullValue,innerArray1,nullValue,nullValue,innerArray5,nullValue, nil];
    NSArray *expected = @[];
    XCTAssertTrue([expected isEqualToArray:[FlattenArrayExample flattenArray:inputArray]]);

}

-(void)testFiveLevelDeepNestedListWithDoubleValuesAndNullValues{
    
    NSNull *nullValue = [NSNull null];
    NSArray *innerArray5 = [NSArray arrayWithObject:nullValue];
    NSArray *innerArray4 = [NSArray arrayWithObject:innerArray5];
    NSArray *innerArray3 = [NSArray arrayWithObject:innerArray4];
    NSArray *innerArray2 = [NSArray arrayWithObjects:[NSNumber numberWithDouble:2.00005],[NSNumber numberWithDouble:3.13], nil];
    NSArray *innerArray1 = [NSArray arrayWithObjects:innerArray2,[NSNumber numberWithDouble:8.4],[NSNumber numberWithDouble:100],[NSNumber numberWithDouble:4.8],innerArray3, nil];
    NSArray *inputArray = [NSArray arrayWithObjects:[NSNumber numberWithDouble:0.085],[NSNumber numberWithDouble:2.8844557],innerArray1,[NSNumber numberWithDouble:-2.5], nil];
    
    NSArray *expected = [NSArray arrayWithObjects:[NSNumber numberWithDouble:0.085],[NSNumber numberWithDouble:2.8844557],[NSNumber numberWithDouble:2.00005],[NSNumber numberWithDouble:3.13],[NSNumber numberWithDouble:8.4],[NSNumber numberWithDouble:100],[NSNumber numberWithDouble:4.8],[NSNumber numberWithDouble:-2.5], nil];
    XCTAssertTrue([expected isEqualToArray:[FlattenArrayExample flattenArray:inputArray]]);

}

-(void)testSixLevelDeepNestedListWithStringsAndNullValues{
    
    NSNull *nullValue = [NSNull null];
    NSArray *innerArray6 = [NSArray arrayWithObject:nullValue];
    NSArray *innerArray5 = [NSArray arrayWithObject:innerArray6];
    NSArray *innerArray4  = [NSArray arrayWithObject:@"One Hundred"];
    NSArray *innerArray3 = [NSArray arrayWithObject:innerArray4];
    NSArray *innerArray2 = [NSArray arrayWithObjects:@"Two",@"three", nil];
    NSArray *innerArray1 = [NSArray arrayWithObjects:innerArray2,@"eight",innerArray3,nullValue,innerArray5, nil];
    NSArray *inputArray = [NSArray arrayWithObjects:@"Zero",@"two",innerArray1,@"minus two", nil];
    NSArray *expected = [NSArray arrayWithObjects:@"Zero",@"two",@"Two",@"three",@"eight",@"One Hundred",@"minus two", nil];
    XCTAssertTrue([expected isEqualToArray:[FlattenArrayExample flattenArray:inputArray]]);

}
@end
