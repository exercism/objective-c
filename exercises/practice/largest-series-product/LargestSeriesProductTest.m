#import <XCTest/XCTest.h>

#if __has_include("LargestSeriesProductExample.h")
# import "LargestSeriesProductExample.h"
# else
# import "LargestSeriesProduct.h"
#endif


@interface LargestSeriesProductTest : XCTestCase

@end

@implementation LargestSeriesProductTest

- (void)testCanFindTheLargestProductOf2WithNumbersInOrder {
    XCTAssertEqual(72, [[[LargestSeriesProduct alloc] initWithNumberString:@"0123456789"] largestProduct:2]);
}

- (void)testCanFindTheLargestProductOf2 {
    XCTAssertEqual(48, [[[LargestSeriesProduct alloc] initWithNumberString:@"576802143"] largestProduct:2]);
}

- (void)testFindsTheLargestProductIfSpanEqualsLength {
    XCTAssertEqual(18, [[[LargestSeriesProduct alloc] initWithNumberString:@"29"] largestProduct:2]);
}

- (void)testCanFindTheLargestProductOf3WithNumbersInOrder {
    XCTAssertEqual(504, [[[LargestSeriesProduct alloc] initWithNumberString:@"0123456789"] largestProduct:3]);
}

- (void)testCanFindTheLargestProductOf3 {
    XCTAssertEqual(270, [[[LargestSeriesProduct alloc] initWithNumberString:@"1027839564"] largestProduct:3]);
}

- (void)testCanFindTheLargestProductOf5WithNumbersInOrder {
    XCTAssertEqual(15120, [[[LargestSeriesProduct alloc] initWithNumberString:@"0123456789"] largestProduct:5]);
}

- (void)testCanGetTheLargestProductOfABigNumber {
    XCTAssertEqual(23520, [[[LargestSeriesProduct alloc] initWithNumberString:@"73167176531330624919225119674426574742355349194934"] largestProduct:6]);
}

- (void)testCanGetTheLargestProductOfAnotherBigNumber {
    XCTAssertEqual(28350, [[[LargestSeriesProduct alloc] initWithNumberString:@"52677741234314237566414902593461595376319419139427"]  largestProduct:6]);
}

- (void)testCanGetTheLargestProductOfABigNumberProjectEuler {
    XCTAssertEqual(23514624000, [[[LargestSeriesProduct alloc] initWithNumberString:@"7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"] largestProduct:13]); //!OCLINT
}

- (void)testReportsZeroIfTheOnlyDigitsAreZero {
    XCTAssertEqual(0, [[[LargestSeriesProduct alloc] initWithNumberString:@"0000"] largestProduct:2]);
}

- (void)testReportsZeroIfAllSpansIncludeZero {
    XCTAssertEqual(0, [[[LargestSeriesProduct alloc] initWithNumberString:@"99099"] largestProduct:3]);
}

- (void)testRejectsSpanLongerThanStringLength {
    XCTAssertThrows([[[LargestSeriesProduct alloc] initWithNumberString:@"123"] largestProduct:4]);
}

- (void)testReports1ForEmptyStringAndEmptyProduct0Span {
    XCTAssertEqual(1, [[[LargestSeriesProduct alloc] initWithNumberString:@""] largestProduct:0]);
}

- (void)testReports1ForNonemptyStringAndEmptyProduct0Span {
    XCTAssertEqual(1, [[[LargestSeriesProduct alloc] initWithNumberString:@"123"] largestProduct:0]);
}

- (void)testRejectsEmptyStringAndNonzeroSpan {
    XCTAssertThrows([[[LargestSeriesProduct alloc] initWithNumberString:@""] largestProduct:1]);
}

- (void)testRejectsInvalidCharacterInDigits {
    XCTAssertThrows([[[LargestSeriesProduct alloc] initWithNumberString:@"1234a5"] largestProduct:2]);
}

- (void)testRejectsNegativeSpan {
    XCTAssertThrows([[[LargestSeriesProduct alloc] initWithNumberString:@"12345"] largestProduct:-1]);
}

@end
