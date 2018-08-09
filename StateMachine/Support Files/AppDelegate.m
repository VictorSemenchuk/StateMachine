//
//  AppDelegate.m
//  StateMachine
//
//  Created by Victor Macintosh on 08/08/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect screenSize = UIScreen.mainScreen.bounds;
    UIWindow *window = [[UIWindow alloc] initWithFrame:screenSize];
    ViewController *vc = [[ViewController alloc] init];
    window.rootViewController = vc;
    self.window = window;
    [window makeKeyAndVisible];
    return YES;
}

@end
