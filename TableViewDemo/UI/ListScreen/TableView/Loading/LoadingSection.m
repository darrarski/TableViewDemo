//
// Created by Dariusz Rybicki on 04/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "LoadingSection.h"

@implementation LoadingSection

- (void)setVisible:(BOOL)visible
{
    if (_visible == visible) return;
    _visible = visible;
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
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

@end
