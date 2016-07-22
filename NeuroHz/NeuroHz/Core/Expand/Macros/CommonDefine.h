//
//  CommonDefine.h
//  app框架
//
//  Created by 😄咔咔 on 16/6/1.
//  Copyright © 2016年 -LimingZou. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

#pragma mark - App Info
static inline NSString* getAppVersion()
{
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *versionNum =[infoDict objectForKey:@"CFBundleVersion"];
    NSLog(@"App version: %@", versionNum);
    return versionNum;
}

static inline NSString* getAppName()
{
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [infoDict objectForKey:@"CFBundleDisplayName"];
    NSLog(@"App name: %@", appName);
    return appName;
}

static inline NSString* getAppNameByInfoPlist()
{
    NSString *appName = NSLocalizedStringFromTable(@"CFBundleDisplayName", @"InfoPlist", nil);
    NSLog(@"App name: %@", appName);
    return appName;
}

/* 获取本机正在使用的语言  * en:英文  zh-Hans:简体中文   zh-Hant:繁体中文    ja:日本 ...... */
static inline NSString* getPreferredLanguage()
{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    
    NSLog(@"Preferred Language: %@", preferredLang);
    return preferredLang;
}

static inline NSString* getCurrentlyLanguage()
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    
    NSLog(@"currentLanguage: %@", currentLanguage);
    return currentLanguage;
}

static inline BOOL isZHHansFromCurrentlyLanguage()
{
    BOOL bResult = FALSE;
    NSString *curLauguage = getCurrentlyLanguage();
    NSString *cnLauguage = @"zh-Hans";
    if ([curLauguage compare:cnLauguage options:NSCaseInsensitiveSearch | NSNumericSearch] == NSOrderedSame)
    {
        bResult = TRUE;
    }
    
    return bResult;
}

#define CURR_LANG ([[NSLocale preferredLanguages] objectAtIndex: 0])
static inline NSString* GBLocalizedString(NSString *translation_key)
{
    NSString * string = NSLocalizedString(translation_key, nil );
    if (![CURR_LANG isEqual:@"en"] && ![CURR_LANG hasPrefix:@"zh-Hans"])
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
        NSBundle * languageBundle = [NSBundle bundleWithPath:path];
        string = [languageBundle localizedStringForKey:translation_key value:@"" table:nil];
    }
    
    return string;
}

#pragma mark - Show Alert
static inline void showAlertMessage(NSString *text, NSString *title)
{
    NSString *ok = GBLocalizedString(@"OK");
    [[[UIAlertView alloc] initWithTitle:title
                                message:text
                               delegate:nil
                      cancelButtonTitle:ok
                      otherButtonTitles:nil] show];
}


#endif /* CommonDefine_h */
