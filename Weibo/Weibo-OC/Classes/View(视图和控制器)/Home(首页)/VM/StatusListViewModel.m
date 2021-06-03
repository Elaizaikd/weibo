#import "StatusListViewModel.h"
#import "UserAccountViewModel.h"
#import "NetworkTools.h"
#import "Status.h"
#import "StatusViewModel.h"

@implementation StatusListViewModel

+(instancetype)shareStatus{
    static StatusListViewModel* vm;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vm = [[StatusListViewModel alloc]init];
    });
    return vm;
}

#pragma mark - 网络方法，获取首页数据
- (void)loadStatusWithCompletionHandler: (void (^) (id data, NSError* error))finished{
    NSString* token = UserAccountViewModel.shareUserAccount.token;
    [[NetworkTools shareTools]getStatusesWithToken:token completionHandler:^(id  _Nonnull result, NSError * _Nonnull error) {
        if (!error) {
            for (NSDictionary* dict in result[@"statuses"]) {
                Status *status = [[Status alloc]initWithDict:dict];
                StatusViewModel* statusVM = [[StatusViewModel alloc]initWithStatus:status];
                [self.statuses addObject:statusVM];
            }
            finished(self.statuses, nil);
        }else{
            finished(nil, error);
        }
    }];
}

#pragma mark - TODO暂时替代网络方法 --- 文件地址需要修改
//- (void)loadStatusWithCompletionHandler: (void (^) (id data, NSError* error))finished{
//    NSString *path = @"/Users/fan/Desktop/home_timeline.json";
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//    for (NSDictionary* dict in result[@"statuses"]) {
//        Status *status = [[Status alloc]initWithDict:dict];
//        StatusViewModel* statusVM = [[StatusViewModel alloc]initWithStatus:status];
//        [self.statuses addObject:statusVM];
//    }
//    finished(self.statuses, nil);
//}

#pragma mark - 懒加载
- (NSMutableArray *)statuses{
    if (_statuses == nil) {
        _statuses = [NSMutableArray arrayWithCapacity:20];
    }
    return _statuses;
}

@end
