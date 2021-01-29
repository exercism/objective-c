#import <XCTest/XCTest.h>

#if __has_include("GradeSchoolExample.h")
# import "GradeSchoolExample.h"
# else
# import "GradeSchool.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GradeSchoolTest : XCTestCase

@end

@implementation GradeSchoolTest

- (void)testAnEmptySchool {
    GradeSchool *school = [[GradeSchool alloc] init];
    NSDictionary<NSNumber *, NSArray<NSString *>*> *expected = @{};
    NSDictionary<NSNumber *, NSArray<NSString *>*> *result = [school db];
    XCTAssertEqualObjects(result, expected);
}

- (void)testAddStudent {
    GradeSchool *school = [[GradeSchool alloc] init];
    [school addStudentWithName:@"Aimee" andGrade:@2];
    NSDictionary<NSNumber *, NSArray<NSString *>*> *result = [school db];
    
    NSDictionary<NSNumber *, NSArray<NSString *>*> *expected = @{ @2 : @[ @"Aimee" ] };
    
    XCTAssertEqualObjects(result, expected);
}

- (void)testAddMoreStudentsInSameClass {
    GradeSchool *school = [[GradeSchool alloc] init];
    [school addStudentWithName:@"James" andGrade:@2];
    [school addStudentWithName:@"Blair" andGrade:@2];
    [school addStudentWithName:@"Paul" andGrade:@2];
    NSDictionary<NSNumber *, NSArray<NSString *>*> *result = [school db];
    
    NSDictionary<NSNumber *, NSArray<NSString *>*> *expected = @{ @2 : @[ @"James", @"Blair", @"Paul" ] };
    
    XCTAssertEqualObjects(result, expected);
}


- (void)testAddStudentsToDifferentGrades {
    GradeSchool *school = [[GradeSchool alloc] init];
    [school addStudentWithName:@"Chelsea" andGrade:@3];
    [school addStudentWithName:@"Logan" andGrade:@7];
    NSDictionary<NSNumber *, NSArray<NSString *>*> *result = [school db];
    
    NSDictionary<NSNumber *, NSArray<NSString *>*> *expected = @{ @3 : @[ @"Chelsea" ], @7 : @[ @"Logan" ] };
    XCTAssertEqualObjects(result, expected);
}

- (void)testGetStudentsInAGrade {
    GradeSchool *school = [[GradeSchool alloc] init];
    [school addStudentWithName:@"Franklin" andGrade:@5];
    [school addStudentWithName:@"Bradley" andGrade:@5];
    [school addStudentWithName:@"Jeff" andGrade:@1];
    NSArray<NSString *> *result = [school studentsInGrade:@5];
    
    NSArray<NSString *> *expected = @[ @"Franklin", @"Bradley" ];
    XCTAssertEqualObjects(result, expected);
}

- (void)testGetStudentsInANonExistantGrade {
    GradeSchool *school = [[GradeSchool alloc] init];
    NSArray<NSString *> *result = [school studentsInGrade:@1];
    
    NSArray<NSString *> *expected = @[];
    XCTAssertEqualObjects(result, expected);
}

- (void)testSortSchool {
    GradeSchool *school = [[GradeSchool alloc] init];
    [school addStudentWithName:@"Jennifer" andGrade:@4];
    [school addStudentWithName:@"Kareem" andGrade:@6];
    [school addStudentWithName:@"Christopher" andGrade:@4];
    [school addStudentWithName:@"Kyle" andGrade:@3];
    NSDictionary<NSNumber *, NSArray<NSString *>*> *result = [school sort];
    
    NSDictionary<NSNumber *, NSArray<NSString *>*> *expected = @{ @3 : @[ @"Kyle"],
                                @4 : @[ @"Christopher", @"Jennifer" ],
                                @6 : @[ @"Kareem"] };
    
    XCTAssertEqualObjects(result, expected);
}

@end
NS_ASSUME_NONNULL_END

