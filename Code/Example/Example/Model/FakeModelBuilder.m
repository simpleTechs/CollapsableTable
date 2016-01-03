//
//  FakeModelBuilder.m
//  Example
//
//  Created by Robert Nash on 19/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "FakeModelBuilder.h"

@implementation FakeModelBuilder

+(NSArray *)buildMenu {
    
    NSMutableArray *collector = [NSMutableArray new];
    
    for (NSInteger i = 0; i < 5; i++) {
        
        MenuSection *section = [MenuSection new];
        
        switch (i) {
            case 0:
                section.title = @"Option 1";
                section.isVisible = @YES;
                section.items = @[[NSNull null], [NSNull null], [NSNull null]];
                break;
                
            case 1:
                section.title = @"Option 2";
                section.items = @[[NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null]];
                break;
                
            case 2:
                section.title = @"Option 3";
                section.items = @[[NSNull null], [NSNull null], [NSNull null]];
                break;
                
            case 3:
                section.title = @"Option 4";
                section.items = @[[NSNull null], [NSNull null]];
                break;
                
            case 4:
                section.title = @"Option 5";
                section.items = @[[NSNull null], [NSNull null], [NSNull null], [NSNull null]];
                break;
                
            default:
                break;
        }
        
        [collector addObject:section];
    }
    
    return [collector copy];
}

@end
