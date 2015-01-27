//
//  Luhnacy.h
//  LunhTest
//
//  Created by Jake Choi on 1/27/15.
//  Copyright (c) 2015 Jake Choi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Luhnacy : NSObject


- (BOOL)valid: (NSString*)number;

// Generates a valid luhn  number
// Need to include a prefix validator
-(NSMutableString* )generate:(int) stringSize :(NSString*)withPrefix;

@end
