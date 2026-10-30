#import <XCTest/XCTest.h>

#if __has_include("StrainExample.h")
# import "StrainExample.h"
#else
# import "Strain.h"
#endif



@interface StrainTest : XCTestCase
@end

@implementation StrainTest


- (void)testKeepOnEmptyListReturnsEmptyList {
    NSArray *input = @[];
    NSArray *expected = @[];
    BOOL (^predicate)(id) = ^BOOL(id item) { return YES; };

    XCTAssertEqualObjects(expected, [input keep:YES where:predicate]);

}


- (void)testKeepsEverything {
    NSArray *input = @[@1, @3, @5];
    NSArray *expected = @[@1, @3, @5];
    BOOL (^predicate)(id) = ^BOOL(id item) { return YES; };

    XCTAssertEqualObjects(expected, [input keep:YES where:predicate]);

}


- (void)testKeepsNothing {
    NSArray *input = @[@1, @3, @5];
    NSArray *expected = @[];
    BOOL (^predicate)(id) = ^BOOL(id item) { return NO; };

    XCTAssertEqualObjects(expected, [input keep:YES where:predicate]);

}


- (void)testKeepsFirstAndLast {
    NSArray *input = @[@1, @2, @3];
    NSArray *expected = @[@1, @3];
    BOOL (^predicate)(id) = ^BOOL(NSNumber *item) { return item.integerValue % 2 == 1; };

    XCTAssertEqualObjects(expected, [input keep:YES where:predicate]);

}


- (void)testKeepsNeitherFirstNorLast {
    NSArray *input = @[@1, @2, @3];
    NSArray *expected = @[@2];
    BOOL (^predicate)(id) = ^BOOL(NSNumber *item) { return item.integerValue % 2 == 0; };

    XCTAssertEqualObjects(expected, [input keep:YES where:predicate]);

}


- (void)testKeepsStrings {
    NSArray *input = @[@"apple", @"zebra", @"banana", @"zombies", @"cherimoya", @"zealot"];
    NSArray *expected = @[@"zebra", @"zombies", @"zealot"];
    BOOL (^predicate)(id) = ^BOOL(NSString *item) { return [item hasPrefix:@"z"]; };

    XCTAssertEqualObjects(expected, [input keep:YES where:predicate]);

}


- (void)testKeepsLists {
    NSArray *input = @[@[@1, @2, @3], @[@5, @5, @5], @[@5, @1, @2], @[@2, @1, @2], @[@1, @5, @2], @[@2, @2, @1], @[@1, @2, @5]];
    NSArray *expected = @[@[@5, @5, @5], @[@5, @1, @2], @[@1, @5, @2], @[@1, @2, @5]];
    BOOL (^predicate)(id) = ^BOOL(NSArray *item) { return [item containsObject:@5]; };

    XCTAssertEqualObjects(expected, [input keep:YES where:predicate]);

}


- (void)testDiscardOnEmptyListReturnsEmptyList {
    NSArray *input = @[];
    NSArray *expected = @[];
    BOOL (^predicate)(id) = ^BOOL(id item) { return YES; };

    XCTAssertEqualObjects(expected, [input discard:predicate]);

}


- (void)testDiscardsEverything {
    NSArray *input = @[@1, @3, @5];
    NSArray *expected = @[];
    BOOL (^predicate)(id) = ^BOOL(id item) { return YES; };

    XCTAssertEqualObjects(expected, [input discard:predicate]);

}


- (void)testDiscardsNothing {
    NSArray *input = @[@1, @3, @5];
    NSArray *expected = @[@1, @3, @5];
    BOOL (^predicate)(id) = ^BOOL(id item) { return NO; };

    XCTAssertEqualObjects(expected, [input discard:predicate]);

}


- (void)testDiscardsFirstAndLast {
    NSArray *input = @[@1, @2, @3];
    NSArray *expected = @[@2];
    BOOL (^predicate)(id) = ^BOOL(NSNumber *item) { return item.integerValue % 2 == 1; };

    XCTAssertEqualObjects(expected, [input discard:predicate]);

}


- (void)testDiscardsNeitherFirstNorLast {
    NSArray *input = @[@1, @2, @3];
    NSArray *expected = @[@1, @3];
    BOOL (^predicate)(id) = ^BOOL(NSNumber *item) { return item.integerValue % 2 == 0; };

    XCTAssertEqualObjects(expected, [input discard:predicate]);

}


- (void)testDiscardsStrings {
    NSArray *input = @[@"apple", @"zebra", @"banana", @"zombies", @"cherimoya", @"zealot"];
    NSArray *expected = @[@"apple", @"banana", @"cherimoya"];
    BOOL (^predicate)(id) = ^BOOL(NSString *item) { return [item hasPrefix:@"z"]; };

    XCTAssertEqualObjects(expected, [input discard:predicate]);

}


- (void)testDiscardsLists {
    NSArray *input = @[@[@1, @2, @3], @[@5, @5, @5], @[@5, @1, @2], @[@2, @1, @2], @[@1, @5, @2], @[@2, @2, @1], @[@1, @2, @5]];
    NSArray *expected = @[@[@1, @2, @3], @[@2, @1, @2], @[@2, @2, @1]];
    BOOL (^predicate)(id) = ^BOOL(NSArray *item) { return [item containsObject:@5]; };

    XCTAssertEqualObjects(expected, [input discard:predicate]);

}


@end
