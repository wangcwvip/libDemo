//
//  CWEncode.h
//  libDemo
//
//  Created by wangcw on 2017/1/20.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWEncode : NSObject

+ (NSString *)md5String:(NSString *)value;

+ (NSString *)hexData:(NSData *)data upperCase:(BOOL)upperCase;

@end
