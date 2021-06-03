//
//  Status.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/27.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Status : NSObject

#pragma mark - 微博ID
@property (nonatomic, strong)NSNumber* id_;

#pragma mark - topView信息
@property (nonatomic, copy) NSString* created_at;// 微博创建时间
@property (nonatomic, copy) NSString* source;// 微博来源
@property (nonatomic, strong) User* user;// 用户信息

#pragma mark - 微博正文
@property (nonatomic, copy) NSString* text;

#pragma mark - picsView信息
@property (nonatomic, strong) NSArray* pic_urls;

#pragma mark - 转发微博信息
@property (nonatomic, strong) Status* retweeted_status;

- (instancetype)initWithDict:(NSDictionary*)dict;

@end
