//
//  NSObject+LQObjectCategory.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LQObjectCategory)

@property (nonatomic, strong) NSDictionary *transParamsDict;

//base64
+ (NSString *)encryptionBaseOnBase64:(NSString *)str;

//md5
+ (NSString *)encryptionBaseOnMD5:(NSString *)str;
@end
