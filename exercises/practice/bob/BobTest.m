#import <XCTest/XCTest.h>

#if __has_include("BobExample.h")
# import "BobExample.h"
#else
# import "Bob.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BobTest : XCTestCase

@end

@implementation BobTest

- (Bob *)bob {
    return [[Bob alloc] init];
}

- (void)testAskingAQuestion {
    NSString *input = @"Does this cryogenic chamber make me look fat?";
    NSString *expected = @"Sure.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testShouting {
    NSString *input = @"WATCH OUT!";
    NSString *expected = @"Whoa, chill out!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testForcefulQuestion {
    NSString *input = @"WHAT'S GOING ON?";
    NSString *expected = @"Calm down, I know what I'm doing!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testSilence {
    NSString *input = @"";
    NSString *expected = @"Fine. Be that way!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testStatingSomething {
    NSString *input = @"Tom-ay-to, tom-aaaah-to.";
    NSString *expected = @"Whatever.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testAskingANumericQuestion {
    NSString *input = @"You are, what, like 15?";
    NSString *expected = @"Sure.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testAskingGibberish {
    NSString *input = @"fffbbcbeab?";
    NSString *expected = @"Sure.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testQuestionWithNoLetters {
    NSString *input = @"4?";
    NSString *expected = @"Sure.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testNonLettersWithQuestion {
    NSString *input = @":) ?";
    NSString *expected = @"Sure.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testPrattlingOn {
    NSString *input = @"Wait! Hang on. Are you going to be OK?";
    NSString *expected = @"Sure.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testEndingWithWhitespace {
    NSString *input = @"Okay if like my  spacebar  quite a bit?   ";
    NSString *expected = @"Sure.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testMultipleLineQuestion {
    NSString *input = @"\nDoes this cryogenic chamber make\n me look fat?";
    NSString *expected = @"Sure.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testShoutingGibberish {
    NSString *input = @"FCECDFCAAB";
    NSString *expected = @"Whoa, chill out!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testShoutingAStatementContainingAQuestionMark {
    NSString *input = @"DO LIONS EAT PEOPLE? AHHHHH.";
    NSString *expected = @"Whoa, chill out!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testShoutingNumbers {
    NSString *input = @"1, 2, 3 GO!";
    NSString *expected = @"Whoa, chill out!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testShoutingWithSpecialCharacters {
    NSString *input = @"ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!";
    NSString *expected = @"Whoa, chill out!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testShoutingWithNoExclamationMark {
    NSString *input = @"I HATE THE DENTIST";
    NSString *expected = @"Whoa, chill out!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testProlongedSilence {
    NSString *input = @"          ";
    NSString *expected = @"Fine. Be that way!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testAlternateSilence {
    NSString *input = @"\t\t\t\t\t\t\t\t\t\t";
    NSString *expected = @"Fine. Be that way!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testOtherWhitespace {
    NSString *input = @"\n\r \t";
    NSString *expected = @"Fine. Be that way!";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testTalkingForcefully {
    NSString *input = @"Hi there!";
    NSString *expected = @"Whatever.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testUsingAcronymsInRegularSpeech {
    NSString *input = @"It's OK if you don't want to go work for NASA.";
    NSString *expected = @"Whatever.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testNoLetters {
    NSString *input = @"1, 2, 3";
    NSString *expected = @"Whatever.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testStatementContainingQuestionMark {
    NSString *input = @"Ending with ? means a question.";
    NSString *expected = @"Whatever.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testStartingWithWhitespace {
    NSString *input = @"         hmmmmmmm...";
    NSString *expected = @"Whatever.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

- (void)testNonQuestionEndingWithWhitespace {
    NSString *input = @"This is a statement ending with whitespace      ";
    NSString *expected = @"Whatever.";
    NSString *result = [[self bob] hey:input];
    XCTAssertEqualObjects(expected, result);
}

@end
NS_ASSUME_NONNULL_END
