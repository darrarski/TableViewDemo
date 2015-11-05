//
// Created by Dariusz Rybicki on 05/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "LoadMoreRow.h"
#import "LoadMoreCell.h"

@implementation LoadMoreRow

+ (Class)cellClass
{
    return [LoadMoreCell class];
}

+ (NSString *)cellReuseIdentifier
{
    return @"LoadMoreCell";
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 10.f;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.willDisplayCellBlock) self.willDisplayCellBlock();
}

@end
