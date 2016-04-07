#import <Foundation/Foundation.h>
#import "PhoneNumberExample.h"

@interface PhoneNumber : NSObject

- (instancetype)initWithString:(NSString *)inputString;
- (NSString *)number;
- (NSString *)areaCode;

@end
