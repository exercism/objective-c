#import "CryptoSquareExample.h"

@interface CryptoSquare ()

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *normalizedText;

@end

@implementation CryptoSquare

- (instancetype)initWithText:(NSString *)text {
    self = [super init];
    
    if (self) {
        _text = text;
        _normalizedText = [self normalizePlaintext];
        [self getSquareSize];
        _plaintextSegments = [self getPlaintextSegments];
        _cipherText = [self getCipherText];
        _normalizedCipherText = [self getNormalizedCipherText];
    }
    
    return self;
}

- (NSString *)normalizePlaintext {
    NSCharacterSet *characterSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSArray<NSString *> *components = [self.text componentsSeparatedByCharactersInSet:characterSet];
    NSString *rejoinedText = [components componentsJoinedByString:@""];
    
    return [rejoinedText lowercaseString];
}

- (void)getSquareSize {
    double length = (double)self.normalizedText.length;
    double root = sqrt(length);
    
    self.numberOfRows = (int)round(root);
    self.numberOfColumns = (int)ceil(root);
}

- (NSArray<NSString *> *)getPlaintextSegments {
    NSMutableArray<NSString *> *result = [[NSMutableArray alloc] init];
    NSMutableString *segment = [[NSMutableString alloc] initWithString:@""];
    
    for (int index = 0; index < self.normalizedText.length; index++) {
        NSString *newCharacter = [NSString stringWithFormat:@"%C", [self.normalizedText characterAtIndex:index]];
        [segment appendString:newCharacter];
        
        int position = index + 1;
        
        if (position % self.numberOfColumns == 0 || position == self.normalizedText.length) {
            [result addObject:[segment copy]];
            [segment setString:@""];
        }
    }
    
    return result;
}

- (NSString *)getCipherText {
    NSMutableString *result = [[NSMutableString alloc] initWithString:@""];
    
    for (int column = 0; column < self.numberOfColumns; column++) {
        for (NSString *segment in self.plaintextSegments) {
            if (column < segment.length) {
                NSString *newCharacter = [NSString stringWithFormat:@"%C", [segment characterAtIndex:column]];
                [result appendString:newCharacter];
            }
        }
    }
    
    return result;
}

- (NSString *)getNormalizedCipherText {
    NSMutableString *result = [[NSMutableString alloc] init];
    int counter = 0;
    
    for (int index = 0; index < self.cipherText.length; index++) {
        NSString *newCharacter = [NSString stringWithFormat:@"%C", [self.cipherText characterAtIndex:index]];
        
        if (counter % self.numberOfRows == 0 && counter != 0) {
            [result appendFormat:@" %@", newCharacter];
        } else {
            [result appendString:newCharacter];
        }
        
        counter++;
    }
    
    return result;
}

@end
