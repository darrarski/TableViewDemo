//
// Created by Dariusz Rybicki on 05/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "LoadMoreCell.h"

@implementation LoadMoreCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
