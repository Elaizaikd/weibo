//
//  AppDelegate.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/15.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "UserAccountViewModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupApperance];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    MainViewController *main = [[MainViewController alloc]init];
    self.window.rootViewController = main;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)setupApperance{
    UINavigationBar.appearance.tintColor = WBAppearanceTintColor;
    UITabBar.appearance.tintColor = WBAppearanceTintColor;
}

@end
