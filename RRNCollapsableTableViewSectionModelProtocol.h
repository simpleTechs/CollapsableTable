//
//  RRNCollapsableTableViewSectionModelProtocol.h
//  CollapsableTable
//
//  Created by Robert Nash on 07/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import <UIkit/UIKit.h>

@protocol RRNCollapsableTableViewSectionModelProtocol <NSObject>
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *isVisible;
@property (nonatomic, strong) NSArray *items;
@end
