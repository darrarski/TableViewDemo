//
// Created by Dariusz Rybicki on 05/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "LoadMoreSection.h"
#import "LoadMoreRow.h"

@interface LoadMoreSection ()

@property (nonatomic, strong) LoadMoreRow *row;

@end

@implementation LoadMoreSection

+ (void)registerInTableView:(UITableView *)tableView
{
    [LoadMoreRow registerInTableView:tableView];
}

- (void)setVisible:(BOOL)visible
{
    if (_visible == visible) return;
    UITableView *tableView = self.tableViewBlock ? self.tableViewBlock() : nil;
    NSUInteger sectionIndex = self.sectionIndexBlock ? self.sectionIndexBlock() : 0;
    [tableView beginUpdates];
    _visible = visible;
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex]
             withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}

#pragma mark - DRTableViewSection

- (NSObject <DRTableViewRow> *)rowAtIndex:(NSInteger)index
{
    return self.row;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.visible ? 1 : 0;
}

#pragma mark - Row

- (LoadMoreRow *)row
{
    if (!_row) {
        LoadMoreRow *row = [[LoadMoreRow alloc] init];
        __weak typeof(self) welf = self;
        row.willDisplayCellBlock = ^{
            if (welf.loadMoreActionBlock) welf.loadMoreActionBlock();
        };
        _row = row;
    }
    return _row;
}

@end
