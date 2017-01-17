//
//  LQBaseTableViewController.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseViewController.h"
#import "LQBaseTableView.h"

@interface LQBaseTableViewController : LQBaseViewController

@property (nonatomic, strong) LQBaseTableView *listTable;
@property (nonatomic, strong) NSMutableArray *listTableMuDataArr;

@end
