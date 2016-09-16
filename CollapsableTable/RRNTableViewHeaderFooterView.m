//
//  RRNTableViewHeaderFooterView.m
//  CollapsableTableKit
//
//  Created by Robert Nash on 02/09/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import "RRNTableViewHeaderFooterView.h"
#import "RRNConstants.h"

#define USER_TAPPED @"TAP"

@implementation RRNTableViewHeaderFooterView

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:self];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RRN_CONSTANT_NOTIFICATION_USER_TAPPED_TABLE_VIEW_HEADER_VIEW object:self userInfo:@{RRN_CONSTANT_USER_TAPPED_TABLE_VIEW_HEADER_VIEW_AT_POINT_KEY: [NSValue valueWithCGPoint:point]}];
}

-(void)updateTitle:(NSString *)title {
    
}

-(void)openAnimated:(BOOL)animated {
    
}

-(void)closeAnimated:(BOOL)animated {
    
}

@end
