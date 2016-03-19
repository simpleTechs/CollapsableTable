//
//  MenuSectionHeaderView.h
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import <CollapsableTableKit/CollapsableTableKit.h>

@interface MenuSectionHeaderView : UITableViewHeaderFooterView <RRNCollapsableTableViewSectionHeaderProtocol>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+(CGFloat)minimumHeight;

@end
