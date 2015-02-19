//
//  POTimerViewController.m
//  The Pomodoro
//
//  Created by Ethan Hess on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "POTimerViewController.h"
#import "POTimer.h"


@interface POTimerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startTimer;
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) POTimer *poTimer;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@end

@implementation POTimerViewController



-(id)init {
    self = [super init];
    if (self) {
        self.poTimer = [POTimer sharedInstance];
        [self registerForNotifications];
    }
    return self;
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.poTimer.minutes = 25;
    [self updateTimerLabel];
    
     self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"Picture.jpg"]];
    
    
    
//    UIImage *image = [UIImage imageNamed:@"Galaxy"];
//    
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:image];
//    
//    backgroundImage.frame = self.view.bounds;
//    
//    backgroundImage.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:backgroundImage];


    
}

- (void)updateTimerLabel {
    
    
    self.timer.text = [NSString stringWithFormat:@"%lu:%02lu", (long)self.poTimer.minutes, (long)self.poTimer.seconds];
}

- (IBAction)startTimer:(id)sender {

    self.startTimer.enabled = NO;
    
    [[POTimer sharedInstance] startTimer:sender];
}

- (IBAction)pauseTimer:(id)sender {
    
    self.startTimer.enabled = YES;
    
    [[POTimer sharedInstance] pauseTimer:sender];
    
}



- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTimerLabel) name:secondTickNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(newRound) name:currentRoundNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)newRound {
    
    self.startTimer.enabled = YES;
    
    [self updateTimerLabel];
    
    [self updateButton];
    
}

- (void)updateButton {
    
    self.startTimer.enabled = YES;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
