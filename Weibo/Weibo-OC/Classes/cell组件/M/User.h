//
//  User.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/28.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject



/// 用户昵称
@property (nonatomic, copy) NSString* name;

/// 认证类型：-1:没有认证，0:个人认证，2:企业认证
@property (nonatomic, strong) NSNumber* verified_type;

/// VIP： 1:没有 2-7:Vip等级
@property (nonatomic, strong) NSNumber* mbrank;

/// 用户头像地址
@property (nonatomic, copy) NSString* profile_image_url;

- (instancetype)initWithDict:(NSDictionary*)dict;
@end
