//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <DRTableViewManager/DRTableViewManager.h>
#import <DRTableViewManager/DRTableViewGenericSectionsController.h>
#import "ListViewController.h"
#import "ItemsSection.h"

@interface ListViewController ()

@property (nonatomic, strong) DRTableViewManager *tableViewManager;
@property (nonatomic, strong) DRTableViewGenericSectionsController *sectionsController;
@property (nonatomic, strong) ItemsSection *listSection;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
}

#pragma mark - Table

- (void)setupTableView
{
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableViewManager registerInTableView:self.tableView];
    [ItemsSection registerInTableView:self.tableView];
}

- (DRTableViewManager *)tableViewManager
{
    if (!_tableViewManager) {
        _tableViewManager = [[DRTableViewManager alloc] initWithSectionsController:self.sectionsController];
    }
    return _tableViewManager;
}

- (DRTableViewGenericSectionsController *)sectionsController
{
    if (!_sectionsController) {
        _sectionsController = [[DRTableViewGenericSectionsController alloc] init];
        _sectionsController.sectionsArray = @[self.listSection];
    }
    return _sectionsController;
}

- (ItemsSection *)listSection
{
    if (!_listSection) {
        _listSection = [[ItemsSection alloc] init];
    }
    return _listSection;
}

@end
