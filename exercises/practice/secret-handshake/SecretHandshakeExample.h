#import <Foundation/Foundation.h>

@interface SecretHandshake : NSObject

@property (nonatomic, strong, readonly) NSArray<NSString *> *commands;

- (instancetype)initWithNumber:(int)number;

@end
