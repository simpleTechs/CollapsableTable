/**
 *  CollapsableTableKit - Collapsable table view sections with custom section header views.
 *
 *  RRNCollapsableTableViewController.m
 *
 *  For usage, see documentation of the classes/symbols listed in this file.
 *
 *  Copyright (c) 2016 Rob Nash. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

#import "RRNCollapsableTableViewController.h"
#import "RRNConstants.h"

@implementation RRNCollapsableTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userTappedHeaderView:) name:RRN_CONSTANT_NOTIFICATION_USER_TAPPED_TABLE_VIEW_HEADER_VIEW object:nil];
    
    UINib *nib = [UINib nibWithNibName:[self sectionHeaderNibName] bundle:[self sectionHeaderNibBundle]];
    [[self collapsableTableView] registerNib:nib forHeaderFooterViewReuseIdentifier:[self sectionHeaderReuseIdentifier]];
}

-(UITableView *)collapsableTableView {
    return nil;
}

-(NSArray <RRNCollapsableTableViewSectionModelProtocol> *)model {
    return nil;
}

-(BOOL)singleOpenSelectionOnly {
    return NO;
}

-(NSString *)sectionHeaderNibName {
    return nil;
}

-(NSBundle *)sectionHeaderNibBundle {
    return  nil;
}

-(NSString *)sectionHeaderReuseIdentifier {
    return [[self sectionHeaderNibName] stringByAppendingString:@"ID"];
}

#pragma mark - UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self model].count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id menuSection = [[self model] objectAtIndex:section];
    BOOL itemConforms = [menuSection conformsToProtocol:@protocol(RRNCollapsableTableViewSectionModelProtocol)];
    return (itemConforms && ((id <RRNCollapsableTableViewSectionModelProtocol>)menuSection).isVisible.boolValue) ? ((id <RRNCollapsableTableViewSectionModelProtocol>)menuSection).items.count : 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    id menuSection = [[self model] objectAtIndex:section];
    RRNTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[self sectionHeaderReuseIdentifier]];
    [view updateTitle:((id <RRNCollapsableTableViewSectionModelProtocol>)menuSection).title];
    return view;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    id menuSection = [[self model] objectAtIndex:section];
    if (((id <RRNCollapsableTableViewSectionModelProtocol>)menuSection).isVisible.boolValue) {
        [((RRNTableViewHeaderFooterView*)view) openAnimated:NO];
    } else {
        [((RRNTableViewHeaderFooterView*)view) closeAnimated:NO];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - User Interaction

-(void)userTappedHeaderView:(NSNotification *)notification {
    RRNTableViewHeaderFooterView *view = (RRNTableViewHeaderFooterView *)notification.object;
    NSValue *value = notification.userInfo[RRN_CONSTANT_USER_TAPPED_TABLE_VIEW_HEADER_VIEW_AT_POINT_KEY];
    CGPoint point = value.CGPointValue;
    [self userTappedView:view atPoint:point];
}

-(void)userTappedView:(RRNTableViewHeaderFooterView *)view atPoint:(CGPoint)point {
    
    UITableView *tableView = [self collapsableTableView];
    
    NSNumber *value = [self sectionForUserSelectionInTableView:tableView
                                               atTouchLocation:point
                                            inHeaderFooterView:view];
    
    if (!value) {
        return;
    }
    
    NSUInteger tappedSection = value.integerValue;
    
    [tableView beginUpdates];
    
    BOOL foundOpenUnchosenMenuSection = NO;
    
    NSArray *menu = [self model];
    
    for (id <RRNCollapsableTableViewSectionModelProtocol> menuSection in menu) {
        
        if (![menuSection conformsToProtocol:@protocol(RRNCollapsableTableViewSectionModelProtocol)]) {
            continue;
        }
        
        BOOL isTappedSection = ([menuSection isEqual:[menu objectAtIndex:tappedSection]]);
        
        if (isTappedSection) {
            
            menuSection.isVisible = @(!menuSection.isVisible.boolValue);
            
            [self toggleCollapseTableViewSectionAtSection:tappedSection
                                                withModel:menuSection
                                              inTableView:tableView
                                        usingRowAnimation:(foundOpenUnchosenMenuSection) ? UITableViewRowAnimationBottom : UITableViewRowAnimationTop
                           forSectionWithHeaderFooterView:view];
            
        } else if (menuSection.isVisible.boolValue && [self singleOpenSelectionOnly]) {
            
            foundOpenUnchosenMenuSection = YES;
            
            menuSection.isVisible = @(!menuSection.isVisible.boolValue);
            
            NSInteger untappedSection = [menu indexOfObject:menuSection];
            
            RRNTableViewHeaderFooterView *untappedHeaderFooterView = (RRNTableViewHeaderFooterView *)[tableView headerViewForSection:untappedSection];
            
            [self toggleCollapseTableViewSectionAtSection:untappedSection
                                                withModel:menuSection
                                              inTableView:tableView
                                        usingRowAnimation:(tappedSection > untappedSection) ? UITableViewRowAnimationTop : UITableViewRowAnimationBottom
                           forSectionWithHeaderFooterView:untappedHeaderFooterView];
        }
        
    }
    
    [tableView endUpdates];
    
}

-(NSNumber *)sectionForUserSelectionInTableView:(UITableView *)tableView atTouchLocation:(CGPoint)location inHeaderFooterView:(UITableViewHeaderFooterView *)view {
    
    CGPoint point = [tableView convertPoint:location
                                   fromView:view];
    
    for (NSInteger i = 0; i < [tableView numberOfSections]; i++) {
        CGRect rect = [tableView rectForHeaderInSection:i];
        if (CGRectContainsPoint(rect, point)) {
            return @(i);
        }
    }
    
    return nil;
}

-(void)toggleCollapseTableViewSectionAtSection:(NSUInteger)section
                                     withModel:(id <RRNCollapsableTableViewSectionModelProtocol>)model
                                   inTableView:(UITableView *)tableView
                             usingRowAnimation:(UITableViewRowAnimation)animation
                forSectionWithHeaderFooterView:(RRNTableViewHeaderFooterView *)headerFooterView {
    
    NSArray *indexPaths = [self indexPathsForSection:section
                                      forMenuSection:model];
    
    if (model.isVisible.boolValue) {
        [headerFooterView openAnimated:YES];
        [tableView insertRowsAtIndexPaths:indexPaths
                         withRowAnimation:animation];
    } else {
        [headerFooterView closeAnimated:YES];
        [tableView deleteRowsAtIndexPaths:indexPaths
                         withRowAnimation:animation];
    }
    
}

-(NSArray *)indexPathsForSection:(NSInteger)section forMenuSection:(id <RRNCollapsableTableViewSectionModelProtocol>)menuSection {
    
    NSMutableArray *collector = [NSMutableArray new];
    NSInteger count = menuSection.items.count;
    NSIndexPath *indexPath;
    for (NSInteger i = 0; i < count; i++) {
        indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [collector addObject:indexPath];
    }
    return [collector copy];
}

@end
