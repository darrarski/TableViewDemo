//
// Created by Dariusz Rybicki on 04/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

typedef void (^ItemsListControllerInsertBlock)(NSUInteger count, NSUInteger atIndex);
typedef void (^ItemsListControllerDeleteBlock)(NSUInteger count, NSUInteger atIndex);
typedef void (^ItemsListControllerBoolChangeBlock)(BOOL oldValue, BOOL newValue);

@interface ItemsListController : NSObject

@property (nonatomic, strong, readonly) NSArray<Item *> *items;
@property (nonatomic, copy) ItemsListControllerInsertBlock didInsertItemsBlock;
@property (nonatomic, copy) ItemsListControllerDeleteBlock didDeleteItemsBlock;

@property (nonatomic, assign, readonly) BOOL isLoadingItems;
@property (nonatomic, copy) ItemsListControllerBoolChangeBlock didChangeIsLoadingItemsBlock;

@property (nonatomic, assign, readonly) BOOL canLoadMoreItems;
@property (nonatomic, copy) ItemsListControllerBoolChangeBlock didChangeCanLoadMoreItemsBlock;

- (void)clearItems;
- (void)loadMoreItems;

@end
