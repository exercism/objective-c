#import <Foundation/Foundation.h>

@interface RunLengthEncoding : NSObject

+ (NSString *)encode:(NSString *)text;
+ (NSString *)decode:(NSString *)text;

@end
