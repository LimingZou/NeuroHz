//
//  Foundation+Category.m
//  Universal
//
//  Created by julius on 14/11/28.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "Foundation+Category.h"
#import <CommonCrypto/CommonHMAC.h>
//#import <stdint.h>

@implementation Foundation_Category

@end

#pragma mark -
#pragma mark - NSDictionary
@implementation NSDictionary (Helper)

- (id)kObjectForKey:(id)aKey{
    id obj = [self objectForKey:aKey];
    if (obj) {
        return obj;
    }
    return @"";
}

@end

@implementation NSMutableDictionary (Helper)

- (void)kSetObject:(id)obj forKey:(id)key{
    if (obj) {
        [self setObject:obj forKey:key];
    }else{
        [self setObject:@"" forKey:key];
    }
}

@end


#pragma mark -
#pragma mark - NSString
@implementation NSString (Helper)

//MD5
+ (NSString *)md5:(NSString *)str {
    if (str == nil) {
        return nil;
    }
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)MD5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}



+(NSString *) utf8ToUnicode:(NSString *)string
{
    NSUInteger length = [string length];
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++)
    {
        unichar _char = [string characterAtIndex:i];
        //判断是否为英文和数字
        if (_char <= '9' && _char >='0')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }
        else if(_char >='a' && _char <= 'z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
            
        }
        else if(_char >='A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
            
        }
        else
        {
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
        }
    }
    return s;
}


@end

@implementation NSMutableString(Helper)



@end


