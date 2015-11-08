//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "ItemRow.h"
#import "ItemCell.h"
#import "Item.h"

@implementation ItemRow

+ (Class)cellClass
{
    return [ItemCell class];
}

+ (NSString *)cellReuseIdentifier
{
    return @"ItemCell";
}

+ (void)registerInTableView:(UITableView *)tableView
{
    [tableView registerClass:[[self class] cellClass] forCellReuseIdentifier:[[self class] cellReuseIdentifier]];
}

#pragma mark - DRTableViewRow

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:[[self class] cellReuseIdentifier] forIndexPath:indexPath];
}

- (UITableViewCell *)tableViewManager:(DRTableViewManager *)tableViewManager tableView:(UITableView *)tableView cellForComputingRowHeightAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:[[self class] cellReuseIdentifier]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66.f;
}

- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)c forRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = (ItemCell *) c;
    Item *item = self.itemBlock ? self.itemBlock(indexPath) : nil;
    [cell setName:item.name];
}

@end
