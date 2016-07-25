#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, Allergen) {
    AllergenNone            = 0,
    AllergenEggs            = 1 << 0,
    AllergenPeanuts         = 1 << 1,
    AllergenShellfish       = 1 << 2,
    AllergenStrawberries    = 1 << 3,
    AllergenTomatoes        = 1 << 4,
    AllergenChocolate       = 1 << 5,
    AllergenPollen          = 1 << 6,
    AllergenCats            = 1 << 7
};

@interface Allergies : NSObject

- (instancetype)initWithScore:(int)score;
- (BOOL)hasAllergy:(Allergen)allergen;

@end
