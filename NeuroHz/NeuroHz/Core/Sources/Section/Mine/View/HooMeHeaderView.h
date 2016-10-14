//
//  HooMeHeaderView.h
//  xiu8iOS
//
//  Created by Scarecrow on 15/9/19.
//  Copyright (c) 2015年 xiu8. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HooMeHeaderViewButtonType) {
    HooMeHeaderViewButtonTypeLogin,
    HooMeHeaderViewButtonTypeRegister,
    HooMeHeaderViewButtonTypeHistory,
    HooMeHeaderViewButtonTypeAttention,
    HooMeHeaderViewButtonTypeGuard
};


@protocol HooMeHeaderViewDelegate <NSObject>

- (void)HooMeHeaderViewBtnClicked:(HooMeHeaderViewButtonType)type;

@end

@interface HooMeHeaderView : UIView
@property (nonatomic,weak) id<HooMeHeaderViewDelegate> delegate;

- (void)loginStateChanged:(BOOL)loginState;
@end
