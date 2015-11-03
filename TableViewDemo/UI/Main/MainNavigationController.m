//
//  Created by Dariusz Rybicki on 03/11/15.
//  Copyright © 2015 Darrarski. All rights reserved.
//

#import "MainNavigationController.h"
#import "ListViewController.h"

@implementation MainNavigationController

- (instancetype)init
{
    UIViewController *rootViewController = [[ListViewController alloc] initWithStyle:UITableViewStylePlain];
    self = [super initWithRootViewController:rootViewController];
    return self;
}

@end
