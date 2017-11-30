//
//  TwoFerExample.m
//  xobjectivecTest
//
//  Created by Rob Hudson on 11/30/17.
//  Copyright © 2017 exercism. All rights reserved.
//

#import "TwoFerExample.h"

@implementation TwoFer

+ (NSString *)twoFerWithName:(NSString *)name {
    if (!name) {
        name = @"you";
    }
    
    return [NSString stringWithFormat:@"One for %@, one for me.", name];
}

@end
