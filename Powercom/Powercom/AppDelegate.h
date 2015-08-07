//
//  AppDelegate.h
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncUdpSocket.h"


#define global ((AppDelegate *)[[UIApplication sharedApplication] delegate])


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    AsyncUdpSocket *udpSocket;
    NSTimer *timer;
    NSTimer *disconnect_timer;//斷線倒數計時
    BOOL disconnect_flag;
    long tag;
    UIAlertView *init_pop_ip;
    NSUserDefaults *userDefaults;
    
    //alert popup
    Byte Connect_pre;
    Byte UPSFail_pre;
    Byte BadBattery_pre;
    Byte OLoad_pre;
    Byte BatLow_pre;
    Byte Inv_pre;
    Byte Test_pre;
    Byte Bypass_pre;
    
    bool Notify_Flag;
    Byte Event_TF[15];
    Byte Event_01[8];
    Byte status[7];

}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) NSMutableArray *globalData;

@property (nonatomic,retain) NSArray *language_now;
@property (nonatomic,retain) NSArray *language_ch;//not yet
@property (nonatomic,retain) NSArray *language_en;
@property (nonatomic,retain) NSArray *language_it;
@property (nonatomic,retain) NSArray *language_de;
@property (nonatomic,retain) NSArray *language_fr;
@property (nonatomic,retain) NSArray *language_pr;
@property (nonatomic,retain) NSArray *language_sv;
@property (nonatomic,retain) NSArray *language_sp;
@property (nonatomic,retain) NSArray *language_ar;
@property (nonatomic,retain) NSArray *language_ru;

@property (nonatomic,assign) bool *PRO_now;
@property (nonatomic,assign) bool *SNMP_now;
@property (nonatomic,assign)long ivolt;
@property (nonatomic,assign)long ovolt;
@property (nonatomic,assign)long batbackupTime;
@property (nonatomic,assign)long load;
@property (nonatomic,assign)long batLevel;
@property (nonatomic,assign)int ifreq;
@property (nonatomic,assign)int ofreq;
@property (nonatomic,assign)int temp;
@property (nonatomic,assign)int ONLine;
@property (nonatomic,assign)int BypassAVR;
@property (nonatomic,assign)int overload;
@property (nonatomic,assign)int inv;
@property (nonatomic,assign)int batlow;
@property (nonatomic,assign)int oload;
@property (nonatomic,assign)int ups_fail;
@property (nonatomic,assign)int badBat;
@property (nonatomic,assign)int test;
@property (nonatomic,assign)int connect;

//以下為另一個區塊
@property (nonatomic,retain) NSString *IP;

@property (nonatomic,assign) bool *PRO_Quick_test;
@property (nonatomic,assign) bool *PRO_Deep_test;
@property (nonatomic,assign) bool *PRO_Cancel_test;
@property (nonatomic,assign) bool *SNMP_Quick_test;
@property (nonatomic,assign) bool *SNMP_Deep_test;
@property (nonatomic,assign) bool *SNMP_Cancel_test;

@property (nonatomic,retain) NSString *reply_password;
@property (nonatomic,assign) bool *ENABLE_Password;
@property (nonatomic,assign) bool *Password_correct;
@property (nonatomic,assign) bool *password;
@property (nonatomic,assign) bool *ENABLE_send;
@property (nonatomic,assign) bool *PC_reboot;
@property (nonatomic,assign) bool *PC_shutdown;
@property (nonatomic,assign) bool *UPS_shutdown;
@property (nonatomic,assign) bool *UPS_reboot;

@property (nonatomic,assign) bool *OUT1_ENABLE;
@property (nonatomic,assign) bool *OUT1_DISABLE;
@property (nonatomic,assign) bool *OUT2_ENABLE;
@property (nonatomic,assign) bool *OUT2_DISABLE;
@property (nonatomic,assign) bool *SNMP_OUT1_ENABLE;
@property (nonatomic,assign) bool *SNMP_OUT2_ENABLE;
@property (nonatomic,assign) bool *SNMP_outlet1_on_off;
@property (nonatomic,assign) bool *SNMP_outlet2_on_off;

//斷線倒數計時計數器
@property (nonatomic,assign) Byte disconnect_timer_counter;
//語言
@property (nonatomic,assign) int *language_now_is;


@end

