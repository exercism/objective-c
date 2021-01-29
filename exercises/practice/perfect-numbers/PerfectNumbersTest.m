#import <XCTest/XCTest.h>

#if __has_include("PerfectNumbersExample.h")
# import "PerfectNumbersExample.h"
# else
# import "PerfectNumbers.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PerfectNumbersTest : XCTestCase

@end

@implementation PerfectNumbersTest

- (void)testPerfect {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:6];
    NumberClassification expectedValue = NumberClassificationPerfect;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testPerfectAgain {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:28];
    NumberClassification expectedValue = NumberClassificationPerfect;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testDeficient {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:13];
    NumberClassification expectedValue = NumberClassificationDeficient;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testAbundant {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:12];
    NumberClassification expectedValue = NumberClassificationAbundant;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

@end
NS_ASSUME_NONNULL_END
