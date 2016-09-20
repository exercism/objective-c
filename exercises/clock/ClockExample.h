#import <Foundation/Foundation.h>

@interface Clock : NSObject

+ (Clock *)clockWithHours:(int)hours minutes:(int)minutes;
+ (Clock *)clockWithHours:(int)hours;
- (Clock *)addMinutes:(int)minutes;
- (Clock *)subtractMinutes:(int)minutes;

@end
