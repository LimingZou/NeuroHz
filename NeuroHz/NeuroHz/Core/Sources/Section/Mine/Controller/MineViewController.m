//
//  MineViewController.m
//  NeuroHz
//
//  Created by 😄咔咔 on 16/8/3.
//  Copyright © 2016年 Jolly-Liming. All rights reserved.
//

#import "MineViewController.h"
#import "HooMeHeaderView.h"
@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource, HooMeHeaderViewDelegate>
@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic,strong) HooMeHeaderView *header;

@property (nonatomic, strong) NSArray *dataArrayList;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self.view addSubview:self.listTableView];
    HooMeHeaderView *header = [[[NSBundle mainBundle]loadNibNamed:@"HooMeHeaderView" owner:nil options:nil] firstObject];
    header.delegate = self;
    header.backgroundColor = [UIColor redColor];
    self.header = header;
    
    self.listTableView.tableHeaderView = header;
    [self loadNewData];
    
}

- (void)loadNewData{
    self.dataArrayList = @[@{@"title":@"我的设备",
                             @"detail":@"未连接"},
                           @{@"title":@"我的亲友团",
                             @"detail":@""},
                           @{@"title":@"更多",
                             @"detail":@""},];
}
- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArrayList[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrayList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyCellIdentifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier] ;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyCellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self itemAtIndexPath:indexPath][@"title"];
    cell.detailTextLabel.text = [self itemAtIndexPath:indexPath][@"detail"];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 70;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH-64) style:UITableViewStyleGrouped];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.backgroundColor = [UIColor clearColor];
        [_listTableView setSeparatorColor:RGBColor(241, 241, 241)];
        _listTableView.tableFooterView =  [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _listTableView;
}

- (void)HooMeHeaderViewBtnClicked:(HooMeHeaderViewButtonType)type{
    
}

@end
