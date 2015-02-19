//
//  PORoundsViewController.m
//  The Pomodoro
//
//  Created by Ethan Hess on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PORoundsViewController.h"
#import "POTimer.h"
#import "POTimerViewController.h"

@interface PORoundsViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *roundTimes;

@end

@implementation PORoundsViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Rounds";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.currentRound = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(roundComplete) name:timerEnded object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableView: didDeselectRowAtIndexPath:) name:timerEnded object:nil];
    
}

-(void)roundComplete {
    
    while(self.currentRound != [self returnRoundTimes].count - 1) {
        
        self.currentRound ++;
        
        [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentRound inSection:0]];
        
        
        //[self roundSelected:self.currentRound];
        
    }
    
    NSLog(@"Timer has finished!");
    
}

-(NSArray *)returnRoundTimes {
    
    return self.roundTimes = @[@25,@5,@25,@5,@25,@5,@25,@15];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self returnRoundTimes].count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ Minutes",self.returnRoundTimes[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:timerStarted object:nil];
    
    self.currentRound = indexPath.row;
    
    [self roundSelected:indexPath.row];
    

    
    
    
    
}

-(void)roundSelected:(NSInteger)currentRound {
    
    POTimer *timer = [POTimer sharedInstance];
    NSArray *array = [self returnRoundTimes];
    currentRound = self.currentRound;

    
    timer.minutes = [array[currentRound]integerValue];
    timer.seconds = 0;
    NSLog(@"%d is a cool number", (int)timer.minutes);
    [[NSNotificationCenter defaultCenter]postNotificationName:currentRoundNotification object:nil];
    

    
}


-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
