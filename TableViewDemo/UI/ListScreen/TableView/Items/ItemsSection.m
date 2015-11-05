//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "ItemsSection.h"
#import "ItemRow.h"
#import "Item.h"
#import "ItemsListController.h"

@interface ItemsSection ()

@property (nonatomic, strong) ItemRow *itemRow;
@property (nonatomic, strong) ItemsListController *itemsListController;
@property (nonatomic, strong) NSArray *items;

@end

@implementation ItemsSection

+ (void)registerInTableView:(UITableView *)tableView
{
    [ItemRow registerInTableView:tableView];
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setupItemsListController];
    }
    return self;
}

- (void)reloadItems
{
    [self.itemsListController clearItems];
    [self loadMoreItems];
}

- (void)loadMoreItems
{
    [self.itemsListController loadMoreItems];
}

#pragma mark - Properties

- (BOOL)canLoadMoreItems
{
    return self.itemsListController.canLoadMoreItems;
}

- (ItemsSectionBoolChangeBlock)didChangeCanLoadMoreItemsBlock
{
    return self.itemsListController.didChangeCanLoadMoreItemsBlock;
}

- (void)setDidChangeCanLoadMoreItemsBlock:(ItemsSectionBoolChangeBlock)didChangeCanLoadMoreItemsBlock
{
    self.itemsListController.didChangeCanLoadMoreItemsBlock = didChangeCanLoadMoreItemsBlock;
}

- (BOOL)isLoadingItems
{
    return self.itemsListController.isLoadingItems;
}

- (ItemsSectionBoolChangeBlock)didChangeIsLoadingItemsBlock
{
    return self.itemsListController.didChangeIsLoadingItemsBlock;
}

- (void)setDidChangeIsLoadingItemsBlock:(ItemsSectionBoolChangeBlock)didChangeIsLoadingItemsBlock
{
    self.itemsListController.didChangeIsLoadingItemsBlock = didChangeIsLoadingItemsBlock;
}

#pragma mark - DRTableViewSection

- (NSObject <DRTableViewRow> *)rowAtIndex:(NSInteger)index
{
    return self.itemRow;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

#pragma mark - Row

- (ItemRow *)itemRow
{
    if (!_itemRow) {
        ItemRow *row = [[ItemRow alloc] init];
        __weak typeof(self) welf = self;
        row.itemBlock = ^Item *(NSIndexPath *indexPath) {
            return welf.items[(NSUInteger) indexPath.row];
        };
        _itemRow = row;
    }
    return _itemRow;
}

#pragma mark - ItemsListController

- (ItemsListController *)itemsListController
{
    if (!_itemsListController) {
        _itemsListController = [[ItemsListController alloc] init];;
    }
    return _itemsListController;
}

- (void)setupItemsListController
{
    __weak typeof(self) welf = self;
    self.itemsListController.didInsertItemsBlock = ^(NSUInteger count, NSUInteger atIndex) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UITableView *tableView = welf.tableViewBlock ? welf.tableViewBlock() : nil;
            [tableView beginUpdates];
            welf.items = welf.itemsListController.items;
            [tableView insertRowsAtIndexPaths:[welf indexPathsForRowsWithStartIndex:atIndex
                                                                              count:count]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
            [tableView endUpdates];
        });
    };
    self.itemsListController.didDeleteItemsBlock = ^(NSUInteger count, NSUInteger atIndex) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UITableView *tableView = welf.tableViewBlock ? welf.tableViewBlock() : nil;
            [tableView beginUpdates];
            welf.items = welf.itemsListController.items;
            [tableView deleteRowsAtIndexPaths:[welf indexPathsForRowsWithStartIndex:atIndex
                                                                              count:count]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
            [tableView endUpdates];
        });
    };
}

#pragma mark -

- (NSArray<NSIndexPath *> *)indexPathsForRowsWithStartIndex:(NSUInteger)startIndex count:(NSUInteger)count
{
    NSUInteger sectionIndex = self.sectionIndexBlock ? self.sectionIndexBlock() : 0;
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (NSUInteger i = 0; i < count; ++i) {
        NSUInteger rowIndex = startIndex + i;
        [indexPaths addObject:[NSIndexPath indexPathForRow:rowIndex
                                                 inSection:sectionIndex]];
    }
    return [indexPaths copy];
}

@end
