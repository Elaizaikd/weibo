//
//  User.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/28.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDict:(NSDictionary*)dict{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *)description
{
    return [NSString stringWithFormat:@"User = {\n\t\t name = %@,\n\t\t verified_type = %@,\n\t\t mbrank=%@,\n\t\t profile_image_url = %@\n\t}", self.name, self.verified_type, self.mbrank, self.profile_image_url];
}

@end
