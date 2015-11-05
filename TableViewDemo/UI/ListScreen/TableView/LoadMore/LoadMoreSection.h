//
// Created by Dariusz Rybicki on 05/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <DRTableViewManager/DRTableViewSection.h>

typedef UITableView *(^LoadMoreSectionTableViewBlock)();
typedef NSUInteger (^LoadMoreSectionIndexBlock)();

@interface LoadMoreSection : NSObject <DRTableViewSection>

@property (nonatomic, assign) BOOL visible;

@property (nonatomic, copy) LoadMoreSectionTableViewBlock tableViewBlock;
@property (nonatomic, copy) LoadMoreSectionIndexBlock sectionIndexBlock;

@end
