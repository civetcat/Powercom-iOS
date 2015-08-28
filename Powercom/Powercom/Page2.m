//
//  SecondViewController.m
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import "Page2.h"

@interface Page2 ()

@end

@implementation Page2

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    //每次進來都會跑這個
//    NSLog(@"now is  =%d",global.language_now_is);
//    int i = global.language_now_is;
//    switch (i) {
//        case 1:
//            //chinese
//            global.language_now = global.language_ch;
//            break;
//        case 2:
//            global.language_now = [NSArray arrayWithArray:global.language_en];
//            
//            //NSLog(@"now 1 %@",global.language_now[1]);
//            //english
//            break;
//        case 3:
//            global.language_now = global.language_ru;
//            //russian
//            break;
//        case 4:
//            //arabic
//            break;
//        case 5:
//            //spanish
//            break;
//        case 6:
//            //italy
//            break;
//        case 7:
//            //deutch
//            break;
//        case 8:
//            //svenska
//            break;
//        case 9:
//            //protuga
//            break;
//        case 10:
//            //french
//            break;
//        default:
//            break;
//    }
    
    _input_volt_p2.text = global.language_now[0];
    _output_volt_p2.text = global.language_now[1];
    _load_p2.text = global.language_now[3];
    _battery_level_p2.text = global.language_now[2];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(UpdateCircle:) userInfo:nil repeats:YES];
    
    //測試
    
    
    if (global.ovolt > 50) {
        self.slider1.maximumValue = global.ovolt;
        self.slider2.maximumValue = global.ovolt;
    }
    else{
        if (global.ivolt > 50) {
            self.slider1.maximumValue = global.ivolt;
        }
        else{
            self.slider1.value = 0;
        }
        self.slider2.value = 0;
    }
    
    
    NSNumberFormatter *voltFormatter = [[NSNumberFormatter alloc] init];
    [voltFormatter setPositiveSuffix:@"V"];
    [voltFormatter setNegativeSuffix:@"V"];
    
    //self.slider1.popUpViewCornerRadius = 12.0;
    [self.slider1 setNumberFormatter:voltFormatter];
    [self.slider1 setMaxFractionDigitsDisplayed:0];
    self.slider1.popUpViewColor = [UIColor colorWithHue:0.55 saturation:0.8 brightness:0.9 alpha:0.7];
    self.slider1.font = [UIFont fontWithName:@"GillSans-Bold" size:22];
    self.slider1.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];//這邊是讓我前中後段的顏色有不同
    //[self.slider1 setPopUpViewAnimatedColors:@[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]] withPositions:@[@20,@50,@110]];
    self.slider1.textColor = [UIColor colorWithHue:0.55 saturation:1.0 brightness:0.5 alpha:1];
    [self.slider1 showPopUpViewAnimated:YES];//這一段一定要show不然他不會顯示文字出來
    
    
    //self.slider2.popUpViewCornerRadius = 12.0;
    [self.slider2 setNumberFormatter:voltFormatter];
    //[self.slider2 setMaxFractionDigitsDisplayed:0];
    self.slider2.popUpViewColor = [UIColor colorWithHue:0.55 saturation:0.8 brightness:0.9 alpha:0.7];
    self.slider2.font = [UIFont fontWithName:@"GillSans-Bold" size:22];
    self.slider2.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
    //[self.slider2 setPopUpViewAnimatedColors:@[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]] withPositions:@[@50,@100,@110]];
    self.slider2.textColor = [UIColor colorWithHue:0.55 saturation:1.0 brightness:0.5 alpha:1];
    [self.slider2 showPopUpViewAnimated:YES];
    
    
    
    //這是有％數的
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterPercentStyle];
    [self.slider3 setNumberFormatter:formatter];
    self.slider3.popUpViewAnimatedColors = @[[UIColor greenColor], [UIColor orangeColor], [UIColor redColor]];
    //[self.slide3 setPopUpViewAnimatedColors:@[coldBlue, blue, green, yellow, red]
    //                          withPositions:@[@100, @75, @50, @25, @20]];
    
    self.slider3.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:22];
    [self.slider3 showPopUpViewAnimated:YES];
    
    
    //這是有％數的
    [formatter setNumberStyle:NSNumberFormatterPercentStyle];
    [self.slider4 setNumberFormatter:formatter];
    self.slider4.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
    //[self.slide3 setPopUpViewAnimatedColors:@[coldBlue, blue, green, yellow, red]
    //                          withPositions:@[@100, @75, @50, @25, @20]];
    
    self.slider4.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:22];
    [self.slider4 showPopUpViewAnimated:YES];
    
}

- (NSString *)slider:(ASValueTrackingSlider *)slider stringForValue:(float)value;
{
    value = roundf(value);
    NSString *s;
    if (value < 30) {
        s = @"Warning!! Low Voltage";
    } else if (value > 29.0 && value < 50.0) {
        s = [NSString stringWithFormat:@"😎 %@ 😎", [slider.numberFormatter stringFromNumber:@(value)]];
    } else if (value >= 50.0) {
        s = [NSString stringWithFormat:@"%dV", value];
    }
    return s;
}

-(void)UpdateCircle:(NSTimer *)timer{
    //1-input volt , 2- output volt
    //3-Battery capacity , 4- load
    @try {
        
        if (global.ovolt > 50) {
            self.slider1.maximumValue = global.ovolt;
            self.slider2.maximumValue = global.ovolt;
            self.slider1.value = global.ivolt;
            self.slider2.value = global.ovolt;
        }
        else{
            if (global.ivolt > 50) {
                self.slider1.maximumValue = global.ivolt;
                self.slider1.value = global.ivolt;
            }
            else{
                self.slider1.value = 0;
            }
            self.slider2.value = 0;
        }
        
        
        float load_float = [[NSString stringWithFormat:@"%ld", global.load] floatValue];
        self.slider3.value = load_float/100;
        NSLog(@"Load = %f",(float)(global.load / 100));
        self.slider4.value = global.batLevel;
        //        self.progress_text1.text = [NSString stringWithFormat:@"%ldV", global.ivolt];
        //        [self.circularProgressView2 setProgress:global.ovolt];
        //        self.progress_text2.text = [NSString stringWithFormat:@"%ldV", global.ovolt];
        //
        //        [self.circularProgressView3 setProgress:((float)global.batLevel/100.0f)];
        //        self.progress_text3.text = [NSString stringWithFormat:@"%ld%%", global.batLevel];
        
        //float loading = 100.0f - (float)global.load;
        //[self.circularProgressView4 setProgress:(loading/100.0f)];
        //self.progress_text4.text = [NSString stringWithFormat:@"%ld%%", global.load];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

- (void)updatePlayOrPauseButton{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    //    [self becomeFirstResponder];
}


@end
