#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NumberClassification) {
    NumberClassificationPerfect,
    NumberClassificationAbundant,
    NumberClassificationDeficient
};

@interface NumberClassifier : NSObject

- (instancetype)initWithNumber:(int)number;
- (NumberClassification)classification;

@end