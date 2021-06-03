//
//  UserAccount.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/22.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserAccount : NSObject

@property(nonatomic, strong) NSDate *expiredDate;
@property(nonatomic, copy) NSString* access_token;
@property(nonatomic, strong) NSNumber* expires_in;
@property(nonatomic, copy) NSString* uid;

- (instancetype)initWithDict: (NSDictionary*)dict;

- (void)saveUserAccount;

@end

NS_ASSUME_NONNULL_END
