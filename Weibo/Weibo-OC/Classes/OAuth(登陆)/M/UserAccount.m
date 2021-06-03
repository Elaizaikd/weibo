//
//  UserAccount.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/22.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "UserAccount.h"
@interface UserAccount()<NSSecureCoding>
@end

@implementation UserAccount

#pragma mark - 初始化 & KVC
- (instancetype)initWithDict: (NSDictionary*)dict{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"expires_in"]) {
        self.expiredDate = [NSDate dateWithTimeIntervalSinceNow: [(NSNumber *)value doubleValue]];
    }
    [super setValue:value forKey:key];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

#pragma mark - 保存当前对象
- (void)saveUserAccount{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"account.plist"];
    NSError *error = nil;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:YES error:&error];
    [data writeToFile:path atomically:NO];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"UserAcount = {\n\taccess_token=%@,\n\texpiredDate=%@,\n\tuid=%@\n}", self.access_token, self.expiredDate, self.uid];
}

#pragma mark - NSSecureCoding协议方法
- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.access_token forKey:@"access_token"];
    [coder encodeObject:self.uid forKey:@"uid"];
    [coder encodeObject:self.expiredDate forKey:@"expiredDate"];
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self == [super init]) {
        _access_token = [coder decodeObjectForKey:@"access_token"];
        _uid = [coder decodeObjectForKey:@"uid"];
        _expiredDate = [coder decodeObjectForKey:@"expiredDate"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

@end
