//
//  HooMeHeaderView.m
//  xiu8iOS
//
//  Created by Scarecrow on 15/9/19.
//  Copyright (c) 2015年 xiu8. All rights reserved.
//

#import "HooMeHeaderView.h"
@interface HooMeHeaderView()
@property (weak, nonatomic) IBOutlet UIView *circleBg;
@property (weak, nonatomic) IBOutlet UIImageView *header;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIView *alreadyLoginView;

@property (weak, nonatomic) IBOutlet UIView *noLoginView;

@end
@implementation HooMeHeaderView

- (void)awakeFromNib
{
    [self setupHeaderCircle];
}

- (void)loginStateChanged:(BOOL)loginState
{
    self.noLoginView.hidden = loginState;
    self.alreadyLoginView.hidden = !loginState;
}

- (IBAction)loginBtnDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(HooMeHeaderViewBtnClicked:)]) {
        [self.delegate HooMeHeaderViewBtnClicked:HooMeHeaderViewButtonTypeLogin];
    }
}

- (IBAction)registerBtnClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(HooMeHeaderViewBtnClicked:)]) {
        [self.delegate HooMeHeaderViewBtnClicked:HooMeHeaderViewButtonTypeRegister];
    }
}

- (IBAction)attentionBtnDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(HooMeHeaderViewBtnClicked:)]) {
        [self.delegate HooMeHeaderViewBtnClicked:HooMeHeaderViewButtonTypeAttention];
    }
}

- (IBAction)historyBtnDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(HooMeHeaderViewBtnClicked:)]) {
        [self.delegate HooMeHeaderViewBtnClicked:HooMeHeaderViewButtonTypeHistory];
    }
}

- (IBAction)guardBtnDidClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(HooMeHeaderViewBtnClicked:)]) {
        [self.delegate HooMeHeaderViewBtnClicked:HooMeHeaderViewButtonTypeGuard];
    }
}



- (void)setupHeaderCircle
{
//    self.circleBg.layer.cornerRadius = self.circleBg.height * 0.5;
//    self.header.layer.cornerRadius = self.header.width * 0.5;
//    self.header.clipsToBounds = YES;
//    self.circleBg.clipsToBounds = YES;
}

@end
