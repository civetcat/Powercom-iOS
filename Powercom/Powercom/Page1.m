//
//  FirstViewController.m
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import "Page1.h"

@interface Page1 ()

@end

@implementation Page1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Page1");
    
    //每次進來都會跑這個
    NSLog(@"now is  =%d",global.language_now_is);
    int i = global.language_now_is;
    switch (i) {
        case 1:
            //chinese
            global.language_now = global.language_ch;
            break;
        case 2:
            global.language_now = [NSArray arrayWithArray:global.language_en];
            
            //NSLog(@"now 1 %@",global.language_now[1]);
            //english
            break;
        case 3:
            global.language_now = global.language_ru;
            //russian
            break;
        case 4:
            //arabic
            break;
        case 5:
            //spanish
            break;
        case 6:
            //italy
            break;
        case 7:
            //deutch
            break;
        case 8:
            //svenska
            break;
        case 9:
            //protuga
            break;
        case 10:
            //french
            break;
        default:
            break;
    }
    self.in_volt_text.text = global.language_now[4];//5-Input Voltage (V)
    self.out_volt_text.text = global.language_now[5];//6-Output Voltage (V)
    self.load_text.text =global.language_now[6];//7-Load (%)
    self.bat_level_text.text =global.language_now[7];//8-Battery Level (%)
    self.bat_backup_time_text.text =global.language_now[8];//9-Battery Backup Time (Min)
    [self.bat_backup_time_text setNumberOfLines:2];
    self.ups_status_text.text =global.language_now[17];//18-UPS Status
    self.bat_status_text.text =global.language_now[9];//10-Battery Status
    self.power_condition_text.text =global.language_now[25];//26-Power Status
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
