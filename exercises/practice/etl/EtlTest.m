#import <XCTest/XCTest.h>

#if __has_include("EtlExample.h")
# import "EtlExample.h"
# else
# import "Etl.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<NSString *> StringArray;

@interface EtlTest : XCTestCase

@end

@implementation EtlTest


- (void)testTransformOneValue {
     NSDictionary<NSNumber*, StringArray*  >  *old = @{ @1 : @[ @"W" ] };
     NSDictionary<NSString *, NSNumber * > *expected = @{ @"w" : @1 };
    
     NSDictionary<NSString *, NSNumber *> *results = [Etl transform:old];
    
    XCTAssertEqualObjects(expected, results);
}

- (void)testTransformMoreValues {
    NSDictionary<NSNumber*, StringArray* > *old = @{ @1 : @[ @"W", @"G" ] };
    NSDictionary<NSString *, NSNumber * > *expected = @{ @"w" : @1, @"g" : @1 };
    
    NSDictionary<NSString *, NSNumber *> *results = [Etl transform:old];
    
    XCTAssertEqualObjects(expected, results);
}

- (void)testMoreKeys {
    NSDictionary<NSNumber*, StringArray* > *old = @{ @1 : @[ @"A", @"B" ], @2 : @[ @"C", @"D" ] };
   NSDictionary<NSString *, NSNumber * > *expected = @{ @"a" : @1, @"b" : @1, @"c" : @2, @"d" : @2 };
    
    NSDictionary<NSString *, NSNumber * > *results = [Etl transform:old];
    
    XCTAssertEqualObjects(expected, results);
}

- (void)testFullDataSet {
     NSDictionary<NSNumber*, StringArray* > *old = @{ @1 : @[ @"A", @"E", @"I", @"O", @"U", @"L", @"N", @"R", @"S", @"T" ],
                           @2 : @[ @"D", @"G" ],
                           @3 : @[ @"B", @"C", @"M", @"P" ],
                           @4 : @[ @"F", @"H", @"V", @"W", @"Y" ],
                           @5 : @[ @"K"],
                           @8 : @[ @"J", @"X" ],
                           @10 : @[ @"Q", @"Z" ]
                           };
    NSDictionary<NSString *, NSNumber * > *expected = @{ @"a" : @1, @"b" : @3, @"c" : @3, @"d" : @2, @"e" : @1,
                                @"f" : @4, @"g" : @2, @"h" : @4, @"i" : @1, @"j" : @8,
                                @"k" : @5, @"l" : @1, @"m" : @3, @"n" : @1, @"o" : @1,
                                @"p" : @3, @"q" : @10, @"r" : @1, @"s" : @1, @"t" : @1,
                                @"u" : @1, @"v" : @4, @"w" : @4, @"x" : @8, @"y" : @4,
                                @"z" : @10 };
    
    NSDictionary<NSString *, NSNumber * > *results = [Etl transform:old];
    
    XCTAssertEqualObjects(expected, results);
    
}
@end
NS_ASSUME_NONNULL_END
