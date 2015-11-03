//
//  Created by Dariusz Rybicki on 03/11/15.
//  Copyright © 2015 Darrarski. All rights reserved.
//

#import "MainNavigationController.h"
#import "ViewController.h"

@implementation MainNavigationController

- (instancetype)init
{
    UIViewController *rootViewController = [[ViewController alloc] initWithNibName:nil bundle:nil];
    return [super initWithRootViewController:rootViewController];
}

@end
