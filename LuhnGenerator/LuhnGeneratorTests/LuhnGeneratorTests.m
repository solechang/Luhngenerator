//
//  LuhnGeneratorTests.m
//  LuhnGeneratorTests
//
//  Created by Jake Choi on 1/27/15.
//  Copyright (c) 2015 Jake Choi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Luhnacy.h"

@interface LuhnGeneratorTests : XCTestCase

@end

@implementation LuhnGeneratorTests {
    Luhnacy *generator;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    generator = [[Luhnacy alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRandomLuhnGenatorTextLength10 {
    
    int stringSize = 10;
    
    // Since there are no prefix validator, it is empty
    // Prefix validators are for creditcards
    NSString *output = [generator generateSize:stringSize :@""];
    
    XCTAssertTrue([generator isValid:output], @"Asserting that the number with 10 digits is Luhn Algorithm valid");
    XCTAssertEqual(stringSize, (int)[output length]);
}

- (void)testRandomLuhnGenatorTextLength15 {
    
    int stringSize = 15;
    
    // Since there are no prefix validator, it is empty
    // Prefix validators are for creditcards
    NSString *output = [generator generateSize:stringSize :@""];
    
    XCTAssertTrue([generator isValid:output], @"Asserting that the number with 15 digits is Luhn Algorithm valid");
    XCTAssertEqual(stringSize, (int)[output length]);
}


@end
