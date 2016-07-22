//
//  SuDefine.h
//  NewsReader
//
//  Created by KevinSu on 15/10/15.
//  Copyright (c) 2015年 KevinSu. All rights reserved.
//

#ifndef NewsReader_SuDefine_h
#define NewsReader_SuDefine_h

#if DEV

# define SuLog(fmt, ...) NSLog((@"😊😊😊😊[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#elif TEST

#define SuLog(format, ...) NSLog(@"%s: %@", __PRETTY_FUNCTION__,[NSString stringWithFormat:format, ## __VA_ARGS__]);

#elif PRE

#define SuLog(format, ...) NSLog(format, ## __VA_ARGS__)

#else

#define SuLog(format, ...)

#endif

// 日志输出宏
#define BASE_LOG(cls,sel) SuLog(@"%@ -> %@",NSStringFromClass(cls), NSStringFromSelector(sel))
#define BASE_ERROR_LOG(cls,sel,error) SuLog(@"ERROR:%@ -> %@ -> %@",NSStringFromClass(cls), NSStringFromSelector(sel), error)
#define BASE_INFO_LOG(cls,sel,info) SuLog(@"INFO:%@ -> %@ -> %@",NSStringFromClass(cls), NSStringFromSelector(sel), info)

// 日志输出函数
#if DEBUG
#define BASE_LOG_FUN()         BASE_LOG([self class], _cmd)
#define BASE_ERROR_FUN(error)  BASE_ERROR_LOG([self class],_cmd,error)
#define BASE_INFO_FUN(info)    BASE_INFO_LOG([self class],_cmd,info)
#else
#define BASE_LOG_FUN()
#define BASE_ERROR_FUN(error)
#define BASE_INFO_FUN(info)
#endif

// 设备类型判断

#define ScreenW    ([[UIScreen mainScreen] bounds].size.width)
#define ScreenH    ([[UIScreen mainScreen] bounds].size.height)
#define ScreenMaxL (MAX(ScreenW, ScreenH))
#define ScreenMinL (MIN(ScreenW, ScreenH))
#define ScreenB    [[UIScreen mainScreen] bounds]

#define IsiPhone4   (IsiPhone && ScreenMaxL < 568.0)
#define IsiPhone5   (IsiPhone && ScreenMaxL == 568.0)
#define IsiPhone6   (IsiPhone && ScreenMaxL == 667.0)
#define IsiPhone6P  (IsiPhone && ScreenMaxL == 736.0)
#define IsiPad      (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsiPhone    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IsRetain    ([[UIScreen mainScreen] scale] >= 2.0)


// 消息通知
#define RegisterNotify(_name, _selector)                    \
[[NSNotificationCenter defaultCenter] addObserver:self  \
selector:_selector name:_name object:nil];

#define RemoveNofify            \
[[NSNotificationCenter defaultCenter] removeObserver:self];

#define SendNotify(_name, _object)  \
[[NSNotificationCenter defaultCenter] postNotificationName:_name object:_object];

// 设置颜色值
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define BaseColor       RGBColor(0,170,86)
#define ClearColor      [UIColor clearColor]
#define WhiteColor      [UIColor whiteColor]
#define BlackColor      [UIColor blackColor]
#define BlueColor       [UIColor blueColor]

// 文件缓存路径
#define RootPath            @"Library/.SUMusic"
#define ArchiverFile        @"SuMusic.archiver"
#define DBFile              @"SuMusic.db"
#define OffLineFile         @"OffLine"

//用户信息
#define UserLogin     @"userIsLogin"
#define UserLauch     @"appIsJustLauch"
#define isFirstOpen   @"appFirstOpen"
#define isFlowUsable   @"appCanUseFlow"

//网络相关
#define NetResult           @"r"
#define NetOk               0
#define NetSong             @"song"
#define NetChannel          @"channels"
#define RequestTimeout      8

//网络变化
#define NetworkEnable  @"NetworkIsReachability"
#define NetworkDisable @"NetworkIsNotReachability"

//通知
#define NETWORKSTATUSCHANGE @"NetworkStatusChange"
#define LOGINSTATUSCHANGE     @"LoginStatusChange"
#define SONGPLAYSTATUSCHANGE @"SongPlayStatusChange"
#define PLAYMODECHANGE @"On/OffLineSongPlay"
#define REFRESHSONGLIST @"RefreshSongList"

//频道
#define DEFAULTCHANNEL [ChannelInfo infoFromDict:@{@"abbr_en":@"My", @"channel_id":@"0", @"name":@"私人频道", @"name_en":@"Personal Radio", @"seq_id":@"0"}]
#define OFFLINECHANNEL [ChannelInfo infoFromDict:@{@"abbr_en":@"OffLine", @"channel_id":@"666", @"name":@"我的离线", @"name_en":@"My OffLine", @"seq_id":@"666"}]


//默认图片
#define DefaultImg [UIImage imageNamed:@"cover"]

//弱引用
#define WEAKSELF __weak __typeof(self) weakSelf = self;

// iOS系统版本
#define Is_iOS_9_Later      [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0
#define Is_iOS_8_Later      [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
#define Is_iOS_7_Later      [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0

#endif
