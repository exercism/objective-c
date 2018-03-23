#import <XCTest/XCTest.h>

#if __has_include("StrainExample.h")
# import "StrainExample.h"
# else
# import "Strain.h"
#endif

@interface StrainTest : XCTestCase

@end

@implementation StrainTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmptyKeep {
    
    NSArray *inputArray = @[];
    
    NSArray *expectedArray = inputArray;
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *number = (NSNumber*)arrayElement;
        int integerNumber = number.intValue;
        return integerNumber < 10;
        
    }]);
}

- (void)testKeepEverything {
    
    NSArray *inputArray = @[@1,@2,@3];
    
    NSArray *expectedArray = inputArray;
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *number = (NSNumber*)arrayElement;
        int integerNumber = number.intValue;
        return integerNumber < 10;
        
    }]);
}

-(void)testKeepFirstAndLastElements {
    
    NSArray *inputArray = @[@1,@2,@3];
    
    NSArray *expectedArray = @[@1,@3];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *number = (NSNumber*)arrayElement;
        int integerNumber = number.intValue;
        return integerNumber % 2 != 0;
        
    }]);
}

-(void)testKeepNeitherFirstNorLastElement {
    
    NSArray *inputArray = @[@1,@2,@3,@4,@5];
    
    NSArray *expectedArray = @[@2,@4];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *number = (NSNumber*)arrayElement;
        int integerNumber = number.intValue;
        return integerNumber % 2 == 0;
        
    }]);
}

-(void)testKeepStrings {
    
    NSArray *inputArray = @[@"apple",@"zebra",@"banana",@"Zombies",@"cherimoya",@"zealot"];
    
    NSArray *expectedArray = @[@"zebra",@"Zombies",@"zealot"];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSString *string = (NSString*)arrayElement;
        
        return ([string rangeOfString:@"z"].location != NSNotFound || [string rangeOfString:@"Z"].location != NSNotFound);
        
    }]);
}

-(void)testKeepArrays {
    
    NSArray *inputArray = @[@[@1,@2,@3],@[@5,@5,@5],@[@5,@1,@2],@[@2,@1,@2],@[@1,@5,@2],@[@2,@2,@1],@[@1,@2,@5]];
    
    NSArray *expectedArray = @[@[@5,@5,@5],@[@5,@1,@2],@[@1,@5,@2],@[@1,@2,@5]];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSArray *nestedArray = (NSArray*)arrayElement;
        return [nestedArray containsObject:@5];
        
    }]);
   
}

-(void)testDiscardEmptyArray {
    
    NSArray *inputArray = @[];
    
    NSArray *expectedArray = inputArray;
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *number = (NSNumber*)arrayElement;
        int integerNumber = number.intValue;
        return integerNumber < 10;
        
    }]);
    
}

-(void)testDiscardNothing {
    
    NSArray *inputArray = @[@1,@2,@3];
    
    NSArray *expectedArray = inputArray;
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *number = (NSNumber*)arrayElement;
        int integerNumber = number.intValue;
        return integerNumber > 10;
        
    }]);
}

-(void)testDiscardFirstAndLastElements {
    
    NSArray *inputArray = @[@1,@2,@3];
    
    NSArray *expectedArray = @[@2];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *number = (NSNumber*)arrayElement;
        int integerNumber = number.intValue;
        return integerNumber % 2 != 0;
        
    }]);
}

-(void)testDiscardNeitherFirstNorLastElement {
    
    NSArray *inputArray = @[@1,@2,@3,@4,@5];
    
    NSArray *expectedArray = @[@1,@3,@5];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *number = (NSNumber*)arrayElement;
        int integerNumber = number.intValue;
        return integerNumber % 2 == 0;
        
    }]);
}

-(void)testDiscardStrings {
    
    NSArray *inputArray = @[@"apple",@"zebra",@"banana",@"Zombies",@"cherimoya",@"zealot"];
    
    NSArray *expectedArray = @[@"apple",@"banana",@"cherimoya"];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSString *string = (NSString*)arrayElement;
        
        return ([string rangeOfString:@"z"].location != NSNotFound || [string rangeOfString:@"Z"].location != NSNotFound);
      
    }]);
}

-(void)testDiscardArrays {
    
    NSArray *inputArray = @[@[@1,@2,@3],@[@5,@5,@5],@[@5,@1,@2],@[@2,@1,@2],@[@1,@5,@2],@[@2,@2,@1],@[@1,@2,@5]];
    
    NSArray *expectedArray = @[@[@1,@2,@3],@[@2,@1,@2],@[@2,@2,@1]];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSArray *nestedArray = (NSArray*)arrayElement;
        return [nestedArray containsObject:@5];
        
    }]);
}

-(void)testKeepOnMutableArrays {
    
    NSMutableArray *inputArray = [NSMutableArray arrayWithObjects:@[@1,@2,@3],@[@5,@5,@5],@[@5,@1,@2],@[@2,@1,@2],@[@1,@5,@2],@[@2,@2,@1],@[@1,@2,@5], nil];
    
    NSArray *expectedArray = @[@[@5,@5,@5],@[@5,@1,@2],@[@1,@5,@2],@[@1,@2,@5]];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSArray *nestedArray = (NSArray*)arrayElement;
        return [nestedArray containsObject:@5];
        
    }]);
}

-(void)testDiscardOnMutableArrays {
    
    NSMutableArray *inputArray = [NSMutableArray arrayWithObjects:@[@1,@2,@3],@[@5,@5,@5],@[@5,@1,@2],@[@2,@1,@2],@[@1,@5,@2],@[@2,@2,@1],@[@1,@2,@5], nil];
    
    NSArray *expectedArray = @[@[@1,@2,@3],@[@2,@1,@2],@[@2,@2,@1]];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSArray *nestedArray = (NSArray*)arrayElement;
        return [nestedArray containsObject:@5];
        
    }]);
}

@end
