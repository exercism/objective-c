#import <XCTest/XCTest.h>

#if __has_include("SecretHandshakeExample.h")
# import "SecretHandshakeExample.h"
# else
# import "SecretHandshake.h"
#endif

@interface SecretHandshakeTest : XCTestCase

@end

@implementation SecretHandshakeTest

- (void)testHandshake1ToWink {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:1];
    XCTAssertEqualObjects(@[@"wink"], handshake.commands);
}

- (void)testHandshake10ToDoubleBlink {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:2];
    XCTAssertEqualObjects(@[@"double blink"], handshake.commands);
}

- (void)testHandshake100ToCloseYourEyes {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:4];
    XCTAssertEqualObjects(@[@"close your eyes"], handshake.commands);
}

- (void)testHandshake1000ToJump {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:8];
    XCTAssertEqualObjects(@[@"jump"], handshake.commands);
}

- (void)testHandshake11ToWinkAndDoubleBlink {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:3];
    NSArray<NSString *> *expected = @[@"wink", @"double blink"];
    XCTAssertEqualObjects(expected, handshake.commands);
}

- (void)testHandshake10011ToDoubleBlinkAndWink {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:19];
    NSArray<NSString *> *expected = @[@"double blink", @"wink"];
    XCTAssertEqualObjects(expected, handshake.commands);
}

- (void)testHandshake11111ToDoubleBlinkAndWink {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:31];
    NSArray<NSString *> *expected = @[@"jump", @"close your eyes", @"double blink", @"wink"];
    XCTAssertEqualObjects(expected, handshake.commands);
}

- (void)testNonValidHandshake {
    SecretHandshake *handshake = [[SecretHandshake alloc] initWithNumber:0];
    XCTAssertEqualObjects(@[], handshake.commands);
}

@end
