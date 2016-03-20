//
//  MeterSectionHeaderView.h
//  CollapsableOptions
//
//  Created by Robert Nash on 20/03/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import <CollapsableTableKit/CollapsableTableKit.h>

@interface MeterSectionHeaderView : UITableViewHeaderFooterView <RRNCollapsableTableViewSectionHeaderProtocol>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+(CGFloat)minimumHeight;

@end
