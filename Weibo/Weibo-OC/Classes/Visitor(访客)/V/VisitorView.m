#import "VisitorView.h"
#import <Masonry/Masonry.h>
#import "UIButton+init.h"
#import "UILabel+init.h"

@interface VisitorView ()
@property (nonatomic, strong)UIImageView* iconView;
@property (nonatomic, strong)UILabel* msgLabel;

@end

@implementation VisitorView

#pragma mark -设置视图信息
- (void)setupImage:(NSString*)imageName andTitle:(NSString*)title{
    self.msgLabel.text = title;
    self.iconView.image = [UIImage imageNamed:imageName];
}

#pragma mark - 初始化控件、设置界面
- (instancetype)init{
    if (self = [super init]) {
        // 初始化控件
        self.iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitorImage_house"]];
        self.msgLabel = [UILabel labelWithText:@"关注一些人，回这里看有什么惊喜" andFont:[UIFont systemFontOfSize:14] andTextColor:[UIColor darkGrayColor]];
        self.loginBtn = [UIButton buttonWithTile:@"登录" andTitleColor:[UIColor darkGrayColor] andBackImageName:@"common_button_white_disable"];
        self.registerBtn = [UIButton buttonWithTile:@"注册" andTitleColor:[UIColor orangeColor] andBackImageName:@"common_button_white_disable"];
        
        // 设置界面
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.iconView];
    [self addSubview:self.msgLabel];
    [self addSubview:self.registerBtn];
    [self addSubview:self.loginBtn];

    for (UIView* sub in self.subviews) {
        sub.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    // 1>图标
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-90);
    }];
    
    // 2>文字lbl
    [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconView.mas_centerX);
        make.top.equalTo(self.iconView.mas_bottom).offset(16);
        // 设置宽高，加上上面设置的numberOfLines，使其能换行
        make.width.equalTo(@240);
        make.height.equalTo(@36);
    }];
    
    // 3>注册按钮
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.msgLabel.mas_bottom).offset(20);
        make.left.equalTo(self.msgLabel.mas_left);
        // 设置宽高，加上图片中设置的切片，美化外观
        make.width.equalTo(@100);
        make.height.equalTo(@36);
    }];
    
    // 4>登录按钮
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.msgLabel.mas_bottom).offset(20);
        make.right.equalTo(self.msgLabel.mas_right);
        make.width.equalTo(@100);
        make.height.equalTo(@36);
    }];
    
    [self setBackgroundColor:[UIColor colorWithWhite:237.0/255.0 alpha:1.0]];
}

@end
