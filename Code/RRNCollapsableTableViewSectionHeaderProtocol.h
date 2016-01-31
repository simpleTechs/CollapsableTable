//
//  RRNCollapsableTableViewSectionHeaderProtocol.h
//  CollapsableTable
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RRNCollapsableTableViewSectionHeaderProtocol;

@protocol RRNCollapsableTableViewSectionHeaderInteractionProtocol <NSObject>

-(void)userTappedView:(UITableViewHeaderFooterView <RRNCollapsableTableViewSectionHeaderProtocol> *)view atPoint:(CGPoint)point;

@end

@protocol RRNCollapsableTableViewSectionHeaderProtocol <NSObject>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) id <RRNCollapsableTableViewSectionHeaderInteractionProtocol> interactionDelegate;

-(void)openAnimated:(BOOL)animated;

-(void)closeAnimated:(BOOL)animated;

@end
