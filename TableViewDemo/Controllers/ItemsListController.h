//
// Created by Dariusz Rybicki on 04/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

typedef void (^ItemsListControllerBlock)();
typedef void (^ItemsListControllerInsertBlock)(NSUInteger count, NSUInteger atIndex);

@interface ItemsListController : NSObject

@property (nonatomic, strong, readonly) NSArray<Item *> *items;

@property (nonatomic, copy) ItemsListControllerBlock willUpdateBlock;
@property (nonatomic, copy) ItemsListControllerInsertBlock didInsertItemsBlock;
@property (nonatomic, copy) ItemsListControllerBlock didUpdateBlock;

@end
