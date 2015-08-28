//
//  AppDelegate.h
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncUdpSocket.h"
#import "BackgroundTask.h"

#define global ((AppDelegate *)[[UIApplication sharedApplication] delegate])


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    AsyncUdpSocket *udpSocket;//UDP連線使用
    NSTimer *timer;//每秒發送/接收使用的timer
    NSTimer *disconnect_timer;//斷線倒數計時
    BOOL disconnect_flag;//判斷是否斷線
    long tag;//無用處
    UIAlertView *init_pop_ip;//一開始跳出輸入ip視窗
    NSUserDefaults *userDefaults;//記憶設定
    BackgroundTask * bgTask;//讓他可以在背景跑

    
    //alert popup(記錄意外狀況的前一個狀態,藉此判斷是否需要跳出新的警告
    Byte Connect_pre;
    Byte UPSFail_pre;
    Byte BadBattery_pre;
    Byte OLoad_pre;
    Byte BatLow_pre;
    Byte Inv_pre;
    Byte Test_pre;
    Byte Bypass_pre;
    
    bool Notify_Flag;//判斷是否要跳出警告
    Byte Event_TF[15];
    Byte Event_01[8];
    Byte status[7];

}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) NSMutableArray *globalData;//可變動長度的陣列

@property (nonatomic,retain) NSArray *language_now;//目前的語言
@property (nonatomic,retain) NSArray *language_ch;//中文
@property (nonatomic,retain) NSArray *language_en;//英文
@property (nonatomic,retain) NSArray *language_it;//義大利文
@property (nonatomic,retain) NSArray *language_de;//德文
@property (nonatomic,retain) NSArray *language_fr;//法文
@property (nonatomic,retain) NSArray *language_pr;//葡萄牙文
@property (nonatomic,retain) NSArray *language_sv;//瑞典文
@property (nonatomic,retain) NSArray *language_sp;//西班牙文
@property (nonatomic,retain) NSArray *language_ar;//阿拉伯文
@property (nonatomic,retain) NSArray *language_ru;//俄文

@property (nonatomic,assign) bool *PRO_now;//目前連線是pro
@property (nonatomic,assign) bool *SNMP_now;//目前是snmp
@property (nonatomic,assign)long ivolt;//input voltage
@property (nonatomic,assign)long ovolt;//output voltage
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

@property (nonatomic,retain) NSString *IP;//連線IP

@property (nonatomic,assign) bool *PRO_Quick_test;//自我測試
@property (nonatomic,assign) bool *PRO_Deep_test;//深度電池放電測試
@property (nonatomic,assign) bool *PRO_Cancel_test;//取消測試
@property (nonatomic,assign) bool *SNMP_Quick_test;
@property (nonatomic,assign) bool *SNMP_Deep_test;
@property (nonatomic,assign) bool *SNMP_Cancel_test;

@property (nonatomic,retain) NSString *reply_password;//回傳正確密碼(nsstring)
@property (nonatomic,assign) bool *ENABLE_Password;//允許詢問正確密碼是什麼
@property (nonatomic,assign) bool *Password_correct;//判斷密碼是否正確
@property (nonatomic,assign) bool *ENABLE_send;//允許發送outlet control 指令
@property (nonatomic,assign) bool *PC_reboot;
@property (nonatomic,assign) bool *PC_shutdown;
@property (nonatomic,assign) bool *UPS_reboot;

@property (nonatomic,assign) bool *OUT1_ENABLE;//outlet 1 enable
@property (nonatomic,assign) bool *OUT1_DISABLE;
@property (nonatomic,assign) bool *OUT2_ENABLE;//outlet 2 enable
@property (nonatomic,assign) bool *OUT2_DISABLE;
@property (nonatomic,assign) bool *SNMP_OUT1_ENABLE;
@property (nonatomic,assign) bool *SNMP_OUT2_ENABLE;
@property (nonatomic,assign) bool *SNMP_outlet1_on_off;//互斥,不讓他一直在迴圈中跑
@property (nonatomic,assign) bool *SNMP_outlet2_on_off;

//斷線倒數計時計數器
@property (nonatomic,assign) Byte disconnect_timer_counter;//斷線60秒倒數計時

//連線成功通知
@property (nonatomic,assign) bool click_connect_button;//按下連線（成功會跳出connect)

//語言
@property (nonatomic,assign) int *language_now_is;//switch case 判斷現在的語言
//歷史紀錄
@property (nonatomic,retain) NSMutableArray *history_data;//可變動式陣列記錄---例外狀況（history)

@end

