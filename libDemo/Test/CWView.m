//
//  CWView.m
//  libDemo
//
//  Created by wangcw on 2017/1/20.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import "CWView.h"

@implementation CWView

+ (UIImage *)imageWithImage:(UIImage *)image tintColor:(UIColor *)tintColor
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = (CGRect){ CGPointZero, image.size };
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    [image drawInRect:rect];
    
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    [tintColor setFill];
    CGContextFillRect(context, rect);
    
    UIImage *imageTinted  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageTinted;
    
    NSCalendar *fk;
}


@end
