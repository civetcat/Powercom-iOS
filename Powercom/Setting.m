//
//  Setting.m
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import "Setting.h"
#import "Cell.h"

@interface Setting ()
{
    NSArray *recipes;
}
@end

@implementation Setting
{
    UIAlertView *popIP_message;
    UIAlertView *pop_password;
    UIAlertView *pop_double_check_warning;
    UIAlertView *pop_warning;
    int choose_number;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize table data
    list_connect = [[NSMutableArray alloc] init];
    [list_connect addObject:@"IP now"];
    [list_connect addObject:@"Connect"];
    
    list_test= [[NSMutableArray alloc] init];
    [list_test addObject:@"UPS Quick Test"];
    [list_test addObject:@"UPS Deep Test"];
    [list_test addObject:@"Cancel Deep Test"];
    
    list_language = [[NSMutableArray alloc] init];
    [list_language addObject:@"中文"];
    [list_language addObject:@"English"];
    [list_language addObject:@"ру́сский язы́к"];
    [list_language addObject:@"العَرَبِيَّة‎‎‎ "];
    [list_language addObject:@"Español"];
    [list_language addObject:@"Italiano"];
    [list_language addObject:@"Deutsch"];
    [list_language addObject:@"Svenska"];
    [list_language addObject:@"Português"];
    [list_language addObject:@"Français"];
    
    list_control = [[NSMutableArray alloc] init];
    [list_control addObject:@"Input Password"];
    [list_control addObject:@"Outlet1 Control On"];
    [list_control addObject:@"Outlet1 Control Off"];
    [list_control addObject:@"Outlet2 Control On"];
    [list_control addObject:@"Outlet2 Control Off"];
    [list_control addObject:@"PC Shutdown"];
    [list_control addObject:@"PC Reboot"];
    [list_control addObject:@"UPS Reboot"];
    
    list_history = [[NSMutableArray alloc] init];
    [list_history addObject:@"Historical Event"];
    
    
    aAlartViewController = [[AlartViewController alloc] init];
    aAlartViewController.expendAbleAlartViewDelegate = self;
    weakVC = self;
    
    pop_warning = [[UIAlertView alloc] initWithTitle:@"Warning!"
                          //上面是標題的設定
                                                    message:@"Password Neccessary"  //警告訊息內文的設定
                                                   delegate:self // 叫出AlertView之後，要給該ViewController去處理
                          
                                          cancelButtonTitle:@"OK"  //cancel按鈕文字的設定
                                          otherButtonTitles: nil]; // 其他按鈕的設定
    // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil]
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger n;
    
    switch (section) {
        case 0:
            n = [list_connect count];
            break;
        case 1:
            n = [list_test count];
            break;
        case 2:
            n = [list_language count];
            break;
        case 3:
            n = [list_control count];
            break;
        case 4:
            n = [list_history count];
            break;
    }
    
    return n;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header;
    
    switch (section) {
        case 0:
            header = @"Connect";
            break;
        case 1:
            header = @"Test";
            break;
        case 2:
            header = @"Language";
            break;
        case 3:
            header = @"Control";
            break;
        case 4:
            header = @"History";
            break;
    }
    
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell1";//對應storyboad-table view cell 裡面的identifier!
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
   
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //UIViewController *uv = [self.storyboard instantiateViewControllerWithIdentifier:@"test"];
    //[self.navigationController showDetailViewController:uv sender:self];
    
    NSLog(@"indexPath = %ld",(long)indexPath.row);
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [list_connect objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [list_test objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text = [list_language objectAtIndex:indexPath.row];
            break;
        case 3:
            
            cell.textLabel.text = [list_control objectAtIndex:indexPath.row];
            break;
        case 4:
            cell.textLabel.text = [list_history objectAtIndex:indexPath.row];
    }
    

    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"testing");
    NSLog(@"(did select) indexPath = %ld",(long)indexPath.row);
    NSLog(@"(did select) Section = %ld",(long)indexPath.section);

    //section = 大標題 0 = connect , 1 = test , 2 = language ,3 = control , 4 = history
    //indexPath = 小標題（內容） 從0開始,每個section重新歸0
    
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:// ip now
                {
                    if (global.IP != nil) {
                        UIAlertView *IP_now = [[UIAlertView alloc] initWithTitle:@"Connect to IP" message:global.IP delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                        IP_now.alertViewStyle = UIAlertViewStyleDefault;
                        [IP_now show];
                    }
                    
                }
                break;
                    
                case 1:{
                    //連線
                    selectIndex = 0;
                    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(12, 50, 260, 100)];
                    [textView setText:@""];
                    textView.tag =10;
                    popIP_message = [[UIAlertView alloc]initWithTitle:@"Input Target IP:" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Enter",nil];
                    popIP_message.alertViewStyle = UIAlertViewStylePlainTextInput;
                    [popIP_message addSubview:textView];
                    [popIP_message show];
                }
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0://quick test
                    if(global.PRO_now)
                        global.PRO_Quick_test = true;
                    if (global.SNMP_now)
                        global.SNMP_Quick_test = true;
                    break;
                case 1://deep test
                    if(global.PRO_now)
                        global.PRO_Deep_test = true;
                    if (global.SNMP_now)
                        global.SNMP_Deep_test = true;
                    break;
                case 2://cancel deep test
                    if(global.PRO_now)
                        global.PRO_Cancel_test = true;
                    if (global.SNMP_now)
                        global.SNMP_Cancel_test = true;
                    break;
            }
            break;
        case 2:
            
            global.language_now = global.language_ch;
            NSLog(@"%@",global.language_now[4]);
            
            switch (indexPath.row) {
                case 0:
                {
                    //中文
                    global.language_now_is = 1;//chinese
                    NSLog(@"%@",global.language_ch[4]);
                    global.language_now = global.language_ch;
                    break;
                }
                case 1:
                {
                    //英文
                    global.language_now_is = 2;//english
                    global.language_now = global.language_en;
                                        break;
                }
                case 2:
                {
                    //俄文
                    global.language_now_is = 3;//russian
                    global.language_now = global.language_ru;
                    break;
                }
                case 3:
                {
                    //阿拉伯文
                    global.language_now_is = 4; //arabic
                    global.language_now = global.language_ar;
                    break;
                }
                case 4:
                {
                    //西班牙文
                    global.language_now_is = 5; //spanish
                    global.language_now = global.language_sp;
                    break;
                }
                case 5:
                {
                    //義大利文
                    global.language_now_is = 6; //italy
                    global.language_now = global.language_it;
                    break;
                }
                case 6:
                {
                    //德文
                    global.language_now_is = 7; //deutch
                    global.language_now = global.language_de;
                    break;
                }
                case 7:
                {
                    //瑞典文
                    global.language_now_is = 8; //svenska
                    global.language_now = global.language_sv;
                    break;
                }
                case 8:
                {
                    //葡萄牙文
                    global.language_now_is = 9; //protguech
                    global.language_now = global.language_pr;
                    break;
                }
                case 9:
                {
                    //法文
                    global.language_now_is = 10; //french
                    global.language_now = global.language_fr;
                    break;
                }
            }
            NSLog(@"now = %d",global.language_now_is);
            //global.language_now = global.language_ch;
            NSLog(@"%@",global.language_now[4]);
            break;
        case 3:
        {

            selectIndex = 3;
            //可以的時候就要開啟flag(switcher)
            
            switch (indexPath.row) {
                case  0:
                    //輸入密碼
                    global.ENABLE_Password = true;
                    
                    if (global.Password_correct == false && global.PRO_now) {
                        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(12, 50, 260, 100)];
                        [textView setText:@""];
                        textView.tag =10;
                        pop_password = [[UIAlertView alloc]initWithTitle:@"Password:" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Enter",nil];
                        pop_password.alertViewStyle = UIAlertViewStyleSecureTextInput;
                        [pop_password addSubview:textView];
                        [pop_password show];
                        choose_number = 0;
                    }
                    break;
                case 1:
                    //Outlet1 control ON
                    if (global.PRO_now) {
                        if (global.Password_correct) {
                            
                            selectOutlet = 1;
                            pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[60] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                            pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                            [pop_double_check_warning show];
                            choose_number = 1;
                            //global.ENABLE_send = true;
                            //global.OUT1_ENABLE  = true;
                        }
                        else{
                            //跳出需要密碼
                            [pop_warning show];
                        }
                    }
                    if (global.SNMP_now) {
                        pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[60] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                        pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                        [pop_double_check_warning show];
                        
                        choose_number = 1;
//                        global.ENABLE_send = true;
//                        global.SNMP_OUT1_ENABLE = true;
//                        global.SNMP_outlet1_on_off = true;
                    }
                    break;
                case 2:
                    //Outlet1 control OFF
                    if (global.PRO_now) {
                        if (global.Password_correct) {
                            
                            selectOutlet = 2;
                            pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[61] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                            pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                            [pop_double_check_warning show];
                            
                            choose_number = 2;
//                            global.ENABLE_send = true;
//                            global.OUT1_DISABLE = true;
                        }
                        else{
                            //跳出需要密碼
                            [pop_warning show];                        }
                    }
                    if (global.SNMP_now) {
                        pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[61] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                        pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                        [pop_double_check_warning show];
                        
                        choose_number = 2;
//                        global.ENABLE_send = true;
//                        global.SNMP_OUT1_ENABLE = true;
//                        global.SNMP_outlet1_on_off = false;
                    }
                    break;
                case 3:
                    //Outlet2 control ON
                    if (global.PRO_now) {
                        if (global.Password_correct) {
                            selectOutlet = 3;
                            pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[62] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                            pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                            [pop_double_check_warning show];
                            
                            choose_number = 3;
//                            global.ENABLE_send = true;
//                            global.OUT2_ENABLE  = true;
                        }
                        else{
                            //跳出需要密碼
                            [pop_warning show];
                        }
                    }
                    if (global.SNMP_now) {
                        pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[62] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                        pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                        [pop_double_check_warning show];
                        
                        choose_number = 3;
//                        global.ENABLE_send = true;
//                        global.SNMP_OUT2_ENABLE = true;
//                        global.SNMP_outlet2_on_off = true;
                    }
                    break;
                case 4:
                    //Outlet2 control OFF
                    if (global.PRO_now) {
                        if (global.Password_correct) {
                            selectOutlet = 4;
                            pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[63] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                            pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                            [pop_double_check_warning show];
                            
                            choose_number = 4;
//                            global.ENABLE_send = true;
//                            global.OUT2_DISABLE = true;
                        }
                        else{
                            //跳出需要密碼
                            [pop_warning show];
                        }
                    }
                    if (global.SNMP_now) {
                        pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[63] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                        pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                        [pop_double_check_warning show];
                        
                        choose_number = 4;
//                        global.ENABLE_send = true;
//                        global.SNMP_OUT2_ENABLE = true;                        
//                        global.SNMP_outlet2_on_off = false;
                    }
                    break;
                case 5:
                    //PC shutdown
                    if (global.PRO_now) {
                        if (global.Password_correct) {
                            selectOutlet = 5;
                            pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[64] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                            pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                            [pop_double_check_warning show];
                            
                            choose_number = 5;
//                            global.ENABLE_send = true;
//                            global.PC_shutdown = true;
                        }
                        else{
                            //跳出需要密碼
                            [pop_warning show];
                        }
                    }
                    if (global.SNMP_now) {
                        
                    }
                    break;
                case 6:
                    //PC reboot
                    if (global.PRO_now) {
                        if (global.Password_correct) {
                            selectOutlet = 6;
                            pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[65] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                            pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                            [pop_double_check_warning show];
                            
                            choose_number = 6;
//                            global.ENABLE_send = true;
//                            global.PC_reboot = true;
                        }
                        else{
                            //跳出需要密碼
                            [pop_warning show];
                        }
                    }
                    if (global.SNMP_now) {
                        
                    }
                    break;
                case 7:
                    //UPS reboot
                    if (global.PRO_now) {
                        if (global.Password_correct) {
                            selectOutlet = 7;
                            pop_double_check_warning = [[UIAlertView alloc]initWithTitle:global.language_now[66] message:@"" delegate:self cancelButtonTitle:global.language_now[48] otherButtonTitles:global.language_now[47] ,nil];
                            pop_double_check_warning.alertViewStyle = UIAlertViewStyleDefault;
                            [pop_double_check_warning show];
                            
                            choose_number = 7;
//                            global.ENABLE_send = true;
//                            global.UPS_reboot = true;
                        }
                        else{
                            //跳出需要密碼
                            [pop_warning show];
                        }
                    }
                    if (global.SNMP_now) {
                        
                    }
                    break;
                default:
                    break;
            }
            break;
        }
        case 4:
            [self performSegueWithIdentifier:@"456" sender:self];
            break;
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    switch (buttonIndex) {

        case 1://Enter
        {
            if (selectIndex == 0) {
                //IP
                UITextField *input_ip=  [popIP_message textFieldAtIndex: 0];
                
                NSLog(@"%@",input_ip.text);
                global.IP = input_ip.text;
                global.PRO_now = true;
                global.SNMP_now = true;
                global.disconnect_timer_counter = 0;
                global.click_connect_button = true;
            }
            
            if (selectIndex == 3) {

                
                switch (choose_number) {
                    case  0:
                    {
                        //Password
                        NSString *correct_password;
                        UITextField *input_password = [pop_password textFieldAtIndex:0];
                        NSString *input_text_password = input_password.text;
                        if (global.reply_password != nil) {
                            correct_password = [NSString stringWithFormat:global.reply_password];
                        }
                        
                        //                NSLog(@"--%@--",global.reply_password);
                        //                NSLog(@"--%@--",input_password.text);
                        
                        
                        if ([input_text_password isEqual:correct_password])//password 是正確的話
                        {
                            NSLog(@"Password Correct");
                            global.Password_correct = true;
                            global.ENABLE_send = true;
                        }
                        else
                        {
                            global.Password_correct = false;
                            break;
                        }
                    }
                    break;
                        
                    case 1:
                    {
                        if (global.PRO_now) {
                            global.ENABLE_send = true;
                            global.OUT1_ENABLE  = true;
                        }
                        if (global.SNMP_now) {
                            global.ENABLE_send = true;
                            global.SNMP_OUT1_ENABLE = true;
                            global.SNMP_outlet1_on_off = true;
                        }
                    }
                        break;
                    case 2:
                    {
                        if (global.PRO_now) {
                            global.ENABLE_send = true;
                            global.OUT1_DISABLE = true;
                        }
                        if (global.SNMP_now) {
                            global.ENABLE_send = true;
                            global.SNMP_OUT1_ENABLE = true;
                            global.SNMP_outlet1_on_off = false;
                        }
                    }
                        break;
                    case 3:
                    {
                        if (global.PRO_now) {
                            global.ENABLE_send = true;
                            global.OUT2_ENABLE  = true;
                        }
                        if (global.SNMP_now) {
                            global.ENABLE_send = true;
                            global.SNMP_OUT2_ENABLE = true;
                            global.SNMP_outlet2_on_off = true;
                        }
                    }
                        break;
                    case 4:
                    {
                        if (global.PRO_now) {
                            global.ENABLE_send = true;
                            global.OUT2_DISABLE = true;
                        }
                        if (global.SNMP_now) {
                            global.ENABLE_send = true;
                            global.SNMP_OUT2_ENABLE = true;
                            global.SNMP_outlet2_on_off = false;
                        }
                    }
                        break;
                    case 5:
                        global.ENABLE_send = true;
                        global.PC_shutdown = true;
                        break;
                    case 6:
                        global.ENABLE_send = true;
                        global.PC_reboot = true;
                        break;
                    case 7:
                        global.ENABLE_send = true;
                        global.UPS_reboot = true;
                        break;
                    default:
                        break;
                }
            }
        }
            break;
            
        default:
            break;
    }
}

//分類標題
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 30.0)];
    sectionHeaderView.backgroundColor = [UIColor colorWithRed:72.0f/255.0f green:195.0f/255.0f  blue:249.0f/255.0f alpha:0.5f];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(10, 7, sectionHeaderView.frame.size.width, 25.0)];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    //headerLabel.textAlignment = NSTextAlignmentCenter;
    [headerLabel setFont:[UIFont fontWithName:nil size:19.0]];
    [sectionHeaderView addSubview:headerLabel];
    
    switch (section) {
        case 0:
            headerLabel.text = @"Connect";
            return sectionHeaderView;
            break;
        case 1:
            headerLabel.text = @"Test";
            return sectionHeaderView;
            break;
        case 2:
            headerLabel.text = @"Language";
            return sectionHeaderView;
            break;
        case 3:
            headerLabel.text = @"Control";
            return sectionHeaderView;
            break;
        case 4:
            headerLabel.text = @"History";
            return sectionHeaderView;
        default:
            break;
    }
    
    return sectionHeaderView;
}


@end
