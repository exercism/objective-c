@interface Hamming : NSObject

+ (NSUInteger)compute:(NSString *)firstStrand against:(NSString *)secondStrand;

@end

@interface Hamming ()

@property (nonatomic,strong,readwrite) NSString *firstStrand;
@property (nonatomic,strong,readwrite) NSString *secondStrand;

@end

@implementation Hamming

+ (NSUInteger)compute:(NSString *)firstStrand against:(NSString *)secondStrand {

  Hamming *hamming = [[self alloc] initWithFirstStrand:firstStrand andSecondStrand:secondStrand];
  return [hamming distance];

}

- (instancetype)initWithFirstStrand:(NSString *)firstStrand andSecondStrand:(NSString *)secondStrand {

  self = [super init];

  if (self) {
    self.firstStrand = firstStrand;
    self.secondStrand = secondStrand;
  }

  return self;
}

- (NSUInteger)distance {
  NSUInteger calculatedDistance = 0;

  for (NSUInteger i = 0; i < self.firstStrand.length; i++) {

    unichar firstGene = [self.firstStrand characterAtIndex:i];
    unichar secondGene = [self.secondStrand characterAtIndex:i];

    if ([self mutationBetween:firstGene and:secondGene]) {
        calculatedDistance ++;
    }
  }

  return calculatedDistance;
}

- (BOOL)mutationBetween:(unichar)firstGene and:(unichar)secondGene {
    return (firstGene != secondGene);
}

@end