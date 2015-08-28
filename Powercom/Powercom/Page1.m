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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    //每次進來都會跑這個
    
    NSLog(@"%@",global.language_now[4]);
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
    NSLog(@"%@",global.language_now[4]);
    self.in_volt_text.text =global.language_now[4];//5-Input Voltage (V)
    self.out_volt_text.text =global.language_now[5];//6-Output Voltage (V)
    self.load_text.text =global.language_now[6];//7-Load (%)
    self.bat_level_text.text =global.language_now[7];//8-Battery Level (%)
    self.bat_backup_time_text.text =global.language_now[8];//9-Battery Backup Time (Min)
    [self.bat_backup_time_text setNumberOfLines:2];
    self.ups_status_text.text =global.language_now[17];//18-UPS Status
    self.bat_status_text.text =global.language_now[9];//10-Battery Status
    self.power_condition_text.text =global.language_now[25];//26-Power Status
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.in_volt.text = @"";
    self.out_volt.text = @"";
    self.load.text = @"";
    self.bat_level.text = @"";
    self.bat_backup_time.text = @"";
    self.ups_status.text = @"";
    self.bat_status.text = @"";
    self.power_condition.text = @"";
    
    
    self.ivolt_image.image = [UIImage imageNamed:@"input_bk"];
    self.ovolt_image.image = [UIImage imageNamed:@"output_bk"];
    self.load_image.image = [UIImage imageNamed:@"load_bk"];
    self.bat_level_image.image = [UIImage imageNamed:@"battery_level_bk"];
    self.bat_backup_time_image.image = [UIImage imageNamed:@"time_bk"];
    self.ups_status_image.image = [UIImage imageNamed:@"wave_bk"];
    self.bat_status_image.image = [UIImage imageNamed:@"battery_status_bk"];
    self.power_condition_image.image = [UIImage imageNamed:@"power_condition_bk"];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(UpdateText:) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)UpdateText:(NSTimer *)timer{
    //更新label
    
    @try {
        
        
        if (global.IP != nil) {
            
            //第一個先看battery backup time
            if (global.batbackupTime != 0) {
                //有battery backup time
                self.power_condition.hidden = false;
                self.power_condition_image.hidden = false;
                self.power_condition_text.hidden = false;
                
                
                
                self.bat_backup_time_text.text = global.language_now[8];//9-Battery Backup Time(Min),因為是0開始所以扣1
                self.ups_status_text.text = global.language_now[17];//18-UPS Status
                self.bat_status_text.text = global.language_now[9];//10-Battery Status
                
                self.bat_backup_time_image.image = [UIImage imageNamed:@"time_blue"];
                
                NSString *BB_time = [NSString stringWithFormat:@"%@%ld",@"    ",global.batbackupTime];
                
                self.bat_backup_time.text = BB_time;//[NSString stringWithFormat:@"%ld", global.batbackupTime ] ;
                self.bat_backup_time.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                
                //電池狀態（battery status)
                if (global.badBat == 1) {
                    //battery bad
                    self.power_condition.textColor = [UIColor redColor];
                    self.bat_status.text = global.language_now[10];//11-Battery Fail
                }
                else{
                    if (global.batlow == 1) {
                        //battery low
                        self.power_condition.textColor = [UIColor redColor];
                        self.bat_status.text = global.language_now[11];//12-Battery Low
                    }
                    else{
                        if (global.inv == 1) {
                            //discharge
                            self.bat_status.textColor = [UIColor redColor];
                            self.bat_status.text = global.language_now[14];//15-Discharge
                            self.bat_status_image.image = [UIImage imageNamed:@"battery_status_discharge"];
                        
                            self.power_condition.textColor = [UIColor redColor];
                            self.power_condition.text = global.language_now[26];//27-Utility Power
                            self.power_condition_image.image = [UIImage imageNamed:@"power_condition_red"];
                        }
                        else{
                            if (global.test == 1) {
                                //test
                                self.bat_status.text = global.language_now[15];//16-Battery Test
                                self.bat_status.textColor = [UIColor colorWithRed:148.0f/255.0f green:255.0f/255.0f  blue:64.0f/255.0f alpha:1.0f];
                                self.bat_status_image.image = [UIImage imageNamed:@"battery_status_green"];
                            }
                            else{
                                self.bat_status.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                                self.bat_status.text = global.language_now[22];//23-Normal
                                self.bat_status_image.image = [UIImage imageNamed:@"battery_status_blue"];
                            }
                            //不管有沒有test 都要顯示
                            self.power_condition.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                            self.power_condition.text = global.language_now[26];//27-Utility  Power
                            self.power_condition_image.image = [UIImage imageNamed:@"power_condition_blue"];
                            //PowerCondition.setTextColor(Color.rgb(24, 116, 205));
                        }
                    }
                }
                
                // UPS Status
                if (global.ups_fail == 1)// UPS Fail
                {
                    //UPS_Status.setTextColor(Color.RED);
                    //UPS_Status.setText(MainActivity.Language_content[20]);// "UPS Failed"+ space
                    //ups_status_image.setImageResource(R.drawable.ups_status_failed);
                    self.ups_status.textColor = [UIColor redColor];
                    self.ups_status_image.image = [UIImage imageNamed:@"ups_status_fail"];
                    self.ups_status.text = global.language_now[18];//19-UPS Fail
                }
                else {
                    if (global.overload == 1)// Overload
                    {
                        //ups_status_image.setImageResource(R.drawable.ups_status_overload);
                        self.ups_status.textColor = [UIColor redColor];
                        self.ups_status_image.image = [UIImage imageNamed:@"ups_status_overload"];
                        self.ups_status.text = global.language_now[19];//20-UPS Overload
                    }
                    else {
                        if (global.inv == 1)// Inv = 1 - Battery Power
                        {
                            
                            //ups_status_image.setImageResource(R.drawable.ups_status_battery_power);
                            //圖檔
                            self.ups_status_image.image = [UIImage imageNamed:@"ups_status_battery"];
                            self.ups_status.textColor = [UIColor redColor];
                            self.ups_status.text = global.language_now[27];//28-Battery Power
                        }
                        else {
                            if (global.BypassAVR != 0) {
                                //                        UPS_Status.setTextColor(Color.rgb(78, 238, 148));
                                switch (global.BypassAVR)
                                {// 1 or 2 or 3
                                    case 1:
                                        // ups_status_image.setImageResource(R.drawable.up)
                                        self.ups_status.text = global.language_now[21];//22-Bypass
                                        
                                        break;
                                    case 2:
                                        self.ups_status.text = global.language_now[23];//24-AVR Boost
                                        self.ups_status_image.image = [UIImage imageNamed:@"AVR_boost"];
                                        self.ups_status.textColor = [UIColor colorWithRed:148.0f/255.0f green:200.0f/255.0f  blue:64.0f/255.0f alpha:1.0f];
                                        break;
                                    case 3:
                                        //ups_status_image.setImageResource(R.drawable.ups_status_buck);
                                        self.ups_status.text = global.language_now[24];//25-AVR Buck
                                        self.ups_status_image.image = [UIImage imageNamed:@"AVR_buck"];
                                        self.ups_status.textColor = [UIColor redColor];
                                        break;
                                }
                            }
                            else {
                                // on off line
                                //UPS_Status.setTextColor(Color.rgb(24, 116, 205));
                                if (global.ONLine == 0)
                                {
                                    self.ups_status.text = global.language_now[20];//21-on line
                                    self.ups_status.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                                    self.ups_status_image.image = [UIImage imageNamed:@"wave_blue"];
                                }
                                if (global.ONLine == 1)
                                    self.ups_status.text = global.language_now[22];//23-Normal
                                self.ups_status_image.image = [UIImage imageNamed:@"wave_blue"];
                            }
                        }
                    }
                }
                
                self.in_volt.text = [NSString stringWithFormat:@"%ld", global.ivolt];
                self.out_volt.text = [NSString stringWithFormat:@"%ld",global.ovolt];
                self.load.text = [NSString stringWithFormat:@"%ld",global.load];
                self.bat_level.text = [NSString stringWithFormat:@"%ld",global.batLevel];
                
                if (global.ivolt > 0) {
                    self.in_volt.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                    self.ivolt_image.image = [UIImage imageNamed:@"input_blue"];
                }
                else{
                    self.in_volt.textColor = [UIColor redColor];
                    self.ivolt_image.image = [UIImage imageNamed:@"input_red"];
                }
                
                if (global.ovolt > 0) {
                    self.out_volt.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                    self.ovolt_image.image = [UIImage imageNamed:@"output_blue"];
                }
                else{
                    self.out_volt.textColor = [UIColor redColor];
                    self.ovolt_image.image = [UIImage imageNamed:@"output_red"];
                }
                
                if (global.load < 70) {
                    self.load.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                    self.load_image.image = [UIImage imageNamed:@"load_blue"];
                }
                else{
                    self.load.textColor = [UIColor redColor];
                    self.load_image.image = [UIImage imageNamed:@"load_red"];
                }
                
                if (global.batLevel > 50) {
                    self.bat_level.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                    self.bat_level_image.image = [UIImage imageNamed:@"battery_level_blue"];
                }
                else if (global.batLevel > 30){
                    self.bat_level_image.image = [UIImage imageNamed:@"battery_level_yellow"];
                }
                else{
                    self.bat_level.textColor = [UIColor redColor];
                    self.bat_level_image.image = [UIImage imageNamed:@"battery_level_red"];
                }
                
            }
            else
            {
                //沒有battery backup time
                self.power_condition.hidden = true;
                self.power_condition_image.hidden = true;
                self.power_condition_text.hidden = true;
                //ups status => Battery backup time (battery backuptime的位子放ups status
                //Battery Status => ups status
                //Power condition => battery Status
                self.bat_backup_time_text.text = global.language_now[17];//18-UPS Status
                self.ups_status_text.text = global.language_now[9];//10-Battery Status
                self.bat_status_text.text = global.language_now[25];//26-Power Status
                
                //Battery Status => ups status(ups status位子放battery status)
                //電池狀態（battery status)
                if (global.badBat == 1) {
                    //battery bad
                    //Power condition => battery Status
                    self.ups_status.textColor = [UIColor redColor];
                    //power condition
                    self.ups_status.text = global.language_now[10];//(battery status)  11-Battery Fail
                }
                else{
                    if (global.batlow == 1) {
                        //battery low
                        //Power condition => battery Status
                        self.ups_status.textColor = [UIColor redColor];
                        self.ups_status.text = global.language_now[11];//(battery status) 12-Battery Low
                    }
                    else{
                        if (global.inv == 1) {
                            //discharge
                            self.ups_status.textColor = [UIColor redColor];
                            self.ups_status.text = global.language_now[14];//(battery status) 15-Discharge
                            self.ups_status_image.image = [UIImage imageNamed:@"battery_status_discharge"];
                            //Power condition => battery Status
                            self.bat_status.textColor = [UIColor redColor];
                            self.bat_status.text = global.language_now[26];//(power condition) 27-Utility Power
                            self.bat_status_image.image = [UIImage imageNamed:@"power_condition_red"];
                        }
                        else{
                            if (global.test == 1) {
                                //test
                                self.ups_status.text = global.language_now[28];//(battery status) 29-Battery Test
                                self.ups_status_image.image = [UIImage imageNamed:@"wave_green"];
                                self.ups_status.textColor = [UIColor colorWithRed:148.0f/255.0f green:200.0f/255.0f  blue:64.0f/255.0f alpha:1.0f];
                            }
                            else{
                                self.ups_status.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                                self.ups_status_image.image = [UIImage imageNamed:@"wave_blue"];
                                self.ups_status.text = global.language_now[12];//13-Normal
                            }
                            //不管有沒有test 都要顯示
                            //Power condition => battery Status
                            self.bat_status.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                            self.bat_status.text = global.language_now[26];//27-Utility Power
                            self.bat_status_image.image = [UIImage imageNamed:@"power_condition_blue"];
                            //PowerCondition.setTextColor(Color.rgb(24, 116, 205));
                        }
                    }
                }
                
                //ups status => Battery backup time
                // UPS Status
                if (global.ups_fail == 1)// UPS Fail
                {
                    self.bat_backup_time.textColor = [UIColor redColor];
                    self.bat_status_image.image = [UIImage imageNamed:@"ups_status_fail"];
                    self.bat_backup_time.text = global.language_now[18];//19-UPS Fail
                }
                else {
                    if (global.overload == 1)// Overload
                    {
                        // ups_status_image.setImageResource(R.drawable.ups_status_overload);
                        self.bat_backup_time.textColor = [UIColor redColor];
                        self.bat_status_image.image = [UIImage imageNamed:@"ups_status_overload"];
                        self.bat_backup_time.text = global.language_now[19];//20-UPS Overload
                    }
                    else {
                        if (global.inv == 1)// Inv = 1 - Battery Power
                        {
                            
                            //ups_status_image.setImageResource(R.drawable.ups_status_battery_power);
                            //圖檔
                            self.bat_backup_time_image.image = [UIImage imageNamed:@"ups_status_battery"];
                            self.bat_backup_time.textColor = [UIColor redColor];
                            self.bat_backup_time.text = global.language_now[27];//28-Battery Power
                        }
                        else {
                            if (global.BypassAVR != 0) {
                                //                        UPS_Status.setTextColor(Color.rgb(78, 238, 148));
                                switch (global.BypassAVR)
                                {// 1 or 2 or 3
                                    case 1:
                                        // ups_status_image.setImageResource(R.drawable.up)
                                        self.bat_backup_time.text = global.language_now[21];//22-Bypass
                                        break;
                                    case 2:
                                        //ups_status_image.setImageResource(R.drawable.ups_status_boost);
                                        self.bat_backup_time_image.image = [UIImage imageNamed:@"AVR_boost"];
                                        self.bat_backup_time.text = global.language_now[23];//24-AVR Boost
                                        self.bat_backup_time.textColor = [UIColor colorWithRed:148.0f/255.0f green:200.0f/255.0f  blue:64.0f/255.0f alpha:1.0f];
                                        break;
                                    case 3:
                                        //ups_status_image.setImageResource(R.drawable.ups_status_buck);
                                        self.bat_backup_time.text = global.language_now[24];//25-AVR Buck
                                        self.bat_backup_time_image.image = [UIImage imageNamed:@"AVR_buck"];
                                        break;
                                }
                            }
                            else {
                                // on off line
                                //UPS_Status.setTextColor(Color.rgb(24, 116, 205));
                                if (global.ONLine == 0)
                                {
                                    self.bat_backup_time.text = global.language_now[20];//21 on line
                                    self.bat_backup_time.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                                    self.bat_backup_time_image.image = [UIImage imageNamed:@"time_blue"];
                                    
                                }
                                if (global.ONLine == 1)
                                    self.bat_backup_time.text = global.language_now[22];//23-normal
                                self.bat_backup_time_image.image = [UIImage imageNamed:@"time_blue"];
                            }
                        }
                    }
                }
                
                self.in_volt.text = [NSString stringWithFormat:@"%ld", global.ivolt];
                self.out_volt.text = [NSString stringWithFormat:@"%ld",global.ovolt];
                self.load.text = [NSString stringWithFormat:@"%ld",global.load];
                self.bat_level.text = [NSString stringWithFormat:@"%ld",global.batLevel];
                
                if (global.ivolt > 0) {
                    self.in_volt.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                    self.ivolt_image.image = [UIImage imageNamed:@"input_blue"];
                }
                else{
                    self.in_volt.textColor = [UIColor redColor];
                    self.ivolt_image.image = [UIImage imageNamed:@"input_red"];
                }
                
                if (global.ovolt > 0) {
                    self.out_volt.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                    self.ovolt_image.image = [UIImage imageNamed:@"output_blue"];
                }
                else{
                    self.out_volt.textColor = [UIColor redColor];
                    self.ovolt_image.image = [UIImage imageNamed:@"output_red"];
                }
                
                if (global.load < 70) {
                    self.load.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                    self.load_image.image = [UIImage imageNamed:@"load_blue"];
                }
                else{
                    self.load.textColor = [UIColor redColor];
                    self.load_image.image = [UIImage imageNamed:@"load_red"];
                }
                
                if (global.batLevel > 30) {
                    self.bat_level.textColor = [UIColor colorWithRed:24.0f/255.0f green:116.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
                    self.bat_level_image.image = [UIImage imageNamed:@"battery_level_blue"];
                }
                else{
                    self.bat_level.textColor = [UIColor redColor];
                    self.bat_level_image.image = [UIImage imageNamed:@"battery_level_red"];
                }
                
            }
            
            
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}


@end
