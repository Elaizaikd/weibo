#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
NS_ASSUME_NONNULL_BEGIN

@interface NetworkTools :AFHTTPSessionManager

+ (NetworkTools*)shareTools;

- (NSURLRequest*)getAuthorizeRequest;
- (void)getAccessTokenWithCode:(NSString*)code completionHandler:(void (^) (id result, NSError* error))finished;
- (void)getStatusesWithToken:(NSString* )token completionHandler:(void (^) (id result, NSError* error))finished;

@end

NS_ASSUME_NONNULL_END
