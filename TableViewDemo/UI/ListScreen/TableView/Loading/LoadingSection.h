//
// Created by Dariusz Rybicki on 04/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <DRTableViewManager/DRTableViewSection.h>

typedef UITableView *(^LoadingSectionTableViewBlock)();
typedef NSUInteger (^LoadingSectionIndexBlock)();

@interface LoadingSection : NSObject <DRTableViewSection>

@property (nonatomic, assign) BOOL visible;

@property (nonatomic, copy) LoadingSectionTableViewBlock tableViewBlock;
@property (nonatomic, copy) LoadingSectionIndexBlock sectionIndexBlock;

@end
