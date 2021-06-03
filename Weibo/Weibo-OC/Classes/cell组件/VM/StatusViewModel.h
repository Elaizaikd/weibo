//
//  StatusViewModel.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/28.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Status;

@interface StatusViewModel : NSObject

@property(nonatomic, strong)Status* status;
@property(nonatomic, assign)CGFloat rowHeight; // 行高

#pragma mark - TopView 信息
@property(nonatomic, strong)NSString* userName; // 用户名
@property(nonatomic, strong)NSURL* userProfileURL; // 头像url
@property(nonatomic, copy)NSString* approveName; // 认证图标名称
@property(nonatomic, copy)NSString* vipIconName; // VIP图标名称
@property(nonatomic, copy)NSString* createTimeString; // 创建时间
@property(nonatomic, copy)NSString* sourceString; // 微博来源

#pragma mark - 微博正文

#pragma mark - picsView信息
@property(nonatomic, strong)NSArray* picURLs; // 配图URL

#pragma mark - 转发微博信息
@property(nonatomic, copy)NSString* retweetedString; // 转发微博的文本

- (instancetype)initWithStatus:(Status*) status;

@end

