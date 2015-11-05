//
// Created by Dariusz Rybicki on 05/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <DRTableViewManager/DRTableViewRow.h>

typedef void (^LoadMoreRowBlock)();

@interface LoadMoreRow : NSObject <DRTableViewRow>

@property (nonatomic, copy) LoadMoreRowBlock willDisplayCellBlock;

+ (void)registerInTableView:(UITableView *)tableView;

@end
