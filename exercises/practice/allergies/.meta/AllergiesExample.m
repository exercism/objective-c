#import "AllergiesExample.h"

@interface Allergies ()

@property (nonatomic, assign) int score;

@end

@implementation Allergies

- (instancetype)initWithScore:(int)score {
    self = [super init];
    
    if (self) {
        self.score = score;
    }
    
    return self;
}


- (BOOL)hasAllergy:(Allergen)allergen {
    return (allergen & self.score) == allergen;
}

@end
