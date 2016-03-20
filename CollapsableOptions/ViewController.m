//
//  ViewController.m
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "ViewController.h"
#import "ArrowSectionHeaderView.h"
#import "MeterSectionHeaderView.h"
#import "FakeModelBuilder.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray <RRNCollapsableTableViewSectionModelProtocol> *customModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

#pragma mark - RRNCollapsableTableView

-(UITableView *)collapsableTableView {
    return self.tableView;
}

-(NSString *)sectionHeaderNibName {
    return [[NSProcessInfo processInfo] environment][@"SECTION_HEADER"];//Provided by scheme
}

-(BOOL)singleOpenSelectionOnly {
    return YES;
}

#pragma mark - Menu

-(NSArray <RRNCollapsableTableViewSectionModelProtocol> *)customModel {
    if (_customModel == nil) {
        _customModel = (NSArray <RRNCollapsableTableViewSectionModelProtocol> *)[FakeModelBuilder buildModel];
    }
    return _customModel;
}

-(NSArray <RRNCollapsableTableViewSectionModelProtocol> *)model {
    return self.customModel;
}

#pragma mark - UITableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [MeterSectionHeaderView minimumHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <RRNCollapsableTableViewSectionModelProtocol> mSection = self.customModel[indexPath.section];
    NSString *item = mSection.items[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = item;
    return cell;
}

@end
