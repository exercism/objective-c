#import "BracketPushExample.h"

static NSMutableDictionary *parentheses;
static NSMutableDictionary *curlyBraces;
static NSMutableDictionary *squareBrackets;
static NSMutableArray *bracketType;
static NSString *inputString = @"";
static bool parenthesesPaired = false;
static bool curlyBracesPaired = false;
static bool squareBracesPaired = false;
static bool roundAndCurlyPaired = false;
static bool curlyAndSquarePaired =false;
static bool roundAndSquarePaired = false;

@implementation BracketPushExample

+ (BOOL)validateBracketPairingAndNestingInString:(NSString *)string{
    
    if([string isEqualToString:@""]){
        
        return true;
    }
    
    inputString = string;
    parentheses = [NSMutableDictionary dictionary];
    curlyBraces = [NSMutableDictionary dictionary];
    squareBrackets = [NSMutableDictionary dictionary];
    bracketType = [NSMutableArray array];
    
        [BracketPushExample checkBracketType:@"(" inString:string];
        [BracketPushExample checkBracketType:@")" inString:string];
        [BracketPushExample checkBracketType:@"{" inString:string];
        [BracketPushExample checkBracketType:@"}" inString:string];
        [BracketPushExample checkBracketType:@"[" inString:string];
        [BracketPushExample checkBracketType:@"]" inString:string];
        if(parentheses.count <= 2 && parentheses.count != 0){
        
            [bracketType addObject:parentheses];
        }
        
        if(curlyBraces.count <= 2 && curlyBraces.count != 0){
            
            [bracketType addObject:curlyBraces];
        }
        
        if(squareBrackets.count <= 2 && squareBrackets.count != 0){
            
            [bracketType addObject:squareBrackets];
        }
        
        
        if([BracketPushExample checkPairingOfAllBrackets]){
            
            return [BracketPushExample checkBracketNestingForAllBrackets];
        }
        
        
    
    return false;
}




+ (BOOL)checkPairingOfAllBrackets{
    
    
    bool result = false;
    parenthesesPaired = [bracketType containsObject:parentheses]?[[parentheses objectForKey:@"("] intValue] == [[parentheses objectForKey:@")"] intValue]:false;
    curlyBracesPaired = [bracketType containsObject:curlyBraces]?[[curlyBraces objectForKey:@"{"] intValue] == [[curlyBraces objectForKey:@"}"] intValue]:false;
    squareBracesPaired = [bracketType containsObject:squareBrackets]?[[squareBrackets objectForKey:@"["] intValue] == [[squareBrackets objectForKey:@"]"] intValue]:false;
    switch((int)bracketType.count){
            
        case 1: result = [BracketPushExample checkBracketPairingOneAtATime];
            break;
            
        case 2: result = [BracketPushExample checkBracketPairingTwoAtATime];
            break;
            
        case 3: result = parenthesesPaired && curlyBracesPaired && squareBracesPaired;
            break;
            
        default:break;
            
    }
    
    return result;
}




+ (NSString*)getClosingBracketForOpeningBracket:(NSString*)opener{
    
    if([opener isEqualToString:@"("]){
        
        return @")";
    }else if([opener isEqualToString:@"{"]){
        
        return @"}";
    }else if([opener isEqualToString:@"["]){
        
        return @"]";
    }
    
    return @"";
}



+ (BOOL)checkBracketPairingTwoAtATime{
    
    if(parenthesesPaired && curlyBracesPaired){
        
        roundAndCurlyPaired=true;
    
    }else if(curlyBracesPaired && squareBracesPaired){
        
        curlyAndSquarePaired=true;
    }else if(squareBracesPaired && parenthesesPaired){
        
        roundAndSquarePaired=true;
    }
    return (roundAndCurlyPaired) || (curlyAndSquarePaired) || (roundAndSquarePaired);
}




+ (BOOL)checkBracketPairingOneAtATime{
    
    return  (parenthesesPaired || curlyBracesPaired || squareBracesPaired);
}



+ (void)checkBracketType:(NSString*)bracket inString:(NSString*)string{
    
    if([string rangeOfString:bracket].location != NSNotFound){
        
        if([bracket isEqualToString:@"("] || [bracket isEqualToString:@")"]){
            
            parentheses[bracket] = [NSNumber numberWithInteger:[string componentsSeparatedByString:bracket].count - 1];
            
            
        }else if([bracket isEqualToString:@"{"] || [bracket isEqualToString:@"}"]){
            
            curlyBraces[bracket] = [NSNumber numberWithInteger:[string componentsSeparatedByString:bracket].count - 1];
            
        }else if([bracket isEqualToString:@"["] || [bracket isEqualToString:@"]"]){
            
            squareBrackets[bracket] = [NSNumber numberWithInteger:[string componentsSeparatedByString:bracket].count - 1];
            
        }
    }
    
}




