//
//  DouAPI.h
//  SUMusic
//
//  Created by KevinSu on 16/1/12.
//  Copyright © 2016年 KevinSu. All rights reserved.
//
/*
 https://github.com/zonyitoo/doubanfm-qt/wiki/豆瓣FM-API
 http://my.oschina.net/itfanr/blog/195130?fromerr=FotLJtKf
 http://blog.sina.com.cn/s/blog_6f58a6200100zdvr.html
 https://www.zhihu.com/question/19679351/answer/19145520
 */

#ifndef DouAPI_h
#define DouAPI_h

#pragma mark - 登陆
#define DOU_API_Login @"http://www.douban.com/j/app/login"

#pragma mark - 频道（Channels）
#define DOU_API_Channels @"http://www.douban.com/j/app/radio/channels"

#pragma mark - 歌曲列表（未登陆）
#define DOU_API_PlayList @"http://www.douban.com/j/app/radio/people?type=%@&sid=%@&pt=%@&channel=%@&app_name=radio_android&version=100"

#pragma mark - 歌曲列表（已登陆）
#define DOU_API_PlayList_Login @"http://www.douban.com/j/app/radio/people?type=%@&sid=%@&pt=%@&channel=%@&app_name=radio_android&version=100&user_id=%@&expire=%@&token=%@"

#pragma mark - 歌词
#define DOU_API_Lyric @"http://api.douban.com/v2/fm/lyric"

#endif /* DouAPI_h */
