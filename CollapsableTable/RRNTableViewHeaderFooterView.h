//
//  RRNTableViewHeaderFooterView.h
//  CollapsableTableKit
//
//  Created by Robert Nash on 02/09/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRNTableViewHeaderFooterView : UITableViewHeaderFooterView
-(void)updateTitle:(NSString*)title;
-(void)openAnimated:(BOOL)animated;
-(void)closeAnimated:(BOOL)animated;
@end
