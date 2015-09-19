//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FakeModelBuilder.h"

@interface ExampleTests : XCTestCase
@property (nonatomic, strong) NSArray *menu;
@end

@implementation ExampleTests

- (void)setUp {
    [super setUp];
    self.menu = [FakeModelBuilder buildMenu];
}

- (void)tearDown {
    self.menu = nil;
    [super tearDown];
}

- (void)testConformanceOfModel {
    for (id item in self.menu) {
        XCTAssert([item conformsToProtocol:@protocol(RRNCollapsableSectionItemProtocol)], @"Item must conform to protocol.");
    }
}

@end
