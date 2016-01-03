//
//  RRNCollapsableTableViewController.m
//  CollapsableTable
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "RRNCollapsableTableViewController.h"
#import "RRNCollapsableTableViewSectionModelProtocol.h"

@interface RRNCollapsableTableViewController ()
@end

@implementation RRNCollapsableTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:[self sectionHeaderNibName] bundle:nil];
    [[self collapsableTableView] registerNib:nib forHeaderFooterViewReuseIdentifier:[self sectionHeaderReuseIdentifier]];
}

-(UITableView *)collapsableTableView {
    return nil;
}

-(NSArray *)model {
    return nil;
}

-(BOOL)singleOpenSelectionOnly {
    return NO;
}

-(NSString *)sectionHeaderNibName {
    return nil;
}

-(NSString *)sectionHeaderReuseIdentifier {
    return [[self sectionHeaderNibName] stringByAppendingString:@"ID"];
}

-(BOOL)shouldCollapse:(NSInteger)tableSection {
    return YES;
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
    
    UIView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[self sectionHeaderReuseIdentifier]];
    view.tag = section;
    
    BOOL headerConforms = [view conformsToProtocol:@protocol(RRNCollapsableTableViewSectionHeaderProtocol)];
    
    if (headerConforms) {
        ((id <RRNCollapsableTableViewSectionHeaderProtocol>)view).interactionDelegate = self;
    }
    
    BOOL itemConforms = [menuSection conformsToProtocol:@protocol(RRNCollapsableTableViewSectionModelProtocol)];
    
    if (headerConforms && itemConforms) {
        ((id <RRNCollapsableTableViewSectionHeaderProtocol>)view).titleLabel.text = ((id <RRNCollapsableTableViewSectionModelProtocol>)menuSection).title;
    }
    
    return view;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    id menuSection = [[self model] objectAtIndex:section];
    
    BOOL headerConforms = [view conformsToProtocol:@protocol(RRNCollapsableTableViewSectionHeaderProtocol)];
    BOOL itemConforms = [menuSection conformsToProtocol:@protocol(RRNCollapsableTableViewSectionModelProtocol)];
    
    if (headerConforms && itemConforms && ((id <RRNCollapsableTableViewSectionModelProtocol>)menuSection).isVisible.boolValue) {
        [((id <RRNCollapsableTableViewSectionHeaderProtocol>)view) openAnimated:NO];
    } else if (headerConforms) {
        [((id <RRNCollapsableTableViewSectionHeaderProtocol>)view) closeAnimated:NO];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - ReactiveSectionHeaderProtocol

-(void)userTapped:(UIView *)view {
    
    UITableView *tableView = [self collapsableTableView];
    
    [tableView beginUpdates];
    
    BOOL foundOpenUnchosenMenuSection = NO;
    
    NSArray *menu = [self model];
    
    for (id <RRNCollapsableTableViewSectionModelProtocol> menuSection in menu) {
        
        if (![menuSection conformsToProtocol:@protocol(RRNCollapsableTableViewSectionModelProtocol)]) {
            continue;
        }
             
        BOOL chosenMenuSection = menuSection == [menu objectAtIndex:view.tag];
        
        BOOL isVisible = menuSection.isVisible.boolValue;
        
        if (isVisible && chosenMenuSection) {
            
            menuSection.isVisible = @NO;
            
            BOOL headerConforms = [view conformsToProtocol:@protocol(RRNCollapsableTableViewSectionHeaderProtocol)];
            
            if (headerConforms) {
                [((id <RRNCollapsableTableViewSectionHeaderProtocol>)view) closeAnimated:YES];
            }
            
            NSInteger section = view.tag;
            
            BOOL shouldCollapse = [self shouldCollapse:section];
            
            if (shouldCollapse) {
                NSArray *indexPaths = [self indexPathsForSection:section
                                                  forMenuSection:menuSection];
                
                [tableView deleteRowsAtIndexPaths:indexPaths
                                 withRowAnimation:(foundOpenUnchosenMenuSection) ? UITableViewRowAnimationBottom : UITableViewRowAnimationTop];
            } else {
                [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
            }
            
        } else if (!isVisible && chosenMenuSection) {
            
            menuSection.isVisible = @YES;
            
            BOOL headerConforms = [view conformsToProtocol:@protocol(RRNCollapsableTableViewSectionHeaderProtocol)];
            
            if (headerConforms) {
                [((id <RRNCollapsableTableViewSectionHeaderProtocol>)view) openAnimated:YES];
            }
            
            NSInteger section = view.tag;
            
            BOOL shouldCollapse = [self shouldCollapse:section];
            
            if (shouldCollapse) {
                NSArray *indexPaths = [self indexPathsForSection:section
                                                  forMenuSection:menuSection];
                
                [tableView insertRowsAtIndexPaths:indexPaths
                                 withRowAnimation:(foundOpenUnchosenMenuSection) ? UITableViewRowAnimationBottom : UITableViewRowAnimationTop];
            } else {
                [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
            }
            
        } else if (isVisible && !chosenMenuSection && [self singleOpenSelectionOnly]) {
            
            foundOpenUnchosenMenuSection = YES;
            
            menuSection.isVisible = @NO;
            
            NSInteger section = [menu indexOfObject:menuSection];
            
            UIView *headerView = [tableView headerViewForSection:section];
            
            BOOL headerConforms = [view conformsToProtocol:@protocol(RRNCollapsableTableViewSectionHeaderProtocol)];
            
            if (headerConforms) {
                [((id <RRNCollapsableTableViewSectionHeaderProtocol>)headerView) closeAnimated:YES];
            }
            
            BOOL shouldCollapse = [self shouldCollapse:section];
            
            if (shouldCollapse) {
                NSArray *indexPaths = [self indexPathsForSection:section
                                                  forMenuSection:menuSection];
                
                [tableView deleteRowsAtIndexPaths:indexPaths
                                 withRowAnimation:(view.tag > section) ? UITableViewRowAnimationTop : UITableViewRowAnimationBottom];
            } else {
                [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
            }
        }
        
    }
    
    [tableView endUpdates];
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
