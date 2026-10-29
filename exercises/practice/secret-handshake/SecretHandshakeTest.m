#import <XCTest/XCTest.h>

#if __has_include("SecretHandshakeExample.h")
# import "SecretHandshakeExample.h"
#else
# import "SecretHandshake.h"
#endif

@interface SecretHandshakeTest : XCTestCase
@end

@implementation SecretHandshakeTest


- (void)testWinkFor1 {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:1];
    NSArray<NSString *> *expected = @[@"wink"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testDoubleBlinkFor10 {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:2];
    NSArray<NSString *> *expected = @[@"double blink"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testCloseYourEyesFor100 {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:4];
    NSArray<NSString *> *expected = @[@"close your eyes"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testJumpFor1000 {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:8];
    NSArray<NSString *> *expected = @[@"jump"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testCombineTwoActions {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:3];
    NSArray<NSString *> *expected = @[@"wink", @"double blink"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testReverseTwoActions {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:19];
    NSArray<NSString *> *expected = @[@"double blink", @"wink"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testReversingOneActionGivesTheSameAction {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:24];
    NSArray<NSString *> *expected = @[@"jump"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testReversingNoActionsStillGivesNoActions {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:16];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testAllPossibleActions {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:15];
    NSArray<NSString *> *expected = @[@"wink", @"double blink", @"close your eyes", @"jump"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testReverseAllPossibleActions {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:31];
    NSArray<NSString *> *expected = @[@"jump", @"close your eyes", @"double blink", @"wink"];
    XCTAssertEqualObjects(expected, handshake.commands);
}


- (void)testDoNothingForZero {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:0];
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(expected, handshake.commands);
}


@end
