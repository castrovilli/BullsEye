//
//  ViewController.m
//  BullsEye
//
//  Created by arine on 2013. 12. 28..
//  Copyright (c) 2013년 arine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int _currentRound;
int _currentScore;
int _currentValue;
int _targetValue;

- (IBAction)sliderMoved:(UISlider *)slider {
    NSLog(@"Value: : %f", slider.value);
    
    _currentValue = lroundf(slider.value);
}

-(void) initGame
{
    _currentScore = 0;
    _currentRound = 0;
}

- (IBAction)startOverButtonClicked:(id)sender {
    
    [self initGame];
    [self startNewRound];
    
}

- (IBAction)showAlert
{
    int difference = abs(_currentValue - _targetValue);
    int scoreThisRound = 100 - difference;
    
    NSString *alertTitle;
    
    if (difference == 0) {
        alertTitle = @"Perfect!";
    }
    else if(difference < 5) {
        alertTitle = @"You almost had it!";
    }
    else if (difference < 10) {
        alertTitle = @"Pretty good!";
    }
    else {
        alertTitle = @"Not even close...";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:alertTitle
        message:[NSString stringWithFormat:@"Current value: %d\nTarget value: %d\nScore you got: %d", _currentValue, _targetValue, scoreThisRound]
        delegate:self
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
    
    _currentScore += scoreThisRound;
    
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
}

- (int)getRandomIntegerValueRangeFromOneToHundred
{
    return arc4random_uniform(100) + 1;
}

- (void)startNewRound
{
    _targetValue = [self getRandomIntegerValueRangeFromOneToHundred];
    _currentValue = 50;
    self.slider.value = _currentValue;
    
    ++_currentRound;
    
    self.displayTagetValue.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.displayRound.text = [NSString stringWithFormat:@"%d", _currentRound];
    self.displayScore.text = [NSString stringWithFormat:@"%d", _currentScore];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
    //_currentValue = _slider.value;
    _currentValue = self.slider.value;
    //_targetValue = arc4random_uniform(100) + 1;
    _targetValue = [self getRandomIntegerValueRangeFromOneToHundred];
    
    self.displayTagetValue.text = [NSString stringWithFormat:@"%d", _targetValue];
     */
    [self initGame];
    [self startNewRound];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