+ (BOOL)checkBracketNestingForAllBrackets{
    
    bool result = false;
    switch (bracketType.count) {
        
        case 1: if([bracketType containsObject:parentheses]){
            
            result = [BracketPushExample checkNestingOfBracketsOneAtATimeWithOpener:@"(" andCloser:@")"];
            
        }else if([bracketType containsObject:curlyBraces]){
            
            result = [BracketPushExample checkNestingOfBracketsOneAtATimeWithOpener:@"{" andCloser:@"}"];
            
        }else if([bracketType containsObject:squareBrackets]){
            
            result = [BracketPushExample checkNestingOfBracketsOneAtATimeWithOpener:@"[" andCloser:@"]"];
        }
            break;
            
            
        case 2: if(roundAndCurlyPaired){
                
                result = [BracketPushExample checkNestingOfBracketsTwoAtATime:@"({"];

            
            }else if(curlyAndSquarePaired){
                
                result = [BracketPushExample checkNestingOfBracketsTwoAtATime:@"{["];
                
            }else if(roundAndSquarePaired){
                
                result = [BracketPushExample checkNestingOfBracketsTwoAtATime:@"[("];

            }
            
            break;
        
        
        case 3: result = [BracketPushExample checkNestingOfBracketsThreeAtATime];
            break;
        
        
        default:break;
    }
    return result;
}




+ (BOOL)checkNestingOfBracketsOneAtATimeWithOpener:(NSString*)opener andCloser:(NSString*)closer{
    
    
    
    NSScanner *openScanner = [NSScanner scannerWithString:inputString];
    NSScanner *closeScanner = [NSScanner scannerWithString:inputString];
    [openScanner scanUpToString:opener intoString:nil];
    [closeScanner scanUpToString:closer intoString:nil];
    while(!openScanner.isAtEnd && !closeScanner.isAtEnd){
                
        if(openScanner.scanLocation > closeScanner.scanLocation){
                
                return false;
            }
        [openScanner setScanLocation:openScanner.scanLocation+1];
        [closeScanner setScanLocation:closeScanner.scanLocation+1];
        [openScanner scanUpToString:opener intoString:nil];
        [closeScanner scanUpToString:closer intoString:nil];
        }
    

        return true;
}




+ (BOOL)checkNestingOfBracketsTwoAtATime:(NSString*)bracketTypeString{
    
    int opener1Occurence = 0;
    int closer1Occurence = 0;
    int opener2Occurence = 0;
    int closer2Occurence = 0;
    NSScanner *opener1 = [NSScanner scannerWithString:inputString];
    NSScanner *closer1= [NSScanner scannerWithString:inputString];
    NSScanner *opener2= [NSScanner scannerWithString:inputString];
    NSScanner *closer2= [NSScanner scannerWithString:inputString];
   
    NSString *openingBracket1 = [NSString stringWithFormat:@"%c",[bracketTypeString characterAtIndex:0]];
    NSString *openingBracket2 = [NSString stringWithFormat:@"%c",[bracketTypeString characterAtIndex:1]];
    NSString *closingBracket1 = [BracketPushExample getClosingBracketForOpeningBracket:openingBracket1];
    NSString *closingBracket2 = [BracketPushExample getClosingBracketForOpeningBracket:openingBracket2];
        
    [opener1 scanUpToString:openingBracket1 intoString:nil];
    [opener2 scanUpToString:openingBracket2 intoString:nil];
    [closer1 scanUpToString:closingBracket1 intoString:nil];
    [closer2 scanUpToString:closingBracket2 intoString:nil];
    
          while(!opener1.isAtEnd && !opener2.isAtEnd && !closer1.isAtEnd && !closer2.isAtEnd){
              
              opener1Occurence++;
              opener2Occurence++;
              closer1Occurence++;
              closer2Occurence++;
              
                if(opener1.scanLocation < opener2.scanLocation){
                    
                    if(closer2.scanLocation != opener2.scanLocation + 1 && closer2.scanLocation > closer1.scanLocation && opener2Occurence == 1){
                                                                                                                                                              
                                                                                                                                                              
                     return false;
                                                                                                                                                              
                        
                    }
               
                }else{
                    
                    if(closer1.scanLocation > closer2.scanLocation && closer1.scanLocation != opener1.scanLocation + 1 && opener1Occurence == 1){
                        
                        return false;
                        
                    }
                }
                [opener1 setScanLocation:opener1.scanLocation+1];
                [opener2 setScanLocation:opener2.scanLocation+1];
                [closer1 setScanLocation:closer1.scanLocation+1];
                [closer2 setScanLocation:closer2.scanLocation+1];
                [opener1 scanUpToString:openingBracket1 intoString:nil];
                [opener2 scanUpToString:openingBracket2 intoString:nil];
                [closer1 scanUpToString:closingBracket1 intoString:nil];
                [closer2 scanUpToString:closingBracket2 intoString:nil];
    
}
      return true;
}





