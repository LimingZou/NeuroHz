//
//  MultiBarChartView.m
//  NeuroHz
//
//  Created by 😄咔咔 on 16/8/3.
//  Copyright © 2016年 Jolly-Liming. All rights reserved.
//

#import "MultiBarChartView.h"
#import "ZFChart.h"
#import "ImageTextButton.h"

@interface MultiBarChartView ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ImageTextButton *imgTextButton;

@end

@implementation MultiBarChartView

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenW, ScreenH/3+30+30);
        self.backgroundColor = [UIColor whiteColor];

        
        for (int i = 0; i < 3; i++) {
            self.imgTextButton = [[ImageTextButton alloc] initWithFrame:CGRectMake(20+i*65, 10, 40, 15)
                                                                  image:[UIImage imageNamed:@""]
                                                                  title:@""];
            self.imgTextButton.titleLabel.font = [UIFont systemFontOfSize:10.f];
            if (i==0) {
                [self.imgTextButton setImage:[self createImageWithColor:ZFColor(71, 204, 255, 1)] forState:UIControlStateNormal];
            
                [self.imgTextButton setTitle:@"上午" forState:UIControlStateNormal];
            }else if (i == 1){
                [self.imgTextButton setImage:[self createImageWithColor:ZFColor(253, 203, 76, 1)]forState:UIControlStateNormal];
                [self.imgTextButton setTitle:@"中午" forState:UIControlStateNormal];
            }else if (i == 2){
                [self.imgTextButton setImage:[self createImageWithColor:ZFColor(16, 140, 39, 1)] forState:UIControlStateNormal];
                [self.imgTextButton setTitle:@"下午" forState:UIControlStateNormal];
            }
            //    self.imgTextButton.imgTextDistance = 10; // 可修改图片标题的间距，默认为5
            self.imgTextButton.buttonTitleWithImageAlignment = UIButtonTitleWithImageAlignmentLeft;
            [self addSubview:self.imgTextButton];
        }
        
        
        self.barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(0, 30, ScreenW, ScreenH/3)];
        self.barChart.dataSource = self;
        self.barChart.delegate = self;
        self.barChart.topicLabel.text = @"";
        self.barChart.unit = @"分钟";
        //    self.barChart.topicLabel.textColor = ZFBlack;
        ////    self.barChart.isAnimated = NO;
        ////    self.barChart.isResetAxisLineMinValue = YES;
        ////    self.barChart.isShadowForValueLabel = NO;
        self.barChart.valueLabelPattern = kPopoverLabelPatternBlank;
        //    self.barChart.isShowSeparate = NO;
        //    self.barChart.unitColor = ZFBlack;
        //    self.barChart.backgroundColor = [UIColor clearColor];
        //    self.barChart.axisColor = ZFBlack;
        //    self.barChart.axisLineNameColor = ZFBlack;
        //    self.barChart.axisLineValueColor = ZFBlack;
        [self.barChart strokePath];
        [self addSubview:self.barChart];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.barChart.frame), ScreenW, 30)];
        title.text = @"听疗记录";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor blueColor];
        [self addSubview:title];
    }
    return self;
}
#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@[@"15", @"30", @"36", @"72", @"21", @"18", @"29"], @[@"15", @"18", @"2", @"24", @"83", @"20", @"33"], @[@"56", @"26", @"25", @"37", @"48", @"79", @"66"]];
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", @"星期天"];
}

- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[ZFColor(71, 204, 255, 1), ZFColor(253, 203, 76, 1), ZFColor(16, 140, 39, 1)];
}

- (CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart{
    return 180;
}

//- (CGFloat)axisLineMinValueInGenericChart:(ZFGenericChart *)chart{
//    return 100;
//}

- (NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart{
    return 6;
}

#pragma mark - ZFBarChartDelegate

- (CGFloat)barWidthInBarChart:(ZFBarChart *)barChart{
    return 10.f;
}
//
//- (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{
//    return 20.f;
//}
//
//- (CGFloat)paddingForBarInBarChart:(ZFBarChart *)barChart{
//    return 5.f;
//}

- (id)valueTextColorArrayInBarChart:(ZFBarChart *)barChart{
    return @[ZFColor(71, 204, 255, 1), ZFColor(253, 203, 76, 1), ZFColor(16, 140, 39, 1)];
}

- (void)barChart:(ZFBarChart *)barChart didSelectBarAtGroupIndex:(NSInteger)groupIndex barIndex:(NSInteger)barIndex{
    //特殊说明，因传入数据是3个subArray(代表3个类型)，每个subArray存的是6个元素(代表每个类型存了1~6年级的数据),所以这里的groupIndex是第几个subArray(类型)
    //eg：三年级第0个元素为 groupIndex为0，barIndex为2
    NSLog(@"第%ld个颜色中的第%ld个",(long)groupIndex,(long)barIndex);
}

- (void)barChart:(ZFBarChart *)barChart didSelectPopoverLabelAtGroupIndex:(NSInteger)groupIndex labelIndex:(NSInteger)labelIndex{
    //理由同上
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)labelIndex);
}
#pragma mark - Helper
- (UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 15.0f, 15.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
