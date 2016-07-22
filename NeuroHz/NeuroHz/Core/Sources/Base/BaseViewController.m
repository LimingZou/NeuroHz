//
//  BaseViewController.m
//  SUMusic
//
//  Created by KevinSu on 16/1/17.
//  Copyright © 2016年 KevinSu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () {
    
    UIView * _aniView;
}

@property (nonatomic, copy) NSString *titles;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTheme];
}

- (void)setTheme{
    [self.view setBackgroundColor:[UIColor whiteColor]];
}




@end
