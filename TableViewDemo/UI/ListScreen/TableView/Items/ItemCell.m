//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "ItemCell.h"

@interface ItemCell ()

@property (nonatomic, strong) UIView *topBorderView;
@property (nonatomic, strong) UIView *bottomBorderView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation ItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self loadSubviews];
        [self setupLayout];
        [self cleanUp];
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [self cleanUp];
}

#pragma mark - Configuration

- (void)cleanUp
{
    [self setName:nil];
}

- (void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}

#pragma mark - Subviews

- (void)loadSubviews
{
    self.topBorderView = [self createBorderView];
    self.bottomBorderView = self.createBorderView;
    [self.contentView addSubview:self.topBorderView];
    [self.contentView addSubview:self.bottomBorderView];
    [self.contentView addSubview:self.nameLabel];
}

- (UIView *)createBorderView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
        label.textColor = [UIColor darkTextColor];
        _nameLabel = label;
    }
    return _nameLabel;
}

#pragma mark - Layout

- (void)setupLayout
{
    [self.topBorderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(@(-.5f));
        make.height.equalTo(@.5f);
    }];
    [self.bottomBorderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@.5f);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@16);
        make.right.lessThanOrEqualTo(@16);
        make.top.equalTo(@23);
        make.bottom.equalTo(@-23);
    }];
}

@end
