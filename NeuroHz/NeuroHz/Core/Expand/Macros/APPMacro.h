//
//  APPMacro.h
//  Universal
//
//  Created by julius on 14/11/28.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#ifndef Universal_APPMacro_h
#define Universal_APPMacro_h


#define NoticDefaultCenter                  [NSNotificationCenter defaultCenter]
#define ApplicationDelegate                 ((ZGAppDelegate *)[[UIApplication sharedApplication] delegate])
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define SharedApplication                   [UIApplication sharedApplication]
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]
#define ScreenRect                          [[UIScreen mainScreen] bounds]
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewHeight                      self.view.bounds.size.height
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define StatusBarHeight                     [UIApplication sharedApplication].statusBarFrame.size.height
#define SelfDefaultToolbarHeight            self.navigationController.navigationBar.frame.size.height
#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define ISIOS7LATER                         !(IOSVersion < 7.0)


#define TabBarHeight                        49.0f
#define NaviBarHeight                       44.0f

#define ViewCtrlTopBarHeight                (ISIOS7LATER ? (NaviBarHeight + StatusBarHeight) : NaviBarHeight)
#define IsUseIOS7SystemSwipeGoBack          (ISIOS7LATER ? YES : NO)

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1536,2048), [[UIScreen mainScreen] currentMode].size) : NO)

#define ZGRect(x,y,w,h) (iPhone5 ? CGRectMake(x,y+88,w,h) : CGRectMake(x,y,w,h))
#define ZGPoint(x,y) (iPhone5 ? CGPointMake(x,y+88) : CGPointMake(x,y))

#endif
