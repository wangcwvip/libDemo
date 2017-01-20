//
//  CWEncrypt.h
//  libDemo
//
//  Created by wangcw on 2017/1/20.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWEncrypt : NSObject

+ (NSData *)AES256EncryptData:(NSData*)data;

+ (NSData *)AES256DecryptData:(NSData*)data;

+ (NSData *)AES256EncryptData:(NSData*)data withKey:(NSString *)key;

+ (NSData *)AES256DecryptData:(NSData*)data withKey:(NSString *)key;

@end
