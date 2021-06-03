//
//  UIButton+init.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/16.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (init)

+(instancetype)buttonWithImageName:(NSString *)imageName andBackImageName:(NSString *)backImageName;
+(instancetype)buttonWithTile:(NSString*)text andTitleColor:(UIColor*)color andBackImageName: (NSString*)imageName;
+(instancetype)buttonWithTile:(NSString*)text andTitleColor:(UIColor*)color andImageName: (NSString*)imageName;

@end

NS_ASSUME_NONNULL_END
