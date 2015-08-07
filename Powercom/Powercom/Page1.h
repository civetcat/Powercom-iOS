//
//  FirstViewController.h
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface Page1: UIViewController

@property (weak, nonatomic) IBOutlet UILabel *in_volt;
@property (weak, nonatomic) IBOutlet UILabel *out_volt;
@property (weak, nonatomic) IBOutlet UILabel *load;
@property (weak, nonatomic) IBOutlet UILabel *bat_level;
@property (weak, nonatomic) IBOutlet UILabel *bat_backup_time;
@property (weak, nonatomic) IBOutlet UILabel *ups_status;
@property (weak, nonatomic) IBOutlet UILabel *bat_status;
@property (weak, nonatomic) IBOutlet UILabel *power_condition;

@property (weak, nonatomic) IBOutlet UILabel *in_volt_text;
@property (weak, nonatomic) IBOutlet UILabel *out_volt_text;
@property (weak, nonatomic) IBOutlet UILabel *load_text;
@property (weak, nonatomic) IBOutlet UILabel *bat_level_text;
@property (weak, nonatomic) IBOutlet UILabel *bat_backup_time_text;
@property (weak, nonatomic) IBOutlet UILabel *ups_status_text;
@property (weak, nonatomic) IBOutlet UILabel *bat_status_text;
@property (weak, nonatomic) IBOutlet UILabel *power_condition_text;

@property (weak, nonatomic) IBOutlet UIImageView *ivolt_image;
@property (weak, nonatomic) IBOutlet UIImageView *ovolt_image;
@property (weak, nonatomic) IBOutlet UIImageView *load_image;
@property (weak, nonatomic) IBOutlet UIImageView *bat_level_image;
@property (weak, nonatomic) IBOutlet UIImageView *bat_backup_time_image;
@property (weak, nonatomic) IBOutlet UIImageView *ups_status_image;
@property (weak, nonatomic) IBOutlet UIImageView *bat_status_image;
@property (weak, nonatomic) IBOutlet UIImageView *power_condition_image;

@end

