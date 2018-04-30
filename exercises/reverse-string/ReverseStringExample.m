#import <Foundation/Foundation.h>
#import "ReverseStringExample.h"

@implementation NSString (ReverseString)

-(NSString*)reverseString {
    
    NSMutableString *mutableString = [NSMutableString string];
    
    for(int i=self.length - 1;i >= 0;i--) {
        
        unichar characterAtIndex = [self characterAtIndex:i];
        
        [mutableString appendFormat:@"%C",characterAtIndex];
        
    }
    
    NSLog(@"Reversed string:%@",[NSString stringWithString:mutableString]);
    return [NSString stringWithString:mutableString];
    
}

@end
