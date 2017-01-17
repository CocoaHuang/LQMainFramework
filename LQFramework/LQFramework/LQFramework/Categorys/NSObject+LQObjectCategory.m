//
//  NSObject+LQObjectCategory.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "NSObject+LQObjectCategory.h"
#import <CommonCrypto/CommonCrypto.h>


@implementation NSObject (LQObjectCategory)


////利用静态变量地址唯一不变的特性 （提供指针）
//1、static void *strKey = &strKey;
//
//2、static NSString *strKey = @"strKey";
//
//3、static char strKey;


//object : 需要设置关联对象的对象, id类型
//key : 关联对象的key, const void *类型 (详细请看下文第4点)
//value : 关联对象的值, id类型
//policy : 关联对象的策略, objc_AssociationPolicy类型

//static const void *msgDictKey = "msgDictKey";
/**
 *  1
 *
 */

- (void)setTransParamsDict:(NSDictionary *)transParamsDict
{
    objc_setAssociatedObject(self, @selector(transParamsDict), transParamsDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)transParamsDict
{
    return objc_getAssociatedObject(self, @selector(transParamsDict));
}


//base64
+ (NSString *)encryptionBaseOnBase64:(NSString *)str
{
    NSData *dataStr = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64Encoded = [dataStr base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64Encoded;
}

//md5
+ (NSString *)encryptionBaseOnMD5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}


/**
 *  2
 */
//- (void)setMsgDict:(NSDictionary *)msgDict
//{
//    objc_setAssociatedObject(self, _cmd, msgDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//
//- (NSDictionary *)msgDict
//{
//    return objc_getAssociatedObject(self, _cmd);
//}


/**
 *  3
 */
//static const void *msgDictKey = "msgDictKey";
//- (void)setMsgDict:(NSDictionary *)msgDict
//{
//    objc_setAssociatedObject(self, msgDictKey, msgDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//
//- (NSDictionary *)msgDict
//{
//    return objc_getAssociatedObject(self, msgDictKey);
//}



@end
