#import "StatusViewModel.h"
#import "Status.h"
#import "User.h"
#import "StatusCell.h"
#import "StatusRetweetedCell.h"
#import "StatusNormalCell.h"
#import "Common.h"
@implementation StatusViewModel


// 懒加载 计算/缓存 行高
- (CGFloat)rowHeight{
    StatusCell* cell;
    if (self.status.retweeted_status == nil) {
       cell = [[StatusNormalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StatusNormalCellID];
    }else{
        cell = [[StatusRetweetedCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StatusRetweetedCellID];
    }
    return  [cell rowHeight:self];
}

- (instancetype)initWithStatus:(Status*) status
{
    self = [super init];
    if (self) {
        self.status = status;
        
        self.userProfileURL = [NSURL URLWithString:self.status.user.profile_image_url];
        self.approveName = [self translateVerifiedType:self.status];
        self.vipIconName = [self translateMembershipLevel:self.status];
        self.createTimeString = [self translateCreateTime: self.status];
        self.sourceString = [self sourceRegex:self.status];
        self.picURLs = [self translatePicURL:self.status];
        self.retweetedString = [NSString stringWithFormat:@"@%@: %@", self.status.retweeted_status.user.name, self.status.retweeted_status.text];
    }
    return self;
}

#pragma mark- 数据转换
/// 把用户认证类型 转换为 对应图片字符串
- (NSString*)translateVerifiedType:(Status*)status{
    NSString* str = @"";
    if ([status.user.verified_type  isEqual: @0]) {
        str = @"avatar_member";
    }else if ([status.user.verified_type  isEqual: @2]){
        str = @"avatar_enterprise";
    }
    return str;
}

/// 把用户vip等级 转换为 对应图片字符串
- (NSString*)translateMembershipLevel:(Status*)status{
    NSString* str = @"";
    if (status.user.mbrank.intValue > 1) {
        str = [NSString stringWithFormat:@"icon_membership_level%d", self.status.user.mbrank.intValue];
    }
    return str;
}

/// 转换创建时间字符串
- (NSString*)translateCreateTime:(Status*)status{
    // 从字符串 转换为 日期
    NSDateFormatter* rowFormate = [[NSDateFormatter alloc]init];
    [rowFormate setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    NSDate* date = [rowFormate dateFromString: status.created_at];
    
    // 再从日期 转换为 特定格式的字符串
    // 转换日期
    NSDateFormatter* dayFormate = [[NSDateFormatter alloc]init];
    [dayFormate setDateFormat:@"M月d日"];
    NSString* day = [dayFormate stringFromDate:date];
    
    if ([day isEqualToString:[dayFormate stringFromDate:[NSDate date]]]) {
        day = @"今天";
    }
    
    // 转换时间
    NSDateFormatter* timeFormate = [[NSDateFormatter alloc]init];
    [timeFormate setDateFormat:@"HH:mm"];
    NSString* time = [timeFormate stringFromDate:date];
    
    return [NSString stringWithFormat:@"%@ %@",day, time];
}

/// 从微博来源字符串中正则抽取x
- (NSString*)sourceRegex:(Status*)status{
    NSString* pattern = @"<.*?>(.*?)</a>";
    NSRegularExpression *reguar = [[NSRegularExpression alloc]initWithPattern:pattern options:0 error:nil];
    NSTextCheckingResult* results = [reguar firstMatchInString:status.source options:0 range:NSMakeRange(0, status.source.length)];
    
    if(results.numberOfRanges < 2){
        return @"";
    }
    NSRange range = [results rangeAtIndex:1];
    return [status.source substringWithRange:range];
}

/// 把微博图片字符串数组 转换为 微博图片URL数组
- (NSArray*)translatePicURL:(Status*)status{
    NSArray* array = status.retweeted_status.pic_urls;
    if (array.count == 0) {
        array = status.pic_urls;
    }
    if (array.count == 0) {
        return nil;
    }
    NSMutableArray* res = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary* dict in array) {
        NSURL* url = [NSURL URLWithString:dict[@"thumbnail_pic"]];
        [res addObject:url];
    }
    return [res copy];
}

@end
