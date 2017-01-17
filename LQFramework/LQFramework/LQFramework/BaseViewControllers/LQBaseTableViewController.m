//
//  LQBaseTableViewController.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseTableViewController.h"

@interface LQBaseTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation LQBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.listTableMuDataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *subArr = self.listTableMuDataArr[section];
    if ([subArr isKindOfClass:[NSArray class]])
    {
        return subArr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSMutableArray *)listTableMuDataArr
{
    if (_listTableMuDataArr == nil) {
        _listTableMuDataArr = [NSMutableArray array];
    }
    return _listTableMuDataArr;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
