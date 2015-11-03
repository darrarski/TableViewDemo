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

@end

@implementation ItemsSection

+ (void)registerInTableView:(UITableView *)tableView
{
    [ItemRow registerInTableView:tableView];
}

#pragma mark - DRTableViewSection

- (NSObject <DRTableViewRow> *)rowAtIndex:(NSInteger)index
{
    return self.itemRow;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsListController.itemsCount;
}

#pragma mark - Row

- (ItemRow *)itemRow
{
    if (!_itemRow) {
        ItemRow *row = [[ItemRow alloc] init];
        __weak typeof(self) welf = self;
        row.itemBlock = ^Item *(NSIndexPath *indexPath) {
            return [welf.itemsListController itemAtIndex:(NSUInteger) indexPath.row];
        };
        _itemRow = row;
    }
    return _itemRow;
}

#pragma mark - ItemsListController

- (ItemsListController *)itemsListController
{
    if (!_itemsListController) {
        ItemsListController *controller = [[ItemsListController alloc] init];
        _itemsListController = controller;
    }
    return _itemsListController;
}

@end
