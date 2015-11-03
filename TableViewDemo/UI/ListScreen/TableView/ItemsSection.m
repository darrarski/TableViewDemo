//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "ItemsSection.h"
#import "ItemRow.h"
#import "Item.h"

@interface ItemsSection ()

@property (nonatomic, strong) NSArray<Item *> *items;
@property (nonatomic, strong) ItemRow *itemRow;

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

#pragma mark - Items

- (NSArray *)items
{
    if (!_items) {
        NSMutableArray *items = [NSMutableArray new];
        for (NSUInteger i = 1; i <= 10; ++i) {
            [items addObject:[[Item alloc] initWithName:[NSString stringWithFormat:@"Item #%@", @(i)]]];
        }
        _items = [items copy];
    }
    return _items;
}

@end
