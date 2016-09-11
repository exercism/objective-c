#import "BobExample.h"
#import <Foundation/Foundation.h>


@interface NSString (BobTalk)
-(BOOL) isEmpty;
-(BOOL) isQuestion;
-(BOOL) isShouting;
@end


@implementation Bob : NSObject

-(NSString *) hey: (NSString *) input {
    if ([input isEmpty]) {
        return @"Fine. Be that way!";
    }
    else if ([input isShouting]) {
        return @"Whoa, chill out!";
    }
    else if ([input isQuestion]) {
        return  @"Sure.";
    }
    return @"Whatever.";
    
}

@end

@implementation NSString (BobTalk)
-(BOOL) isEmpty {
    return  [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] < 1;
}
-(BOOL) isQuestion {
    return [self hasSuffix:@"?"];
}
-(BOOL) isShouting {
    return
    [self isEqualToString: [self uppercaseString]] &&
    ([self rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet] options:0].location != NSNotFound);
}

@end

