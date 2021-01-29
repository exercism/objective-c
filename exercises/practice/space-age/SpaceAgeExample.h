#import <Foundation/Foundation.h>

@interface SpaceAge : NSObject

- (instancetype)initWithSeconds:(long)seconds;
- (long)seconds;
- (double)onEarth;
- (double)onMercury;
- (double)onVenus;
- (double)onMars;
- (double)onJupiter;
- (double)onSaturn;
- (double)onUranus;
- (double)onNeptune;

@end