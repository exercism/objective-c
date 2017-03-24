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
    
- (void)testEmptyListWithinNonEmptyList {
    NSArray *secondList = @[@1, @2, @3];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:@[] andSecondList:secondList]);

}
    
- (void)testNonEmptyListContainsEmptyList {
    NSArray *firstList = @[@1, @2, @3];
    XCTAssertEqualObjects(@"superlist", [SublistExample classifierForFirstList:firstList andSecondList:@[]]);
}
    
- (void)testListEqualsItself {
    NSArray *firstList = @[@1, @2, @3];
    NSArray *secondList = @[@1, @2, @3];
    XCTAssertEqualObjects(@"equal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testDifferentLists {
    NSArray *firstList = @[@1, @2, @3];
    NSArray *secondList = @[@2, @3, @4];
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testFalseStart {
    NSArray *firstList = @[@1, @2, @5];
    NSArray *secondList = @[@0, @1, @2, @3, @1, @2, @5, @6];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testConsecutive {
    NSArray *firstList = @[@1, @1, @2];
    NSArray *secondList = @[@0, @1, @1, @1, @2, @1, @2];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testSublistAtStart {
    NSArray *firstList = @[@0, @1, @2];
    NSArray *secondList = @[@0, @1, @2, @3, @4, @5];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testSublistInMiddle{
    
    NSArray *firstList = @[@2, @3, @4];
    NSArray *secondList = @[@0, @1, @2, @3, @4, @5];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testSublistAtEnd {
    NSArray *firstList = @[@3, @4, @5];
    NSArray *secondList = @[@0, @1, @2, @3, @4, @5];
    XCTAssertEqualObjects(@"sublist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testAtStartOfSuperlist {
    NSArray *firstList = @[@0, @1, @2, @3, @4, @5];
    NSArray *secondList = @[@0, @1, @2];
    XCTAssertEqualObjects(@"superlist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testAtMiddleOfSuperlist {
    NSArray *firstList = @[@0, @1, @2, @3, @4, @5];
    NSArray *secondList = @[@2, @3];
    XCTAssertEqualObjects(@"superlist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}

- (void)testAtEndOfSuperlist {
    NSArray *firstList = @[@0, @1, @2, @3, @4, @5];
    NSArray *secondList = @[@3, @4, @5];
    XCTAssertEqualObjects(@"superlist", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testFirstListMissingElementFromSecondList {
    NSArray *firstList = @[@1, @3];
    NSArray *secondList = @[@1, @2, @3];
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testSecondListMissingOneElementFromFirstList {
    NSArray *firstList = @[@1, @2, @3];
    NSArray *secondList = @[@1, @3];
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testOrderMattersToAList {
    NSArray *firstList = @[@1, @2, @3];
    NSArray *secondList = @[@3, @2, @1];
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}
    
- (void)testSameDigitsButDifferentNumbers {
    NSArray *firstList = @[@1, @0, @1];
    NSArray *secondList = @[@10, @1];
    XCTAssertEqualObjects(@"unequal", [SublistExample classifierForFirstList:firstList andSecondList:secondList]);
}

@end
