//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <DRTableViewManager/DRTableViewManager.h>
#import <DRTableViewManager/DRTableViewGenericSectionsController.h>
#import "ListViewController.h"
#import "ItemsSection.h"
#import "LoadingSection.h"
#import "LoadMoreSection.h"

@interface ListViewController ()

@property (nonatomic, strong) DRTableViewManager *tableViewManager;
@property (nonatomic, strong) DRTableViewGenericSectionsController *sectionsController;
@property (nonatomic, strong) ItemsSection *listSection;
@property (nonatomic, strong) LoadingSection *loadingSection;
@property (nonatomic, strong) LoadMoreSection *loadMoreSection;
@property (nonatomic, strong, readonly) UIBarButtonItem *navigationBarRefreshButton;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupNavigationItem];
    [self setupTableView];
    [self.listSection reloadItems];
}

#pragma mark - Navigation Item

- (void)setupNavigationItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                           target:self
                                                                                           action:@selector(navigationBarRefreshButtonAction)];
}

- (UIBarButtonItem *)navigationBarRefreshButton
{
    return self.navigationItem.rightBarButtonItem;
}

- (void)navigationBarRefreshButtonAction
{
    [self.listSection reloadItems];
}

- (void)updateNavigationBarRefreshButtonEnabledState
{
    self.navigationBarRefreshButton.enabled = !self.listSection.isLoadingItems;
}

#pragma mark - Table

- (void)setupTableView
{
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableViewManager registerInTableView:self.tableView];
    [ItemsSection registerInTableView:self.tableView];
    [LoadingSection registerInTableView:self.tableView];
    [LoadMoreSection registerInTableView:self.tableView];
}

- (DRTableViewManager *)tableViewManager
{
    if (!_tableViewManager) {
        _tableViewManager = [[DRTableViewManager alloc] initWithSectionsController:self.sectionsController];
        _tableViewManager.automaticRowHeightResolvingType = DRTableViewResolveAutomaticRowHeightManually;
    }
    return _tableViewManager;
}

- (DRTableViewGenericSectionsController *)sectionsController
{
    if (!_sectionsController) {
        _sectionsController = [[DRTableViewGenericSectionsController alloc] init];
        _sectionsController.sectionsArray = @[
            self.listSection,
            self.loadingSection,
            self.loadMoreSection
        ];
    }
    return _sectionsController;
}

- (ItemsSection *)listSection
{
    if (!_listSection) {
        ItemsSection *section = [[ItemsSection alloc] init];
        __weak typeof(self) welf = self;
        section.tableViewBlock = ^UITableView * {
            return welf.tableView;
        };
        section.sectionIndexBlock = ^NSUInteger {
            return [welf.sectionsController.sectionsArray indexOfObject:welf.listSection];
        };
        section.didChangeCanLoadMoreItemsBlock = ^(BOOL oldValue, BOOL newValue) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [welf updateLoadMoreSectionVisibility];
            });
        };
        section.didChangeIsLoadingItemsBlock = ^(BOOL oldValue, BOOL newValue) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [welf updateNavigationBarRefreshButtonEnabledState];
                [welf updateLoadingSectionVisibility];
                [welf updateLoadMoreSectionVisibility];
            });
        };
        _listSection = section;
    }
    return _listSection;
}

- (LoadingSection *)loadingSection
{
    if (!_loadingSection) {
        LoadingSection *section = [[LoadingSection alloc] init];
        __weak typeof(section) weakSection = section;
        __weak typeof(self) welf = self;
        section.tableViewBlock = ^UITableView * {
            return welf.tableView;
        };
        section.sectionIndexBlock = ^NSUInteger {
            return [welf.sectionsController.sectionsArray indexOfObject:weakSection];
        };
        _loadingSection = section;
    }
    return _loadingSection;
}

- (void)updateLoadingSectionVisibility
{
    self.loadingSection.visible = self.listSection.isLoadingItems;
}

- (LoadMoreSection *)loadMoreSection
{
    if (!_loadMoreSection) {
        LoadMoreSection *section = [[LoadMoreSection alloc] init];
        __weak typeof(section) weakSection = section;
        __weak typeof(self) welf = self;
        section.tableViewBlock = ^UITableView * {
            return welf.tableView;
        };
        section.sectionIndexBlock = ^NSUInteger {
            return [welf.sectionsController.sectionsArray indexOfObject:weakSection];
        };
        section.loadMoreActionBlock = ^{
            if (!welf.listSection.isLoadingItems) {
                [welf.listSection loadMoreItems];
            }
        };
        _loadMoreSection = section;
    }
    return _loadMoreSection;
}

- (void)updateLoadMoreSectionVisibility
{
    self.loadMoreSection.visible = self.listSection.canLoadMoreItems && !self.listSection.isLoadingItems;
}

@end
