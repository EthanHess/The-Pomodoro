//
//  POAppDelegate.m
//  The Pomodoro
//
//  Created by Joshua Howland on 6/3/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "POAppDelegate.h"
#import "POTimerViewController.h"
#import "PORoundsViewController.h"
#import "POAppearanceController.h"

@implementation POAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    POTimerViewController *timeViewController = [POTimerViewController new];
    timeViewController.tabBarItem.title = @"Timer";
    timeViewController.tabBarItem.image = [UIImage imageNamed:@"Clock"];
    
    
    PORoundsViewController *roundsViewController = [PORoundsViewController new];
    roundsViewController.tabBarItem.title = @"Rounds";
    roundsViewController.tabBarItem.image = [UIImage imageNamed:@"Rounds"];

    //UINavigationController *POPNav = [[UINavigationController alloc]initWithRootViewController:timeViewController];
    
    [POAppearanceController setUpDefaultAppearance];
    
    UINavigationController *navControllerForRoundsViewController = [[UINavigationController alloc]initWithRootViewController:roundsViewController];
    
    
    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[timeViewController,navControllerForRoundsViewController];


        
   self.window.rootViewController = tabBarController;
    
    return YES;
                                            
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        //iOS 8
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil]];
    }
    
    else
    { //iOS 7 or below
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    }
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.


}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    UIAlertController *notificationAlert = [UIAlertController alertControllerWithTitle:@" Time's up! " message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    
    [notificationAlert addAction:[UIAlertAction actionWithTitle:@"Okay!" style:UIAlertActionStyleDefault handler:nil]];
    
    [self.window.rootViewController presentViewController:notificationAlert animated:YES completion:nil];
    
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
