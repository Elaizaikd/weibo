#import "UIButton+init.h"


@implementation UIButton (init)

+(instancetype)buttonWithImageName: (NSString*)imageName andBackImageName: (NSString*)backImageName{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted", imageName]] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted", backImageName]] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    return btn;
}

+(instancetype)buttonWithTile:(NSString*)text andTitleColor:(UIColor*)color andBackImageName: (NSString*)imageName{
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return btn;
}

+(instancetype)buttonWithTile:(NSString*)text andTitleColor:(UIColor*)color andImageName: (NSString*)imageName{
    UIButton *btn = [[UIButton alloc]init];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    return btn;
}

@end
