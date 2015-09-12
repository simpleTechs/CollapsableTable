//
//  ViewController.m
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "ViewController.h"
#import "MenuSection.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *menu;
@end

@implementation ViewController

static NSString *identifier = @"MenuSectionHeaderView";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self.tableView registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
    
    self.menu = [self buildMenu];
}

-(NSString *)sectionHeaderReuseIdentifier {
    return identifier;
}

-(NSArray *)buildMenu {
    
    NSMutableArray *collector = [NSMutableArray new];
    
    for (NSInteger i = 0; i < 5; i++) {
        
        MenuSection *section = [MenuSection new];
        
        switch (i) {
            case 0:
                section.title = @"Option 1";
                section.isVisible = @YES;
                section.items = @[[NSNull null], [NSNull null], [NSNull null]];
                break;
                
            case 1:
                section.title = @"Option 2";
                section.items = @[[NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null], [NSNull null]];
                break;
                
            case 2:
                section.title = @"Option 3";
                section.items = @[[NSNull null], [NSNull null], [NSNull null]];
                break;
                
            case 3:
                section.title = @"Option 4";
                section.items = @[[NSNull null], [NSNull null]];
                break;
                
            case 4:
                section.title = @"Option 5";
                section.items = @[[NSNull null], [NSNull null], [NSNull null], [NSNull null]];
                break;
                
            default:
                break;
        }
        
        [collector addObject:section];
    }
    
    return [collector copy];
}

-(NSArray *)model {
    return self.menu;
}

-(UITableView *)collapsableTableView {
    return self.tableView;
}

-(BOOL)singleOpenSelectionOnly {
    return NO;
}

#pragma mark - UITableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id <RRNCollapsableSectionItemProtocol> mSection = self.menu[indexPath.section];
    
    id item = mSection.items[indexPath.row];
    
    return [tableView dequeueReusableCellWithIdentifier:@"Cell"];
}

@end
