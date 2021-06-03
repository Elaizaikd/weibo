//
//  Status.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/27.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "Status.h"
#import "User.h"

@implementation Status

- (instancetype)initWithDict:(NSDictionary*)dict{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.id_ = (NSNumber*)value;
    }
    if ([key isEqualToString:@"user"]) {
        self.user = [[User alloc]initWithDict:value];
        return;
    }
    if ([key isEqualToString:@"retweeted_status"]) {
        self.retweeted_status = [[Status alloc]initWithDict:value];
        return;
    }
    
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Status = {\n\t weiboID = %@,\n\t created_at = %@,\n\t source = %@,\n\t text = %@,\n\t %@,\n\t pic_urls=%@,\n\t retweeted_status=%@ \n}", self.id_, self.created_at, self.source, self.text, self.user, self.pic_urls, self.retweeted_status];
}
@end
