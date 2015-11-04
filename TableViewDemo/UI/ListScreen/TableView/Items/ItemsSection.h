//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <DRTableViewManager/DRTableViewSection.h>

typedef UITableView *(^ItemsSectionTableViewBlock)();
typedef NSUInteger (^ItemsSectionIndexBlock)();

@interface ItemsSection : NSObject <DRTableViewSection>

@property (nonatomic, copy) ItemsSectionTableViewBlock tableViewBlock;
@property (nonatomic, copy) ItemsSectionIndexBlock sectionIndexBlock;

+ (void)registerInTableView:(UITableView *)tableView;

- (void)reloadItems;
- (void)loadMoreItems;

@end
