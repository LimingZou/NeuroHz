//
//  NBAPPDelegate.h
//  NeuroHz
//
//  Created by 😄咔咔 on 16/7/24.
//  Copyright © 2016年 Jolly-Liming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Reachability.h>
#import "SUPlayerManager.h"
#import "UserInfo.h"
@interface NBAPPDelegate : UIResponder

@property (strong, nonatomic) UIWindow *window;


/*
 * 用户信息
 */
@property (nonatomic, strong) UserInfo * userInfo;

/*
 * 播放器类
 */
@property (nonatomic, strong) SUPlayerManager * player;

/*
 * 播放界面
 */
@property (nonatomic, strong) UIViewController * playView;

/*
 * 网络状态
 */
@property (nonatomic, assign) NetworkStatus networkStatus;

/*
 * 获取app代理
 */
+ (NBAPPDelegate *)delegate;

/*
 * 更新NowPlayingCenter
 */
- (void)configNowPlayingCenter;
@end
