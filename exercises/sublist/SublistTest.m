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
    
    XCTAssertEqualObjects(@"equal", [SublistExample classifier:@[] andSecondArray:@[]]);
}
    
- (void)testEmptyListWithinNonEmptyList{
    
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifier:@[] andSecondArray:secondList]);

}
    
- (void)testNonEmptyListContainsEmptyList{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    XCTAssertEqualObjects(@"superlist", [SublistExample classifier:firstList andSecondArray:@[]]);
}
    
- (void)testListEqualsItself{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    XCTAssertEqualObjects(@"equal", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testDifferentLists{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4], nil];
    XCTAssertEqualObjects(@"unequal", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testFalseStart{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:5],[NSNumber numberWithInt:6], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testConsecutive{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testSublistAtStart{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testSublistInMiddle{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testSublistAtEnd{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testAtStartOfSuperlist{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2], nil];
;
    XCTAssertEqualObjects(@"superlist", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testAtMiddleOfSuperlist{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    ;
    XCTAssertEqualObjects(@"superlist", [SublistExample classifier:firstList andSecondArray:secondList]);
}

-(void)testAtEndOfSuperlist{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    ;
    XCTAssertEqualObjects(@"superlist", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testFirstListMissingElementFromSecondList{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:3], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    ;
    XCTAssertEqualObjects(@"unequal", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testSecondListMissingOneElementFromFirstList{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:3], nil];
    ;
    XCTAssertEqualObjects(@"unequal", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testOrderMattersToAList{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:2],[NSNumber numberWithInt:1], nil];
    ;
    XCTAssertEqualObjects(@"unequal", [SublistExample classifier:firstList andSecondArray:secondList]);
}
    
-(void)testSameDigitsButDifferentNumbers{
    
    NSArray *firstList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],nil];
    NSArray *secondList = [NSArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:1], nil];
    ;
    XCTAssertEqualObjects(@"unequal", [SublistExample classifier:firstList andSecondArray:secondList]);
}

@end
