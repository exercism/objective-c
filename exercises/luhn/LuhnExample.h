#import <Foundation/Foundation.h>

@interface Luhn : NSObject

@property (nonatomic, assign, readonly) BOOL isValid;

- (instancetype)initWithString:(NSString *)string;

@end
