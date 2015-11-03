//
// Created by Dariusz Rybicki on 03/11/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, strong, readonly) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
