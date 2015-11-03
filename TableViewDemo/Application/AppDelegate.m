//
//  Created by Dariusz Rybicki on 03/11/15.
//  Copyright © 2015 Darrarski. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindow.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[MainWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
