//
//  StatusListViewModel.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/28.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StatusListViewModel : NSObject

@property (nonatomic, strong)NSMutableArray *statuses;
+(instancetype)shareStatus;

- (void)loadStatusWithCompletionHandler: (void (^) (id data, NSError* error))finished;

@end

NS_ASSUME_NONNULL_END
