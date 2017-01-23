//
//  CWPathManager.h
//  libDemo
//
//  Created by wangcw on 2017/1/16.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWPathManager : NSObject

+ (CWPathManager *)manager;


/**
 get application directory

 @return the path of application directory
 */
- (NSString *)applicationDirectory;

- (NSString *)documentsDirectory;   //!< get documents directory path in application directory
- (NSString *)cachesDirectory;      //!< get caches directory path in application directory
- (NSString *)tempDirectory;        //!< get temp directory path in application directory

/**
 check the directory or file exist
 
 @param path the file or directory path
 @return YES if exist, else NO
 */
- (BOOL)existPath:(NSString *)path;

/**
 create directory
 
 @param directory directory to create
 @param isDirectory the path is file or directory
 @return YES if created or exist
 */
- (BOOL)createDirectory:(NSString*)directory isDirectory:(BOOL)isDirectory;
- (BOOL)createDocumentsSubDirectory:(NSString *)subDirectory;
- (BOOL)createCachesSubDirectory:(NSString *)subDirectory;
- (BOOL)createTempSubDirectory:(NSString *)subDirectory;


/**
 remove directory or path, if path is directory, recursively removed

 @param path the directory or path
 @return YES is removed succeed, else NO
 */
- (BOOL)removePath:(NSString *)path;

@end
