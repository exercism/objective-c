#import <Foundation/Foundation.h>

@interface ScrabbleScore : NSObject

@property (nonatomic, assign, readonly) int score;

+ (int)score:(NSString *)word;
- (instancetype)initWithWord:(NSString *)word;

@end
