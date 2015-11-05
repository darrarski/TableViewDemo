//
// Created by Dariusz Rybicki on 05/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "LoadingCell.h"

@interface LoadingCell ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation LoadingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        [self loadSubviews];
        [self setupLayout];
    }
    return self;
}

#pragma mark - Subviews

- (void)loadSubviews
{
    [self.contentView addSubview:self.activityIndicatorView];
}

- (UIActivityIndicatorView *)activityIndicatorView
{
    if (!_activityIndicatorView) {
        UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        view.hidesWhenStopped = NO;
        [view startAnimating];
        _activityIndicatorView = view;
    }
    return _activityIndicatorView;
}

#pragma mark - Layout

- (void)setupLayout
{
    [self.activityIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
    }];
}

@end
