//
//  ViewController.m
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "ViewController.h"
#import "MenuSectionHeaderView.h"
#import "FakeModelBuilder.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray <RRNCollapsableTableViewSectionModelProtocol> *menu;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

#pragma mark - RRNCollapsableTableView

-(UITableView *)collapsableTableView {
    return self.tableView;
}

-(NSString *)sectionHeaderNibName {
    return NSStringFromClass([MenuSectionHeaderView class]);
}

-(BOOL)singleOpenSelectionOnly {
    return YES;
}

#pragma mark - Menu

-(NSArray <RRNCollapsableTableViewSectionModelProtocol> *)menu {
    if (_menu == nil) {
        _menu = (NSArray <RRNCollapsableTableViewSectionModelProtocol> *)[FakeModelBuilder buildMenu];
    }
    return _menu;
}

-(NSArray <RRNCollapsableTableViewSectionModelProtocol> *)model {
    return self.menu;
}

#pragma mark - UITableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [MenuSectionHeaderView minimumHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    id <RRNCollapsableTableViewSectionModelProtocol> mSection = self.menu[indexPath.section];
//    id item = mSection.items[indexPath.row];
    
    return [tableView dequeueReusableCellWithIdentifier:@"Cell"];
}

@end
