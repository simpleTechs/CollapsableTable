//
//  RRNCollapsableTableViewController.h
//  CollapsableTable
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "RRNCollapsableTableViewSectionHeaderProtocol.h"

@interface RRNCollapsableTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, RRNCollapsableTableViewSectionHeaderInteractionProtocol>

-(NSArray *)model;
-(UITableView *)collapsableTableView;
-(NSString *)sectionHeaderNibName;
-(void)userTapped:(UIView <RRNCollapsableTableViewSectionHeaderProtocol> *)view;
-(BOOL)singleOpenSelectionOnly;

@end
