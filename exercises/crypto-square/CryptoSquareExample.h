#import <Foundation/Foundation.h>

@interface CryptoSquare : NSObject

@property (nonatomic, assign) int numberOfRows;
@property (nonatomic, assign) int numberOfColumns;
@property (nonatomic, strong) NSArray<NSString *> *plaintextSegments;
@property (nonatomic, strong) NSString *cipherText;
@property (nonatomic, strong) NSString *normalizedCipherText;

- (instancetype)initWithText:(NSString *)text;
- (NSString *)normalizePlaintext;

@end
