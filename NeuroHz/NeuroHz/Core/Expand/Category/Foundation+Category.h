//
//  Foundation+Category.h
//  Universal
//
//  Created by julius on 14/11/28.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foundation_Category : NSObject

@end

#pragma mark -
#pragma mark - NSDictionary

@interface NSDictionary (Helper)

- (id)kObjectForKey:(id)aKey;

@end

@interface NSMutableDictionary (Helper)

- (void)kSetObject:(id)obj forKey:(id)key;

@end

#pragma mark -
#pragma mark - NSString

@interface NSString (Helper)
//MD5
+ (NSString *)md5:(NSString *)str;
- (NSString *)MD5;
/**
 需要特别编码
 */
+ (NSString *)utf8ToUnicode:(NSString *)string;

@end