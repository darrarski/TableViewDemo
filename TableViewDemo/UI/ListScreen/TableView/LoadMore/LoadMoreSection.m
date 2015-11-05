//
// Created by Dariusz Rybicki on 05/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "LoadMoreSection.h"

@implementation LoadMoreSection

- (void)setVisible:(BOOL)visible
{
    if (_visible == visible) return;
    _visible = visible;
    if (_visible) {
        NSLog(@"show load more section");
    }
    else {
        NSLog(@"hide load more section");
    }
}

#pragma mark - DRTableViewSection

- (NSObject <DRTableViewRow> *)rowAtIndex:(NSInteger)index
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

@end
