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
-(UITableView *)collapsableTableView;

-(NSString *)sectionHeaderReuseIdentifier;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)userTapped:(UIView <RRNCollapsableSectionHeaderProtocol> *)view;

-(BOOL)singleOpenSelectionOnly;

@end
