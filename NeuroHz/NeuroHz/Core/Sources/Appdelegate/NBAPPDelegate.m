//
//  NBAPPDelegate.m
//  NeuroHz
//
//  Created by 😄咔咔 on 16/7/24.
//  Copyright © 2016年 Jolly-Liming. All rights reserved.
//

#import "NBAPPDelegate.h"
#import "DWTabBarController.h"

@interface NBAPPDelegate ()

@end

@implementation NBAPPDelegate

+ (NBAPPDelegate *)delegate {
    return [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化窗口、设置根目录
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    DWTabBarController * homeVC = [[DWTabBarController alloc]init];
    self.window.rootViewController = homeVC;
    [self.window makeKeyAndVisible];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

#pragma mark - network
- (void)setNetworkStatus:(NetworkStatus)networkStatus {
    if (_networkStatus != networkStatus) {
        _networkStatus = networkStatus;
        SendNotify(NETWORKSTATUSCHANGE, nil)
    }else {
        _networkStatus = networkStatus;
    }
}

@end
