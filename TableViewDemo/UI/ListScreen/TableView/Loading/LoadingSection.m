//
// Created by Dariusz Rybicki on 04/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "LoadingSection.h"
#import "LoadingRow.h"

@interface LoadingSection ()

@property (nonatomic, strong) LoadingRow *row;

@end

@implementation LoadingSection

+ (void)registerInTableView:(UITableView *)tableView
{
    [LoadingRow registerInTableView:tableView];
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
    if (_visible) {
        NSLog(@"show loading section");
    }
    else {
        NSLog(@"hide loading section");
    }
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

- (LoadingRow *)row
{
    if (!_row) {
        _row = [[LoadingRow alloc] init];
    }
    return _row;
}

@end
