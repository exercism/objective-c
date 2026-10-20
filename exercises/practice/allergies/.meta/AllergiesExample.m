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

- (NSArray<NSString *> *)list {
    NSArray<NSString *> *allergens = @[@"eggs", @"peanuts", @"shellfish", @"strawberries", @"tomatoes", @"chocolate", @"pollen", @"cats"];
    NSMutableArray<NSString *> *result = [NSMutableArray array];
    for (NSUInteger index = 0; index < allergens.count; index++) {
        if ([self hasAllergy:(Allergen)(1UL << index)]) {
            [result addObject:allergens[index]];
        }
    }
    return [result copy];
}

@end
