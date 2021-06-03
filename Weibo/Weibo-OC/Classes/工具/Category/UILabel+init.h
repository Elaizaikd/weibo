//
//  UILabel+init.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/29.
//  Copyright © 2020 Juri. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (init)


+(instancetype)labelWithFont: (UIFont* )font;

+(instancetype)labelWithFont: (UIFont* )font andTextColor: (UIColor*)color;

+(instancetype)labelWithText: (NSString*)text andFont: (UIFont*)font andTextColor: (UIColor*)color;

@end

NS_ASSUME_NONNULL_END
