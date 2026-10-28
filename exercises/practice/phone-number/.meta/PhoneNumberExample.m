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
    [self throwInvalidPhoneNumberWithReason:@"letters not permitted"];
  }

  if ([self.inputString rangeOfString:@"[@:!]" options:NSRegularExpressionSearch].location != NSNotFound) {
    [self throwInvalidPhoneNumberWithReason:@"punctuations not permitted"];
  }

  NSString *cleanedNumber = [[self.inputString componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
  if (cleanedNumber.length < 10) {
    [self throwInvalidPhoneNumberWithReason:@"incorrect number of digits"];
  }

  if (cleanedNumber.length > 11) {
    [self throwInvalidPhoneNumberWithReason:@"more than 11 digits"];
  }

  if (cleanedNumber.length == 11) {
    if (![cleanedNumber hasPrefix:@"1"]) {
      [self throwInvalidPhoneNumberWithReason:@"11 digits must start with 1"];
    }
    cleanedNumber = [cleanedNumber substringFromIndex:1];
  }

  if ([cleanedNumber characterAtIndex:0] == '0') {
    [self throwInvalidPhoneNumberWithReason:@"area code cannot start with zero"];
  }

  if ([cleanedNumber characterAtIndex:0] == '1') {
    [self throwInvalidPhoneNumberWithReason:@"area code cannot start with one"];
  }

  if ([cleanedNumber characterAtIndex:3] == '0') {
    [self throwInvalidPhoneNumberWithReason:@"exchange code cannot start with zero"];
  }

  if ([cleanedNumber characterAtIndex:3] == '1') {
    [self throwInvalidPhoneNumberWithReason:@"exchange code cannot start with one"];
  }

  return cleanedNumber;
}

- (void)throwInvalidPhoneNumberWithReason:(NSString *)reason {
  @throw [NSException exceptionWithName:@"Invalid phone number" reason:reason userInfo:nil];
}


@end
