//
//  Setting.h
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AlartViewController.h"

@interface Setting : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    AlartViewController *aAlartViewController;
    __weak UIViewController *weakVC;
    //跳出動畫的警告視窗
    NSMutableArray *list_connect;
    NSMutableArray *list_test;
    NSMutableArray *list_history;
    NSMutableArray *list_language;
    NSMutableArray *list_control;
    int selectIndex;
    int selectOutlet;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic,retain) NSIndexPath *selectIndex;


@end
