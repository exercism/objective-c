#import "GrainsExample.h"
@implementation Grains : NSObject

-(long long)grainsAtSquareNumber:(int)squareNo {
	if (squareNo <= 64 && squareNo > 0) {
		return pow(2, squareNo - 1);
	}
	return -1;
}

-(long long)grainsAtBoard {
	long long total = 0;
	for (int i = 1; i <= 64; i++) {
		total += [self grainsAtSquareNumber:i];
	}
	return total;
}

@end