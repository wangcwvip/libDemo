//
//  CWEncode.m
//  libDemo
//
//  Created by wangcw on 2017/1/20.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "CWEncode.h"

@implementation CWEncode

+ (NSString *)md5String:(NSString *)value
{
    NSMutableString *md5Str = [[NSMutableString alloc] initWithString:@""];
    
    if (value)
    {
        const char *str = [value UTF8String];
        if (str == NULL) {
            str = "";
        }
        
        unsigned char r[CC_MD5_DIGEST_LENGTH];
        CC_MD5(str, (CC_LONG)strlen(str), r);
        
        for (NSInteger index = 0; index < 16; ++index) {
            [md5Str appendFormat:@"%02x", r[index]];
        }
    }
    
    return md5Str;
}

const static char UP_HEXCHAR[] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
const static char LO_HEXCHAR[] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
+ (NSString*)hexData:(NSData *)data upperCase:(BOOL)upperCase
{
    NSString *hexStr = @"";
    if (data)
    {
        NSUInteger len = [data length];
        Byte *src = (Byte*)malloc(len);
        memset(src, 0, sizeof(Byte));
        
        [data getBytes:src length:len];
        char *pszOut = (char *)malloc(len*2+1);
        for (int i=0; i< len; i++) {
            pszOut[i*2+0] = upperCase? UP_HEXCHAR[((src[i] >> 4) & 0x0f)] : LO_HEXCHAR[((src[i] >> 4) & 0x0f)];
            pszOut[i*2+1] = upperCase? UP_HEXCHAR[(src[i] & 0x0f)] : LO_HEXCHAR[(src[i] & 0x0f)];
        }
        pszOut[len*2] = '\0';
        
        hexStr = [NSString stringWithCString:pszOut encoding:NSASCIIStringEncoding];
        free(pszOut);
        free(src);
    }

    return hexStr;
}

@end
