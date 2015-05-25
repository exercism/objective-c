// place in HelloWorld.h
@interface HelloWorld : NSObject

- (NSString *)hello:(NSString *)name;

@end

// place in HelloWorld.m
#import "HelloWorld.h"
@implementation HelloWorld
- (NSString *)hello:(NSString *)name {
  if(!name) {
    name = @"World";
  }
  return [NSString stringWithFormat:@"Hello, %@!", name];
}
@end
