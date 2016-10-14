//
//  HomeViewController.m
//  NeuroHz
//
//  Created by 😄咔咔 on 16/8/3.
//  Copyright © 2016年 Jolly-Liming. All rights reserved.
//

#import "HomeViewController.h"
#import "MultiBarChartView.h"
#import "FindPutCell.h"
#import "ChannelTableViewCell.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate,ContentShowViewDelegate>
{ // 定义完全私有的属性 : 添加成员变量,因为不需要懒加载,所以不需要是属性
    UIPageControl *_pageControl;
    // 定义热门类或三个图片按钮的FindPutCell高
    CGFloat _hotCellHeight;
}

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        // FindPutCell (三个按钮)
        FindPutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCell"];
        _hotCellHeight = cell.cellHeight;
        
        cell.clickBtn0.titleLb.text = @"title";
        [cell.clickBtn0.contentImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        // 定Tag值,跳转需要
        cell.clickBtn0.tag = indexPath.section*10 + 0;
        cell.clickBtn0.delegate = self;
        cell.detailLb0.text = @"detailLb0";
        
        cell.clickBtn1.titleLb.text = @"title";
        [cell.clickBtn1.contentImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        // 定Tag值,跳转需要
        cell.clickBtn1.tag = indexPath.section*10 + 1;
        cell.clickBtn1.delegate = self;
        cell.detailLb1.text = @"detailLb1";
        
        cell.clickBtn2.titleLb.text = @"title";
        [cell.clickBtn2.contentImgView sd_setImageWithURL:[NSURL URLWithString:@""]  placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        // 定Tag值,跳转需要
        cell.clickBtn2.tag = indexPath.section*10 + 2;
        cell.clickBtn2.delegate = self;
        cell.detailLb2.text = @"detailLb2";
        return cell;
        
    }else{
        ChannelTableViewCell * Channelcell = [tableView dequeueReusableCellWithIdentifier:@"channelCell"];
        Channelcell.selectionStyle = UITableViewCellSelectionStyleNone;
        Channelcell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        ChannelInfo * channel = [self.dataSource objectAtIndex:indexPath.row];
        Channelcell.channelName.text = @"dasdas";
//
//        if ([_appDelegate.player.currentChannel.channel_id isEqualToString:channel.channel_id]) {
            Channelcell.playIndicator.hidden = NO;
            Channelcell.playIndicator.animationImages = @[[UIImage imageNamed:@"ic_channel_nowplaying1"],
                                                   [UIImage imageNamed:@"ic_channel_nowplaying2"],
                                                   [UIImage imageNamed:@"ic_channel_nowplaying3"],
                                                   [UIImage imageNamed:@"ic_channel_nowplaying4"]];
            Channelcell.playIndicator.animationDuration = 1.0;
            Channelcell.playIndicator.animationRepeatCount = 0;
            [Channelcell.playIndicator startAnimating];
//        }else {
//            [cell.playIndicator stopAnimating];
//            cell.playIndicator.hidden = YES;
//        }
        
        return Channelcell;
    }
    

    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return _hotCellHeight;
    }else{
        return 70;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH-64) style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[FindPutCell class] forCellReuseIdentifier:@"FCell"];
        
        [_tableView registerClass:[ChannelTableViewCell class] forCellReuseIdentifier:@"channelCell"];
        // 去掉分割线
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 越界不能上下拉
        _tableView.bounces = YES;
        _tableView.tableHeaderView = [[MultiBarChartView alloc] init];

    }
    return _tableView;
}

@end
