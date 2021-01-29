#import <Foundation/Foundation.h>
#import "NucleotideCountExample.h"

@interface NucleotideCount ()

@property (nonatomic,strong,readwrite) NSString *strand;

@end

@implementation NucleotideCount

- (instancetype)initWithStrand:(NSString *)strand {

  self = [super init];
  if (self) {

    [self validateStrand:strand];
    self.strand = strand;
  }
  return self;

}

- (NSUInteger)count:(NSString *)nucleotide {
  [self validateNucleotide:nucleotide];
  return [self.nucleotideCounts[nucleotide] unsignedIntegerValue];
}

- (void)validateStrand:(NSString *)strand {
  NSRange range = [strand rangeOfCharacterFromSet:[self invalidDNANucleotides]];

  if (range.location != NSNotFound) {
    @throw [NSException exceptionWithName:@"Invalid DNA Strand" reason:@"Invalid" userInfo:@{}];
  }
}

- (NSCharacterSet *)invalidDNANucleotides {
  return [[self validDNANucleotides] invertedSet];
}

- (void)validateNucleotide:(NSString *)nucleotide {
  NSRange range = [nucleotide rangeOfCharacterFromSet:[self validDNANucleotides]];

  if (range.location == NSNotFound) {
      @throw [NSException exceptionWithName:@"Invalid Nucleotide" reason:@"Invalid" userInfo:@{}];
  }
}

- (NSCharacterSet *)validDNANucleotides {
  return [NSCharacterSet characterSetWithCharactersInString:@"ATCG"];
}

- (NSDictionary *)nucleotideCounts {

  NSArray *nucleotides = [self nucleotides];

  NSMutableDictionary *nucleotideCounts = [self baselineNucleotideCounts];

  [nucleotides enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {

    if ( ! [nucleotideCounts objectForKey:obj]) {
      nucleotideCounts[obj] = @0;
    }

    NSNumber *currentCount = [nucleotideCounts objectForKey:obj];
    NSNumber *updatedCount = [NSNumber numberWithInt:currentCount.intValue + 1];
    nucleotideCounts[obj] = updatedCount;

  }];

  return nucleotideCounts;
}

- (NSArray *)nucleotides {
  return [self letterArrayFor:self.strand];
}

- (NSMutableDictionary *)baselineNucleotideCounts {
  NSMutableDictionary *nucleotideCounts = [NSMutableDictionary dictionary];

  nucleotideCounts[@"A"] = @0;
  nucleotideCounts[@"T"] = @0;
  nucleotideCounts[@"C"] = @0;
  nucleotideCounts[@"G"] = @0;

  return nucleotideCounts;
}


- (NSArray *)letterArrayFor:(NSString *)word {
  NSMutableArray *letters = [NSMutableArray array];

  for (int i = 0; i < word.length; i++) {
    unichar aCharacter = [word characterAtIndex:i];
    [letters addObject:[NSString stringWithFormat:@"%c",aCharacter]];
  }

  return letters;
}

@end