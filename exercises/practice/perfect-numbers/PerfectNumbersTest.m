#import <XCTest/XCTest.h>

#if __has_include("PerfectNumbersExample.h")
# import "PerfectNumbersExample.h"
#else
# import "PerfectNumbers.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PerfectNumbersTest : XCTestCase

@end

@implementation PerfectNumbersTest

- (void)testSmallestPerfectNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:6];
    NumberClassification expectedValue = NumberClassificationPerfect;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testMediumPerfectNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:28];
    NumberClassification expectedValue = NumberClassificationPerfect;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testLargePerfectNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:33550336];
    NumberClassification expectedValue = NumberClassificationPerfect;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testSmallestAbundantNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:12];
    NumberClassification expectedValue = NumberClassificationAbundant;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testMediumAbundantNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:30];
    NumberClassification expectedValue = NumberClassificationAbundant;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testLargeAbundantNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:33550335];
    NumberClassification expectedValue = NumberClassificationAbundant;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testSmallestPrimeDeficientNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:2];
    NumberClassification expectedValue = NumberClassificationDeficient;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testSmallestNonPrimeDeficientNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:4];
    NumberClassification expectedValue = NumberClassificationDeficient;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testMediumDeficientNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:32];
    NumberClassification expectedValue = NumberClassificationDeficient;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testLargeDeficientNumberIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:33550337];
    NumberClassification expectedValue = NumberClassificationDeficient;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

- (void)testEdgeCaseNoFactorsOtherThanItselfIsClassifiedCorrectly {
    NumberClassifier *numberClassifier = [[NumberClassifier alloc] initWithNumber:1];
    NumberClassification expectedValue = NumberClassificationDeficient;
    NumberClassification result = [numberClassifier classification];
    XCTAssertEqual(result, expectedValue);
}

@end
NS_ASSUME_NONNULL_END
