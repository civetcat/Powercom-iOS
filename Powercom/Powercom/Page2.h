//
//  SecondViewController.h
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASValueTrackingSlider.h"
#import "AppDelegate.h"

@interface Page2 : UIViewController

@property (weak, nonatomic) IBOutlet ASValueTrackingSlider *slider1;
@property (weak, nonatomic) IBOutlet ASValueTrackingSlider *slider2;
@property (weak, nonatomic) IBOutlet ASValueTrackingSlider *slider3;
@property (unsafe_unretained, nonatomic) IBOutlet ASValueTrackingSlider *slider4;
@property (weak, nonatomic) IBOutlet UILabel *input_volt_p2;
@property (weak, nonatomic) IBOutlet UILabel *output_volt_p2;
@property (weak, nonatomic) IBOutlet UILabel *load_p2;
@property (weak, nonatomic) IBOutlet UILabel *battery_level_p2;

@end

