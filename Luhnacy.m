//
//  Luhnacy.m
//  LunhTest
//
//  Created by Jake Choi on 1/27/15.
//  Copyright (c) 2015 Jake Choi. All rights reserved.
//

#import "Luhnacy.h"

@implementation Luhnacy


- (BOOL)valid: (NSString*)number {
    BOOL flag = [self calculateModulus:number] == 0;
    return flag;
}

-(int)doubleAndFix :(int)number {

    int n = 2 * number > 9 ? ( (2 * number) % 10 + 1 ) : 2 * number;
    
    return n;
}

- (int) calculateModulus:( NSString *) number {
    NSString *working = [self reversingName:number];
    BOOL double_up = NO;
    int sum = 0;
    
    for (int i = 0; i < [working length]; i++ ) {
        NSString * newString = [working substringWithRange:NSMakeRange(i, 1)];
        int num = [newString intValue];

        sum += double_up ? [self doubleAndFix:num] :num;

        double_up = !double_up;
        
    }
    
    return sum % 10;
    
}

- (NSString*) reversingName:(NSString *)myNameText
{
    int len = (int)myNameText.length;
    NSMutableString *reverseName = [[NSMutableString alloc] initWithCapacity:len];
    
    for(int i=len-1; i >= 0;i--)
    {
        [reverseName appendString:[NSString stringWithFormat:@"%c",[myNameText characterAtIndex:i]]];
    }
    return reverseName;
}

// Need to include a prefix validator
-(NSMutableString* )generate:(int) stringSize :(NSString*)withPrefix{
    NSMutableString *outputString;
    NSString *newString;
    
    int num = (int)(stringSize - withPrefix.length-1);
    
    outputString = [[NSMutableString alloc] initWithString:withPrefix];
    
    for (int i = 0; i < num ; i++) {
        NSInteger randomNumber = arc4random_uniform(10);
        [outputString appendString:[@(randomNumber) stringValue]];
        
    }
    
    if( stringSize - 1 == outputString.length) {
        [outputString appendString:[@(0) stringValue]];
    }
    

    if ( withPrefix.length != 0) {
        int calcModNumber = [self calculateModulus:outputString];

        if (calcModNumber == 0) {

            newString = [outputString substringToIndex:[outputString length] - 1 ];

            NSInteger randomNumber = (arc4random_uniform(8)) + 1;
            outputString = [[NSMutableString alloc] initWithString:newString];
            [outputString appendString:[@(randomNumber) stringValue]];

        } else if ( calcModNumber > 0 && calcModNumber < 9) {
            newString =[outputString substringToIndex:[outputString length] - 1 ];

            NSInteger randomNumber = ((10 - [self calculateModulus:outputString])/2);
            outputString = [[NSMutableString alloc] initWithString:newString];
            [outputString appendString:[@(randomNumber) stringValue]];

        } else if ( calcModNumber == 9 ) {
            newString = [outputString substringToIndex:[outputString length] - 1];

            NSInteger randomNumber = (arc4random_uniform(7) + 2);
            outputString = [[NSMutableString alloc] initWithString:newString];
            [outputString appendString:[@(randomNumber) stringValue]];


        }
    } else if( !([self calculateModulus:outputString] == 0)) {

        newString = [outputString substringToIndex:[outputString length] - 1];
        NSInteger randomNumber = (10 - [self calculateModulus:outputString]);
        outputString = [[NSMutableString alloc] initWithString:newString];
        [outputString appendString:[@(randomNumber) stringValue]];
    }
    
    return outputString;
}


@end
