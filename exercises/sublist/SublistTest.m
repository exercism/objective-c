#import <XCTest/XCTest.h>

#if __has_include("SublistExample.h")
# import "SublistExample.h"
# else
# import "Sublist.h"
#endif

@interface SublistTest : XCTestCase

@end

@implementation SublistTest


- (void)testEmptyLists {
    
    XCTAssertEqualObjects(@"equal", [SublistExample classifierForFirstList:@[] andSecondList:@[]]);
}
    
- (void)testEmptyListWithinNonEmptyList{
    
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:@[] andSecondList:secondList]);

}
    
- (void)testNonEmptyListContainsEmptyList{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    XCTAssertEqualObjects(@"superlist", [SublistExample classifierForFirstList:firstList andSecondList:@[]]);
}
    
- (void)testListEqualsItself{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    XCTAssertEqualObjects(@"equal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testDifferentLists{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4], nil];
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testFalseStart{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:5],[NSNumber numberWithInt:6], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testConsecutive{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testSublistAtStart{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testSublistInMiddle{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testSublistAtEnd{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testAtStartOfSuperlist{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2], nil];
;
    XCTAssertEqualObjects(@"superlist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testAtMiddleOfSuperlist{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    ;
    XCTAssertEqualObjects(@"superlist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}

-(void)testAtEndOfSuperlist{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    ;
    XCTAssertEqualObjects(@"superlist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testFirstListMissingElementFromSecondList{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:3], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    ;
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testSecondListMissingOneElementFromFirstList{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:3], nil];
    ;
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testOrderMattersToAList{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:2],[NSNumber numberWithInt:1], nil];
    ;
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
-(void)testSameDigitsButDifferentNumbers{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:1], nil];
    ;
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}

@end
