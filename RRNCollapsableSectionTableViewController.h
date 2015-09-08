//
//  RRNCollapsableTableViewController.h
//  RRNCollapsableSectionTableView
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "RRNCollapsableSectionHeaderProtocol.h"

@interface RRNCollapsableTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, RRNCollapsableSectionHeaderReactiveProtocol>

-(NSArray *)model;
-(BOOL)singleOpenSelectionOnly;
-(UITableView *)collapsableTableView;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)userTapped:(UIView <RRNCollapsableSectionHeaderProtocol> *)view;

@end
