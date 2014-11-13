//
//  AppDelegate.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "AppDelegate.h"
#import "TextInputViewController.h"
#import "ListViewController.h"
#import "DetailViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Create a new window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    UITabBarController *tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    
    TextInputViewController *textInputController = [[TextInputViewController alloc] initWithNibName:nil bundle:nil];
    
    // Add first VC and show it
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:textInputController];
    
    ListViewController *listViewController = [[ListViewController alloc] initWithNibName:nil bundle:nil];

    UINavigationController *otherNavigationController = [[UINavigationController alloc] initWithRootViewController:listViewController];
    
    tabBarController.viewControllers = @[navigationController, otherNavigationController];
    
    [navigationController.tabBarItem setTitle:@"Agrega un item"];
    [otherNavigationController.tabBarItem setTitle:@"Listado de items"];
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];

    return YES;
}

@end
