//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "Item.h"

@interface Item ()

@property (nonatomic, strong) NSString *name;

@end

@implementation Item

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

@end
