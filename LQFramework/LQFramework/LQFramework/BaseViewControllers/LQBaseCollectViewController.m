//
//  LQBaseCollectViewController.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseCollectViewController.h"

@interface LQBaseCollectViewController ()

@end

@implementation LQBaseCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.lqCollectMuDataArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *subArr = self.lqCollectMuDataArr[section];
    if ([subArr isKindOfClass:[NSArray class]])
    {
        return subArr.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSMutableArray *)lqCollectMuDataArr
{
    if (_lqCollectMuDataArr == nil) {
        _lqCollectMuDataArr = [NSMutableArray array];
    }
    return _lqCollectMuDataArr;
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
