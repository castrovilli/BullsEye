//
//  ViewController.h
//  BullsEye
//
//  Created by arine on 2013. 12. 28..
//  Copyright (c) 2013년 arine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *displayTagetValue;
@property (weak, nonatomic) IBOutlet UILabel *displayScore;
@property (weak, nonatomic) IBOutlet UILabel *displayRound;

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)slider;

@end
