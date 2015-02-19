//
//  POTimer.h
//  The Pomodoro
//
//  Created by Ethan Hess on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const currentRoundNotification = @"currentRoundNotification";
static NSString * const secondTickNotification = @"secondTickNotification";
static NSString * const selectedRound = @"selectedRoundNotification";
static NSString * const timerEnded = @"timerEnded";
static NSString * const timerStarted = @"timerStarted";
static NSString * const appStarted = @"appStarted"; 

@interface POTimer : NSObject

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;


+(POTimer *)sharedInstance;

-(IBAction)startTimer:(id)sender;
-(IBAction)cancelTimer:(id)sender;
-(IBAction)pauseTimer:(id)sender;

@end
