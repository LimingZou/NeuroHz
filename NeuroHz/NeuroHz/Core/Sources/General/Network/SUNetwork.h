//
//  SUNetwork.h
//  SUMusic
//
//  Created by KevinSu on 16/1/12.
//  Copyright © 2016年 KevinSu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongInfo.h"
#import <AFNetworking.h>

typedef NS_ENUM(NSInteger, OperationType) {
    OperationTypeNone,
    OperationTypeEnd,
    OperationTypeUnHeart,
    OperationTypeHeart,
    OperationTypeSkip,
    OperationTypeBan,
    OperationTypePlay
};

@interface SUNetwork : NSObject

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;


+ (AFHTTPSessionManager *)manager;

#pragma mark - 登陆
+ (void)loginWithUserName:(NSString *)userName password:(NSString *)pwd completion:(void(^)(BOOL isSucc, NSString * msg))completion;

#pragma mark - 频道列表
+ (void)fetchChannelsWithCompletion:(void(^)(BOOL isSucc, NSArray * channels))completion;

#pragma mark - 歌曲操作
+ (void)fetchPlayListWithType:(OperationType)type completion:(void(^)(BOOL isSucc))completion;

#pragma mark - 歌词
+ (void)fetchLyricWithCompletion:(void(^)(BOOL isSucc, BOOL isExist, NSDictionary * lyric))completion;

@end
