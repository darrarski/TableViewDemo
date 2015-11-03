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

- (NSUInteger)itemsCount
{
    return self.items.count;
}

- (Item *)itemAtIndex:(NSUInteger)index
{
    return self.items[index];
}

#pragma mark -

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
