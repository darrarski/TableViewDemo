//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <DRTableViewManager/DRTableViewRow.h>

@class Item;

typedef Item *(^ItemRowItemBlock)(NSIndexPath *indexPath);

@interface ItemRow : NSObject <DRTableViewRow>

@property (nonatomic, copy) ItemRowItemBlock itemBlock;

+ (void)registerInTableView:(UITableView *)tableView;

@end
