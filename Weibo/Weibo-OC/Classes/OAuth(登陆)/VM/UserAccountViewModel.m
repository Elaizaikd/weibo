//
//  UserAccountViewModel.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/26.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "UserAccountViewModel.h"
#import "UserAccount.h"
#import "NetworkTools.h"

@interface UserAccountViewModel()
@property (nonatomic, strong) UserAccount* account; // 用户数据
@property (nonatomic, assign) BOOL isExpired; // 用户数据过期标记
@property (nonatomic, copy) NSString* path; // 用户数据路径
@end

@implementation UserAccountViewModel
#pragma mark - 创建&初始化
+ (instancetype)shareUserAccount{
    static UserAccountViewModel* viewModel;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        viewModel = [[UserAccountViewModel alloc]init];
    });
    return viewModel;
}
- (instancetype)init{
    // 尝试从本地获取数据，并判断数据是否过期
    if (self == [super init]) {
        NSError *error;
        NSData *data = [NSData dataWithContentsOfFile:self.path options:0 error:&error];
        // 如果文件不存在 或 没有数据
        if (error || data==nil) {
            NSLog(@"该账号还未登录");
            return self;
        }
        
        NSSet *set = [NSSet setWithArray:@[UserAccount.class, NSDate.class]];
        self.account = [NSKeyedUnarchiver unarchivedObjectOfClasses:set fromData:data error:&error];
        // 如果用户数据过期
        if (self.isExpired) {
            NSLog(@"该账号已过期");
            self.account = nil;
            return self;
        }
        self.token = self.account.access_token;
    }
    return self;
}

#pragma mark - 网络方法，获得用户信息
- (void)getAccessTokenWithCode:(NSURL*)url completionHandler: (void (^) (id data, NSError* error))finished{
    // 获得code
    NSString* urlString = url.absoluteString;
    NSUInteger startIdx = [urlString rangeOfString:@"="].location + 1;
    NSString* code = [urlString substringFromIndex:startIdx];
    
    [self.netTools getAccessTokenWithCode:code completionHandler:^(id  _Nonnull result, NSError * _Nonnull error) {
        if (!error) {
            self.account = [[UserAccount alloc]initWithDict:result];
            self.token = self.account.access_token;
            [self.account saveUserAccount];
            finished(self.account, nil);
        }else{
            finished(nil, error);
        }
    }];
}

#pragma mark - 懒加载
- (BOOL)userLogin{
    //  当用户数据不为空 并且 没过期，返回true
    return self.account!=nil && !self.isExpired;
}

- (BOOL)isExpired{
    if ([self.account.expiredDate compare:[NSDate date]] == NSOrderedAscending) {
        return true;
    }
    return false;
}

- (NSString *)path{
    if (_path == nil) {
        NSString *basePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
        _path = [basePath stringByAppendingPathComponent:@"account.plist"];
        NSLog(@"%@", self.path);
    }
    return _path;
}

- (NetworkTools *)netTools{
    if (_netTools == nil) {
        _netTools = [NetworkTools shareTools];
    }
    return _netTools;
}
@end
