//
//  ViewController.m
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "ViewController.h"
#import "FakeModelBuilder.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *menu;
@end

@implementation ViewController

static NSString *sectionHeaderIdentifier = @"MenuSectionHeaderView";

-(NSArray *)menu {
    if (_menu == nil) {
        _menu = [FakeModelBuilder buildMenu];
    }
    return _menu;
}

#pragma mark - RRNCollapsableTableView

-(NSString *)sectionHeaderReuseIdentifier {
    return sectionHeaderIdentifier;
}

-(NSArray *)model {
    return self.menu;
}

-(UITableView *)collapsableTableView {
    return self.tableView;
}

#pragma mark - UITableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //id <RRNCollapsableSectionItemProtocol> mSection = self.menu[indexPath.section];
    //id item = mSection.items[indexPath.row];
    
    return [tableView dequeueReusableCellWithIdentifier:@"Cell"];
}

@end