+ (BOOL)checkNestingOfBracketsThreeAtATime{

    NSString *orderOfoccurence = [BracketPushExample checkOrderOfOccurenceOfThreeBracketTypes];
    NSString *opener1 = [NSString stringWithFormat:@"%c",[orderOfoccurence characterAtIndex:0]];
    NSString *opener2 = [NSString stringWithFormat:@"%c",[orderOfoccurence characterAtIndex:1]];
    NSString *opener3 = [NSString stringWithFormat:@"%c",[orderOfoccurence characterAtIndex:2]];
    NSString *closer1 = [BracketPushExample getClosingBracketForOpeningBracket:opener1];
    NSString *closer2 = [BracketPushExample getClosingBracketForOpeningBracket:opener2];
    NSString *closer3 = [BracketPushExample getClosingBracketForOpeningBracket:opener3];
    
    NSScanner *scanner = [NSScanner scannerWithString:inputString];
    NSScanner *scanner1 = [NSScanner scannerWithString:inputString];
    NSScanner *scanner2 = [NSScanner scannerWithString:inputString];
    NSScanner *scanner3 = [NSScanner scannerWithString:inputString];
    
    [scanner  scanUpToString:opener1 intoString:nil];
    [scanner1 scanUpToString:closer1 intoString:nil];
    [scanner2 scanUpToString:closer2 intoString:nil];
    [scanner3 scanUpToString:closer3 intoString:nil];
    
    while(!scanner.isAtEnd && !scanner1.isAtEnd && !scanner2.isAtEnd && !scanner3.isAtEnd){
        
        if(scanner1.scanLocation != (scanner.scanLocation + 1) && scanner1.scanLocation < scanner2.scanLocation && scanner1.scanLocation < scanner3.scanLocation){
            
            return false;
        }
        scanner.scanLocation = scanner.scanLocation+1;
        scanner1.scanLocation = scanner1.scanLocation+1;
        scanner2.scanLocation = scanner2.scanLocation+1;
        scanner3.scanLocation = scanner3.scanLocation+1;
        [scanner  scanUpToString:opener1 intoString:nil];
        [scanner1 scanUpToString:closer1 intoString:nil];
        [scanner2 scanUpToString:closer2 intoString:nil];
        [scanner3 scanUpToString:closer3 intoString:nil];
    }
    
    return [BracketPushExample checkNestingOfBracketsTwoAtATime:[NSString stringWithFormat:@"%@%@",opener2,opener3]];
    
}




+ (NSString*)checkOrderOfOccurenceOfThreeBracketTypes{
    
    NSScanner *scanner1 = [NSScanner scannerWithString:inputString];
    NSScanner *scanner2 = [NSScanner scannerWithString:inputString];
    NSScanner *scanner3 = [NSScanner scannerWithString:inputString];
    
    
        
        [scanner1 scanUpToString:@"(" intoString:nil];
        [scanner2 scanUpToString:@"{" intoString:nil];
        [scanner3 scanUpToString:@"[" intoString:nil];
        
    
    
    if(scanner1.scanLocation < scanner2.scanLocation && scanner1.scanLocation < scanner3.scanLocation){
        
        if(scanner2.scanLocation < scanner3.scanLocation){
            
            return @"({[";
        }
        return @"([{";
    }else if(scanner2.scanLocation < scanner1.scanLocation && scanner2.scanLocation < scanner3.scanLocation){
        
        if(scanner1.scanLocation < scanner3.scanLocation){
            
            return @"{([";
        }
        return @"{[(";
        
    }
        
    if(scanner1.scanLocation < scanner2.scanLocation){
            
            return @"[({";
        }
        return @"[{(";
    
    

}

@end
