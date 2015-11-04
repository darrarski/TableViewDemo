//
// Created by Dariusz Rybicki on 04/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "ItemsListController.h"
#import "Item.h"

@interface ItemsListController ()

@property (nonatomic, assign) BOOL isLoadingItems;
@property (nonatomic, assign) BOOL canLoadMoreItems;
@property (nonatomic, strong) NSArray<Item *> *items;

@end

@implementation ItemsListController

- (void)clearItems
{
    [self deleteAllItems];
    self.canLoadMoreItems = YES;
}

- (void)loadMoreItems
{
    if (!self.canLoadMoreItems) return;
    self.isLoadingItems = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        self.isLoadingItems = NO;
        [self insertItems:[self generateMoreItems]];
        self.canLoadMoreItems = [self canGenerateMoreItems];
    });
}

#pragma mark -

- (NSArray *)generateMoreItems
{
    NSUInteger startIndex = self.items.count;
    NSMutableArray *items = [NSMutableArray new];
    for (NSUInteger i = 1; i <= 3; ++i) {
        [items addObject:[[Item alloc] initWithName:[NSString stringWithFormat:@"Item #%@", @(startIndex+i)]]];
    }
    return [items copy];
}

- (BOOL)canGenerateMoreItems
{
    return self.items.count < 50;
}

#pragma mark - Properties

- (void)setIsLoadingItems:(BOOL)isLoadingItems
{
    BOOL oldValue = _isLoadingItems;
    BOOL newValue = isLoadingItems;
    _isLoadingItems = newValue;
    if (self.didChangeIsLoadingItemsBlock) self.didChangeIsLoadingItemsBlock(oldValue, newValue);
}

- (void)setCanLoadMoreItems:(BOOL)canLoadMoreItems
{
    BOOL oldValue = _canLoadMoreItems;
    BOOL newValue = canLoadMoreItems;
    _canLoadMoreItems = newValue;
    if (self.didChangeCanLoadMoreItemsBlock) self.didChangeCanLoadMoreItemsBlock(oldValue, newValue);
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
    self.items = [self.items arrayByAddingObjectsFromArray:items];
    if (self.didInsertItemsBlock) self.didInsertItemsBlock(count, atIndex);
}

- (void)deleteAllItems
{
    NSUInteger count = self.items.count;
    if (count == 0) return;
    NSUInteger atIndex = 0;
    self.items = @[];
    if (self.didDeleteItemsBlock) self.didDeleteItemsBlock(count, atIndex);
}

@end
