//
//  AppDelegate.m
//  LCMVVMDemo
//
//  Created by iWolf on 2019/10/28.
//  Copyright © 2019 iWolf. All rights reserved.
//

#import "AppDelegate.h"
#import "LCPresentViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    LCPresentViewController * presentViewController = [[LCPresentViewController alloc] init];

    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:presentViewController];
    [self.window setRootViewController:navigationController];
    
    return YES;
}



@end
