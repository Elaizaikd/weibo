//
//  VisitorView.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/17.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VisitorView : UIView

@property (nonatomic, strong)UIButton* registerBtn;
@property (nonatomic, strong)UIButton* loginBtn;

- (void)setupImage:(NSString*)imageName andTitle:(NSString*)title;

@end

NS_ASSUME_NONNULL_END
