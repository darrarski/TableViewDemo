//
// Created by Dariusz Rybicki on 04/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemsListController : NSObject

- (NSUInteger)itemsCount;
- (Item *)itemAtIndex:(NSUInteger)index;

@end
