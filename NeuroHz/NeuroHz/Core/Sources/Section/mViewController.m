//
//  mViewController.m
//  app框架
//
//  Created by 😄咔咔 on 16/5/26.
//  Copyright © 2016年 -LimingZou. All rights reserved.
//

#import "mViewController.h"

@interface mViewController ()

@property (nonatomic, strong) UIButton *kissButton;

@end

@implementation mViewController

#pragma mark – Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubviews];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self layoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:YES];
}

- (void)dealloc
{
    
}

#pragma mark - Create view
- (void)createSubviews{
    [self.view addSubview:self.kissButton];
}

#pragma mark - Layout Subviews
- (void)layoutSubviews{
    self.kissButton.frame = CGRectMake(0, 0, 50, 50);

}

#pragma mark - Events
- (void)chickAction:(UIButton *)sender{
    
}

#pragma mark - Observer


#pragma mark – Private Methods


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cell = @"cell";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cell forIndexPath:indexPath];
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell];
    }
    return tableViewCell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
#pragma mark - Custom Delegates

#pragma mark – Getters and Setters
- (UIButton *)kissButton{
    if (!_kissButton) {
        _kissButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_kissButton setTitle:@"button" forState:UIControlStateNormal];
        [_kissButton addTarget:self action:@selector(chickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _kissButton;
}

@end
