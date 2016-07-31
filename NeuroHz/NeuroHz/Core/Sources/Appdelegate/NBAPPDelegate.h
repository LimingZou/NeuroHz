//
//  NBAPPDelegate.h
//  NeuroHz
//
//  Created by 😄咔咔 on 16/7/24.
//  Copyright © 2016年 Jolly-Liming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Reachability.h>

@interface NBAPPDelegate : UIResponder

@property (strong, nonatomic) UIWindow *window;


/*
 * 网络状态
 */
@property (nonatomic, assign) NetworkStatus networkStatus;

/*
 * 获取app代理
 */
+ (NBAPPDelegate *)delegate;
@end
