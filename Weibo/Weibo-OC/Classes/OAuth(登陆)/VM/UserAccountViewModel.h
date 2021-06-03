//
//  UserAccountViewModel.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/26.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class NetworkTools;

@interface UserAccountViewModel : NSObject

@property (nonatomic, assign) BOOL userLogin; // 用户登录标记
@property (nonatomic, copy) NSString* token; 
@property (nonatomic, strong)NetworkTools *netTools; //网络工具

+ (instancetype)shareUserAccount;

- (void)getAccessTokenWithCode:(NSURL*)url completionHandler: (void (^) (id data, NSError* error))finished;

@end

NS_ASSUME_NONNULL_END
