#import <Foundation/Foundation.h>
#import "PhoneNumberExample.h"

@interface PhoneNumber ()

@property (nonatomic,strong,readwrite) NSString *inputString;

@end

@implementation PhoneNumber

- (instancetype)initWithString:(NSString *)inputString {
  self = [super init];
  if (self) {
    self.inputString = inputString;
  }

  return self;
}

- (NSString *)number {
  if ([self.inputString rangeOfString:@"[a-z]" options:NSRegularExpressionSearch | NSCaseInsensitiveSearch].location != NSNotFound) {
    return [self defaultInvalidPhoneNumber];
  }

  if ([self.inputString rangeOfString:@"[@:!]" options:NSRegularExpressionSearch].location != NSNotFound) {
    return [self defaultInvalidPhoneNumber];
  }

  NSString *cleanedNumber = [[self.inputString componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
  if (cleanedNumber.length < 10 || cleanedNumber.length > 11) {
    return [self defaultInvalidPhoneNumber];
  }

  if (cleanedNumber.length == 11) {
    if (![cleanedNumber hasPrefix:@"1"]) {
      return [self defaultInvalidPhoneNumber];
    }
    cleanedNumber = [cleanedNumber substringFromIndex:1];
  }

  if ([cleanedNumber characterAtIndex:0] < '2' || [cleanedNumber characterAtIndex:3] < '2') {
    return [self defaultInvalidPhoneNumber];
  }

  return cleanedNumber;
}

- (NSString *)defaultInvalidPhoneNumber {
  return @"0000000000";
}


@end
