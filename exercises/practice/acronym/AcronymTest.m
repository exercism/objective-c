#import <XCTest/XCTest.h>

#if __has_include("AcronymExample.h")
# import "AcronymExample.h"
# else
# import "Acronym.h"
#endif

@interface AcronymTest : XCTestCase

@end

@implementation AcronymTest

- (void)testAcronymAbbreviateTest1 {
    XCTAssertEqualObjects(@"PNG", [Acronym abbreviate:@"Portable Network Graphics"]);
}

- (void)testAcronymAbbreviateTest2 {
    XCTAssertEqualObjects(@"ROR", [Acronym abbreviate:@"Ruby on Rails"]);
}

- (void)testAcronymAbbreviateTest3 {
    XCTAssertEqualObjects(@"HTML", [Acronym abbreviate:@"HyperText Markup Language"]);
}

- (void)testAcronymAbbreviateTest4 {
    XCTAssertEqualObjects(@"FIFO", [Acronym abbreviate:@"First In, First Out"]);
}

- (void)testAcronymAbbreviateTest5 {
    XCTAssertEqualObjects(@"PHP", [Acronym abbreviate:@"PHP: Hypertext Preprocessor"]);
}

- (void)testAcronymAbbreviateTest6 {
    XCTAssertEqualObjects(@"CMOS", [Acronym abbreviate:@"Complementary metal-oxide semiconductor"]);
}

@end
