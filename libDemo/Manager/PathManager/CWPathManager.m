//
//  CWPathManager.m
//  libDemo
//
//  Created by wangcw on 2017/1/16.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import "CWPathManager.h"

@implementation CWPathManager

+ (CWPathManager *)manager
{
    static CWPathManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[CWPathManager alloc] init];
        
    });
    
    return sharedInstance;
}

#pragma mark -- Get Directory

- (NSString *)applicationDirectory
{
    return NSHomeDirectory();
}

- (NSString *)documentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)cachesDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)tempDirectory
{
    return NSTemporaryDirectory();
}

#pragma mark -- Check Method

- (BOOL)existPath:(NSString *)path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

#pragma mark -- Create Directory

- (BOOL)createDocumentsSubDirectory:(NSString *)subDirectory
{
    NSString *directory = [self documentsDirectory];
    directory = [directory stringByAppendingPathComponent:subDirectory];
    
    return [self createDirectory:directory isDirectory:YES];
}

- (BOOL)createCachesSubDirectory:(NSString *)subDirectory
{
    NSString *directory = [self cachesDirectory];
    directory = [directory stringByAppendingPathComponent:subDirectory];
    
    return [self createDirectory:directory isDirectory:YES];
}

- (BOOL)createTempSubDirectory:(NSString *)subDirectory
{
    NSString *directory = [self tempDirectory];
    directory = [directory stringByAppendingPathComponent:subDirectory];
    
    return [self createDirectory:directory isDirectory:YES];
}

- (BOOL)createDirectory:(NSString*)directory isDirectory:(BOOL)isDirectory
{
    if (isDirectory)
    {
        directory = [directory stringByDeletingLastPathComponent];
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:directory])
    {
        return [fileManager createDirectoryAtPath:directory
                      withIntermediateDirectories:YES
                                       attributes:nil
                                            error:NULL];
    }

    return YES;
}

#pragma mark -- Remove Method

- (BOOL)removePath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path])
    {
        NSError *error;
        return [fileManager removeItemAtPath:path error:&error];
    }
    
    return YES;
}

@end
