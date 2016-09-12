#import <Foundation/Foundation.h>
#import "GradeSchoolExample.h"

@implementation GradeSchool

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.db = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)addStudentWithName:(NSString *)name andGrade:(NSNumber *)grade {
    NSMutableArray *studentsInGrade = [self studentsInGrade:grade];
    [studentsInGrade addObject:name];
}

- (NSMutableArray *)studentsInGrade:(NSNumber *)grade {
    
    NSMutableArray *studentsInGrade = [[self db] objectForKey:grade];
    
    if (!studentsInGrade) {
        studentsInGrade = [NSMutableArray array];
        self.db[grade] = studentsInGrade;
    }
    
    return studentsInGrade;
}

- (NSDictionary *)sort {
    NSMutableDictionary *sortedDB = [NSMutableDictionary dictionary];
    
    [[self allGradesOrdered] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        sortedDB[obj] = [self studentsInGradeOrdered:obj];
    }];
    
    return sortedDB;
}


- (NSArray *)studentsInGradeOrdered:(NSNumber *)grade {
    return [[self studentsInGrade:grade] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 isEqualToString:obj2]) {
            return NSOrderedSame;
        } else if (obj1 < obj2) {
            return NSOrderedDescending;
        }
        return NSOrderedAscending;
        
    }];
}

- (NSArray *)allGrades {
    return [[self db] allKeys];
}

- (NSArray *)allGradesOrdered {
    return [[self allGrades] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 isEqualToValue:obj2]) {
            return NSOrderedSame;
        } else if (obj1 < obj2) {
            return NSOrderedDescending;
        }
        return NSOrderedAscending;
        
    }];
}

@end