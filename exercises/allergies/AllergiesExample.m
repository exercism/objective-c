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
    if ((allergen & self.score) == allergen) {
        return true;
    } else {
        return false;
    }
}

@end
