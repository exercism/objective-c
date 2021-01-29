#import "BeerSongExample.h"

@interface BeerSongExample ()

@property(nonatomic,assign) int numberOfBeerBottles;

@end

@implementation BeerSongExample

-(instancetype)initWithNumberOfBeerBottles:(int)numberOfBottles{
    self = [super init];
    
    if(self){
        
        self.numberOfBeerBottles = numberOfBottles;
    }
    
    return self;
}

-(NSString*)singBeerSong{
    
    int numberOfBottles = self.numberOfBeerBottles;
    NSMutableString *verses = [NSMutableString string];
    while (numberOfBottles > 2) {
        
        [verses appendFormat:@"%d bottles of beer on the wall, %d bottles of beer.\n",numberOfBottles,numberOfBottles];
        numberOfBottles--;
        [verses appendFormat:@"Take one down and pass it around, %d bottles of beer on the wall.\n\n",numberOfBottles];
    }
    
    while(numberOfBottles <= 2){
        
        switch (numberOfBottles) { //!OCLint
                
            case 2: [verses appendFormat:@"%d bottles of beer on the wall, %d bottles of beer.\n",numberOfBottles,numberOfBottles];
                numberOfBottles--;
                [verses appendFormat:@"Take one down and pass it around, %d bottle of beer on the wall.\n\n",numberOfBottles];
                break;
                
            case 1:[verses appendFormat:@"%d bottle of beer on the wall, %d bottle of beer.\n",numberOfBottles,numberOfBottles];
                numberOfBottles--;
                [verses appendString:@"Take one down and pass it around, no more bottles of beer on the wall.\n\n"];
                break;
                
            case 0: [verses appendString:@"No more bottles of beer on the wall, no more bottles of beer.\n"];
                numberOfBottles+=99;
                [verses appendFormat:@"Go to the store and buy some more, %d bottles of beer on the wall.",numberOfBottles];
                break;
        }
    }
    
    return verses;
}
@end
