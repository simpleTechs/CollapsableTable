//
//  RRNCollapsableTableViewSectionHeaderProtocol.h
//  CollapsableTable
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "RRNCollapsableTableViewSectionHeaderInteractionProtocol.h"

@protocol RRNCollapsableTableViewSectionHeaderProtocol <NSObject>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) id <RRNCollapsableTableViewSectionHeaderInteractionProtocol> interactionDelegate;
-(void)openAnimated:(BOOL)animated;
-(void)closeAnimated:(BOOL)animated;
@end
