#import <XCTest/XCTest.h>
#import "Etl.h"

@interface test_suite : XCTestCase

@end

@implementation test_suite

- (void)testTransformOneValue {
  NSDictionary *old = @{ @1 : @[ @"W" ] };
  NSDictionary *expected = @{ @"w" : @1 };

  NSDictionary *results = [ETL transform:old];

  XCTAssertEqualObjects(expected, results);
}

- (void)testTransformMoreValues {
  NSDictionary *old = @{ @1 : @[ @"W", @"G" ] };
  NSDictionary *expected = @{ @"w" : @1, @"g" : @1 };

  NSDictionary *results = [ETL transform:old];

  XCTAssertEqualObjects(expected, results);
}

- (void)testMoreKeys {
  NSDictionary *old = @{ @1 : @[ @"A", @"B" ], @2 : @[ @"C", @"D" ] };
  NSDictionary *expected = @{ @"a" : @1, @"b" : @1, @"c" : @2, @"d" : @2 };

  NSDictionary *results = [ETL transform:old];

  XCTAssertEqualObjects(expected, results);
}

- (void)testFullDataSet {
  NSDictionary *old = @{ @1 : @[ @"A", @"E", @"I", @"O", @"U", @"L", @"N", @"R", @"S", @"T" ],
                         @2 : @[ @"D", @"G" ],
                         @3 : @[ @"B", @"C", @"M", @"P" ],
                         @4 : @[ @"F", @"H", @"V", @"W", @"Y" ],
                         @5 : @[ @"K"],
                         @8 : @[ @"J", @"X" ],
                         @10 : @[ @"Q", @"Z" ]
                       };
  NSDictionary *expected = @{ @"a" : @1, @"b" : @3, @"c" : @3, @"d" : @2, @"e" : @1,
                              @"f" : @4, @"g" : @2, @"h" : @4, @"i" : @1, @"j" : @8,
                              @"k" : @5, @"l" : @1, @"m" : @3, @"n" : @1, @"o" : @1,
                              @"p" : @3, @"q" : @10, @"r" : @1, @"s" : @1, @"t" : @1,
                              @"u" : @1, @"v" : @4, @"w" : @4, @"x" : @8, @"y" : @4,
                              @"z" : @10 };

  NSDictionary *results = [ETL transform:old];

  XCTAssertEqualObjects(expected, results);

}

@end