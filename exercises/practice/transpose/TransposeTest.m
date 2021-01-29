#import <XCTest/XCTest.h>

#if __has_include("TransposeExample.h")
# import "TransposeExample.h"
# else
# import "Transpose.h"
#endif

@interface TransposeTest : XCTestCase

@end

@implementation TransposeTest

- (void)testEmptyInput {
    XCTAssertEqualObjects([Transpose transpose:@[]], @[]);
}

- (void)testTwoCharactersInARow {
    NSArray<NSString *> *input = @[@"A1"];
    NSArray<NSString *> *expected = @[@"A", @"1"];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testTwoCharactersInAColumn {
    NSArray<NSString *> *input = @[@"A", @"1"];
    NSArray<NSString *> *expected = @[@"A1"];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testSimple {
    NSArray<NSString *> *input = @[@"ABC", @"123"];
    NSArray<NSString *> *expected = @[@"A1", @"B2", @"C3"];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testSingleLine {
    NSArray<NSString *> *input = @[@"Single line."];
    NSArray<NSString *> *expected = @[@"S", @"i", @"n", @"g", @"l", @"e", @"", @"l", @"i", @"n", @"e", @"."];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testFirstLineLongerThanSecondLine {
    NSArray<NSString *> *input = @[@"The fourth line.", @"The fifth line."];
    NSArray<NSString *> *expected = @[@"TT", @"hh", @"ee", @"", @"ff", @"oi", @"uf", @"rt", @"th", @"h", @" l", @"li", @"in", @"ne", @"e.", @"."];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testSecondLineLongerThanFirstLine {
    NSArray<NSString *> *input = @[@"The first line.", @"The second line."];
    NSArray<NSString *> *expected = @[@"TT", @"hh", @"ee", @"", @"fs", @"ie", @"rc", @"so", @"tn", @" d", @"l", @"il", @"ni", @"en", @".e", @" ."];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testSquare {
    NSArray<NSString *> *input = @[@"HEART", @"EMBER", @"ABUSE", @"RESIN", @"TREND"];
    NSArray<NSString *> *expected = @[@"HEART", @"EMBER", @"ABUSE", @"RESIN", @"TREND"];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testRectangle {
    NSArray<NSString *> *input = @[@"FRACTURE", @"OUTLINED", @"BLOOMING", @"SEPTETTE"];
    NSArray<NSString *> *expected = @[@"FOBS", @"RULE", @"ATOP", @"CLOT", @"TIME", @"UNIT", @"RENT", @"EDGE"];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testTriangle {
    NSArray<NSString *> *input = @[@"T", @"EE", @"AAA", @"SSSS", @"EEEEE", @"RRRRRR"];
    NSArray<NSString *> *expected = @[@"TEASER", @" EASER", @"  ASER", @"   SER", @"    ER", @"     R"];
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}

- (void)testManyLines { //!OCLINT
    NSArray<NSString *> *input = @[@"Chor. Two households, both alike in dignity,",
                                   @"In fair Verona, where we lay our scene,",
                                   @"From ancient grudge break to new mutiny,",
                                   @"Where civil blood makes civil hands unclean.",
                                   @"From forth the fatal loins of these two foes",
                                   @"A pair of star-cross'd lovers take their life;",
                                   @"Whose misadventur'd piteous overthrows",
                                   @"Doth with their death bury their parents' strife.",
                                   @"The fearful passage of their death-mark'd love,",
                                   @"And the continuance of their parents' rage,",
                                   @"Which, but their children's end, naught could remove,",
                                   @"Is now the two hours' traffic of our stage;",
                                   @"The which if you with patient ears attend,",
                                   @"What here shall miss, our toil shall strive to mend."
                                   ];
    
    NSArray<NSString *> *expected = @[
                                      @"CIFWFAWDTAWITW",
                                      @"hnrhr hohnhshh",
                                      @"o oeopotedi ea",
                                      @"rfmrmash  cn t",
                                      @".a e ie fthow",
                                      @" ia fr weh,whh",
                                      @"Trnco miae  ie",
                                      @"w ciroitr btcr",
                                      @"oVivtfshfcuhhe",
                                      @" eeih a uote",
                                      @"hrnl sdtln  is",
                                      @"oot ttvh tttfh",
                                      @"un bhaeepihw a",
                                      @"saglernianeoyl",
                                      @"e,ro -trsui ol",
                                      @"h uofcu sarhu",
                                      @"owddarrdan o m",
                                      @"lhg to'egccuwi",
                                      @"deemasdaeehris",
                                      @"sr als t  ists",
                                      @",ebk 'phool'h,",
                                      @"  reldi ffd",
                                      @"bweso tb  rtpo",
                                      @"oea ileutterau",
                                      @"t kcnoorhhnatr",
                                      @"hl isvuyee'fi",
                                      @" atv es iisfet",
                                      @"ayoior trr ino",
                                      @"l  lfsoh  ecti",
                                      @"ion   vedpn  l",
                                      @"kuehtteieadoe",
                                      @"erwaharrar,fas",
                                      @"   nekt te  rh",
                                      @"ismdsehphnnosa",
                                      @"ncuse ra-tau l",
                                      @" et  tormsural",
                                      @"dniuthwea'g t",
                                      @"iennwesnr hsts",
                                      @"g,ycoi tkrttet",
                                      @"n ,l r s'a anr",
                                      @"i  ef  'dgcgdi",
                                      @"t  aol   eoe,v",
                                      @"y  nei sl,u; e",
                                      @",  .sf to l",
                                      @"     e rv d  t",
                                      @"     ; ie    o",
                                      @"       f, r",
                                      @"       e  e  m",
                                      @"       .  m  e",
                                      @"          o  n",
                                      @"          v  d",
                                      @"          e  .",
                                      @"          ,"
                                      ];
    
    XCTAssertEqualObjects([Transpose transpose:input], expected);
}


@end
