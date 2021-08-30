#import <Foundation/Foundation.h>

@interface GradeSchool : NSObject

@property (nonatomic,strong,readwrite) NSMutableDictionary *db;

- (void)addStudentWithName:(NSString *)name andGrade:(NSNumber *)grade;
- (NSMutableArray *)studentsInGrade:(NSNumber *)grade;
- (NSDictionary *)sort;

@end
