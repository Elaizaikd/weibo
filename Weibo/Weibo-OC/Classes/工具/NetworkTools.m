#import "NetworkTools.h"
#import <AFNetworking/AFNetworking.h>

@interface NetworkTools()

@property(nonatomic, copy)NSString* appkey;
@property(nonatomic, copy)NSString* appsecret;
@property(nonatomic, copy)NSString* redirectURLString;

@end

@implementation NetworkTools

#pragma mark - 创建&初始化
+ (NetworkTools*)shareTools{
    static NetworkTools* tools;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[NetworkTools alloc]init];
    });
    return tools;
}
- (instancetype)init{
    if (self == [super init]) {
        self.appkey = @"2231094830";
        self.appsecret = @"916e72239953665ed8af8f6a6d6cbf16";
        self.redirectURLString = @"https://www.baidu.com";
    }
    return self;
}

#pragma mark - 获取授权请求
- (NSURLRequest*)getAuthorizeRequest{
    NSString* baseURLString = @"https://api.weibo.com/oauth2/authorize";
    NSString* authorizeURLString = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@", baseURLString, self.appkey, self.redirectURLString];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:authorizeURLString]];
    return request;
}

#pragma mark - 获取access_token
/*
 API：https://open.weibo.com/wiki/Oauth2/access_token
 */
- (void)getAccessTokenWithCode:(NSString*)code completionHandler:(void (^) (id result, NSError* error))finished{
    NSString* baseURLString = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary* dict = @{
        @"client_id": self.appkey,
        @"client_secret": self.appsecret,
        @"grant_type": @"authorization_code",
        @"code": code,
        @"redirect_uri": self.redirectURLString
    };
    
    [[NetworkTools shareTools] POST:baseURLString parameters:dict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(nil, error);
    }];
}

#pragma mark - 获取首页数据
/*
 API：https://api.weibo.com/2/statuses/home_timeline.json
 */
- (void)getStatusesWithToken:(NSString* )token completionHandler:(void (^) (id result, NSError* error))finished{
    NSString *baseURLString = @"https://api.weibo.com/2/statuses/home_timeline.json";
    NSDictionary* dict = @{
        @"access_token": token
    };
    [[NetworkTools shareTools] GET:baseURLString parameters:dict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(nil, error);
    }];
}

@end
