//
//  UILabel+init.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/29.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "UILabel+init.h"
#import "Common.h"
#import <UIKit/UIKit.h>

@implementation UILabel (init)

// 微博正文lbl
+(instancetype)labelWithFont: (UIFont* )font {
    UILabel* lbl = [[UILabel alloc]init];
    lbl.font = font;
    lbl.numberOfLines = 0; // 重要
    // 设置宽度
    lbl.preferredMaxLayoutWidth = UIScreen.mainScreen.bounds.size.width - 2 * StatusCellMargin;
    return lbl;
}

+(instancetype)labelWithFont: (UIFont* )font andTextColor: (UIColor*)color{
    UILabel* lbl = [[UILabel alloc]init];
    lbl.font = font;
    lbl.textColor = color;
    lbl.numberOfLines = 0; // 重要
    return lbl;
}

+(instancetype)labelWithText: (NSString*)text andFont: (UIFont*)font andTextColor: (UIColor*)color{
    UILabel* lbl = [[UILabel alloc]init];
    lbl.text = text;
    lbl.font = font;
    lbl.textColor = color;
    lbl.numberOfLines = 0; // 重要
    lbl.textAlignment = NSTextAlignmentCenter;
    return lbl;
}

@end
