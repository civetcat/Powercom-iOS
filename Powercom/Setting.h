//
//  Setting.h
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Setting : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *list_connect;
    NSMutableArray *list_test;
    NSMutableArray *list_history;
    NSMutableArray *list_language;
    NSMutableArray *list_control;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
