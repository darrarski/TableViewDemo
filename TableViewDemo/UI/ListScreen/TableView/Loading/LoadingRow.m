//
// Created by Dariusz Rybicki on 05/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "LoadingRow.h"
#import "LoadingCell.h"

@implementation LoadingRow

+ (Class)cellClass
{
    return [LoadingCell class];
}

+ (NSString *)cellReuseIdentifier
{
    return @"LoadingCell";
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
    return 80.f;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.f;
}

@end
