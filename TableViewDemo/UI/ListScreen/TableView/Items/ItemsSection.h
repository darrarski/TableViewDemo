//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <DRTableViewManager/DRTableViewSection.h>

typedef UITableView *(^ItemsSectionTableViewBlock)();
typedef NSUInteger (^ItemsSectionIndexBlock)();
typedef void (^ItemsSectionBoolChangeBlock)(BOOL oldValue, BOOL newValue);

@interface ItemsSection : NSObject <DRTableViewSection>

@property (nonatomic, copy) ItemsSectionTableViewBlock tableViewBlock;
@property (nonatomic, copy) ItemsSectionIndexBlock sectionIndexBlock;

@property (nonatomic, assign, readonly) BOOL isLoadingItems;
@property (nonatomic, copy) ItemsSectionBoolChangeBlock didChangeIsLoadingItemsBlock;

@property (nonatomic, assign, readonly) BOOL canLoadMoreItems;
@property (nonatomic, copy) ItemsSectionBoolChangeBlock didChangeCanLoadMoreItemsBlock;

+ (void)registerInTableView:(UITableView *)tableView;

- (void)reloadItems;
- (void)loadMoreItems;

@end
