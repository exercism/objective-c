#import "NthPrimeExample.h"
@implementation NthPrime : NSObject

+(int)primeNo:(int)primeNo {
	if (primeNo == 0) {
		return 0;
	}
	int currentPrime = 0;
	int i = 0;
	while (currentPrime <= primeNo) {
		i += 1;
		if ([self isPrime:i]){
			currentPrime += 1;
		}
	}
	return i;
}
+(BOOL)isPrime:(int)n {
	if (n == 2 || n == 3) {
		return YES;
	}
	
	if (n % 2 == 0 || n % 3 == 0) {
		return NO;
	}

	int i = 5;
	int w = 2;
	while (i * i <= n) {
		if (n % i == 0) {
			return NO;
		}
		i += w;
		w = 6 - w;
	}
	return YES;
}

@end