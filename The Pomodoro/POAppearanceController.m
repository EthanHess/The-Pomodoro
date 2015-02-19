//
//  POAppearanceController.m
//  The Pomodoro
//
//  Created by Ethan Hess on 2/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "POAppearanceController.h"


@implementation POAppearanceController

+(void)setUpDefaultAppearance {
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [UIColor redColor] }];
    

    
    
    
    
//    [[UINavigationBar appearanceWhenContainedIn:[POPlaygroundViewController class], nil] setTitleTextAttributes:@{
//                                                                                                                  NSForegroundColorAttributeName: [UIColor yellowColor] }];
}

@end
