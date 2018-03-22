//
//  StrainTest.m
//  xobjectivecTest
//
//  Created by Alwyn Savio Concessao on 12/03/18.
//  Copyright © 2018 exercism. All rights reserved.
//

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
    
    NSArray *inputArray = [NSArray array];
    
    NSArray *expectedArray = inputArray;
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        return arrayElement < 10;
        
    }]);
}

- (void)testKeepEverything {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@1,@2,@3, nil];
    
    NSArray *expectedArray = inputArray;
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *n = (NSNumber*)arrayElement;
        int i = n.intValue;
        return i < 10;
        
    }]);
}

-(void)testKeepFirstAndLastElements {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@1,@2,@3, nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@1,@3, nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *n = (NSNumber*)arrayElement;
        int i = n.intValue;
        return i % 2 != 0;
        
    }]);
}

-(void)testKeepNeitherFirstNorLastElement {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@1,@2,@3,@4,@5, nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@2,@4, nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *n = (NSNumber*)arrayElement;
        int i = n.intValue;
        return i % 2 == 0;
        
    }]);
}

-(void)testKeepStrings {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@"apple",@"zebra",@"banana",@"Zombies",@"cherimoya",@"zealot", nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@"zebra",@"Zombies",@"zealot", nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSString *s = (NSString*)arrayElement;
        
        return ([s rangeOfString:@"z"].location != NSNotFound || [s rangeOfString:@"Z"].location != NSNotFound);
        
    }]);
}

-(void)testKeepArrays {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@[@1,@2,@3],@[@5,@5,@5],@[@5,@1,@2],@[@2,@1,@2],@[@1,@5,@2],@[@2,@2,@1],@[@1,@2,@5], nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@[@5,@5,@5],@[@5,@1,@2],@[@1,@5,@2],@[@1,@2,@5], nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSArray *a = (NSArray*)arrayElement;
        return [a containsObject:@5];
        
    }]);
   
}

-(void)testDiscardEmptyArray {
    
    NSArray *inputArray = [NSArray array];
    
    NSArray *expectedArray = inputArray;
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *n = (NSNumber*)arrayElement;
        int i = n.intValue;
        return i < 10;
        
    }]);
    
}

-(void)testDiscardNothing {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@1,@2,@3, nil];
    
    NSArray *expectedArray = inputArray;
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *n = (NSNumber*)arrayElement;
        int i = n.intValue;
        return i > 10;
        
    }]);
}

-(void)testDiscardFirstAndLastElements {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@1,@2,@3, nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@2, nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *n = (NSNumber*)arrayElement;
        int i = n.intValue;
        return i % 2 != 0;
        
    }]);
}

-(void)testDiscardNeitherFirstNorLastElement {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@1,@2,@3,@4,@5, nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@1,@3,@5, nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSNumber *n = (NSNumber*)arrayElement;
        int i = n.intValue;
        return i % 2 == 0;
        
    }]);
}

-(void)testDiscardStrings {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@"apple",@"zebra",@"banana",@"Zombies",@"cherimoya",@"zealot", nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@"apple",@"banana",@"cherimoya", nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSString *s = (NSString*)arrayElement;
        
        return ([s rangeOfString:@"z"].location != NSNotFound || [s rangeOfString:@"Z"].location != NSNotFound);
      
    }]);
}

-(void)testDiscardArrays {
    
    NSArray *inputArray = [NSArray arrayWithObjects:@[@1,@2,@3],@[@5,@5,@5],@[@5,@1,@2],@[@2,@1,@2],@[@1,@5,@2],@[@2,@2,@1],@[@1,@2,@5], nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@[@1,@2,@3],@[@2,@1,@2],@[@2,@2,@1], nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSArray *a = (NSArray*)arrayElement;
        return [a containsObject:@5];
        
    }]);
}

-(void)testKeepOnMutableArrays {
    
    NSMutableArray *inputArray = [NSMutableArray arrayWithObjects:@[@1,@2,@3],@[@5,@5,@5],@[@5,@1,@2],@[@2,@1,@2],@[@1,@5,@2],@[@2,@2,@1],@[@1,@2,@5], nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@[@5,@5,@5],@[@5,@1,@2],@[@1,@5,@2],@[@1,@2,@5], nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray keep:true where:^BOOL(id  _Nonnull arrayElement) {
        
        NSArray *a = (NSArray*)arrayElement;
        return [a containsObject:@5];
        
    }]);
}

-(void)testDiscardOnMutableArrays {
    
    NSMutableArray *inputArray = [NSMutableArray arrayWithObjects:@[@1,@2,@3],@[@5,@5,@5],@[@5,@1,@2],@[@2,@1,@2],@[@1,@5,@2],@[@2,@2,@1],@[@1,@2,@5], nil];
    
    NSArray *expectedArray = [NSArray arrayWithObjects:@[@1,@2,@3],@[@2,@1,@2],@[@2,@2,@1], nil];
    
    XCTAssertEqualObjects(expectedArray, [inputArray discard:^BOOL(id  _Nonnull arrayElement) {
        
        NSArray *a = (NSArray*)arrayElement;
        return [a containsObject:@5];
        
    }]);
}

@end
