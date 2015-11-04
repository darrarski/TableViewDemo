//
// Created by Dariusz Rybicki on 04/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "ItemsListController.h"
#import "Item.h"

@interface ItemsListController ()

@property (nonatomic, strong) NSArray<Item *> *items;

@end

@implementation ItemsListController

- (void)clearItems
{
    [self deleteAllItems];
}

- (void)loadMoreItems
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        NSUInteger startIndex = self.items.count;
        NSMutableArray *items = [NSMutableArray new];
        for (NSUInteger i = 1; i <= 3; ++i) {
            [items addObject:[[Item alloc] initWithName:[NSString stringWithFormat:@"Item #%@", @(startIndex+i)]]];
        }
        [self insertItems:[items copy]];
    });
}

#pragma mark - Items

- (NSArray *)items
{
    if (!_items) {
        _items = @[];
    }
    return _items;
}

- (void)insertItems:(NSArray<Item *> *)items
{
    NSUInteger count = items.count;
    if (count == 0) return;
    NSUInteger atIndex = self.items.count;
    if (self.willUpdateBlock) self.willUpdateBlock();
    self.items = [self.items arrayByAddingObjectsFromArray:items];
    if (self.didInsertItemsBlock) self.didInsertItemsBlock(count, atIndex);
    if (self.didUpdateBlock) self.didUpdateBlock();
}

- (void)deleteAllItems
{
    NSUInteger count = self.items.count;
    if (count == 0) return;
    NSUInteger atIndex = 0;
    if (self.willUpdateBlock) self.willUpdateBlock();
    self.items = @[];
    if (self.didDeleteItemsBlock) self.didDeleteItemsBlock(count, atIndex);
    if (self.didUpdateBlock) self.didUpdateBlock();
}

@end
