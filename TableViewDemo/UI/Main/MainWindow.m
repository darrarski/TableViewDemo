//
//  Created by Dariusz Rybicki on 03/11/15.
//  Copyright © 2015 Darrarski. All rights reserved.
//

#import "MainWindow.h"
#import "MainNavigationController.h"

@implementation MainWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [[MainNavigationController alloc] init];
    }
    return self;
}

@end
