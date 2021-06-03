#import "StatusCellTopView.h"
#import "StatusViewModel.h"
#import <Masonry/Masonry.h>
#import "Status.h"
#import "User.h"
#import <SDWebImage.h>
#import "UILabel+init.h"
#import "Common.h"


@interface StatusCellTopView()
@property (nonatomic, strong) UIImageView* iconView; // 头像
@property (nonatomic, strong) UILabel* nameLbl; // 昵称
@property (nonatomic, strong) UIImageView* approveIconView; // 认证信息
@property (nonatomic, strong) UIImageView* memberIconView; // VIP信息
@property (nonatomic, strong) UILabel* timeLbl; // 时间
@property (nonatomic, strong) UILabel* sourceLbl; // 来源

@end

@implementation StatusCellTopView

#pragma mark - 控件赋值
- (void)setViewModel:(StatusViewModel *)viewModel{
    [self.iconView sd_setImageWithURL: viewModel.userProfileURL
                     placeholderImage:[UIImage imageNamed:@"avatar_default_big"]];
     
    self.nameLbl.text = viewModel.status.user.name;
 
    if ([viewModel.approveName isEqualToString:@""]) {
        self.approveIconView.image = nil;
    }else{
        self.approveIconView.image = [UIImage imageNamed:viewModel.approveName];
    }
    
    if ([viewModel.vipIconName isEqualToString:@""]) {
        self.memberIconView.image = nil;
    }else{
        self.memberIconView.image = [UIImage imageNamed:viewModel.vipIconName];
    }
    
    self.timeLbl.text = viewModel.createTimeString;
    self.sourceLbl.text = viewModel.sourceString;
}

#pragma mark - 初始化控件、设置界面
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化控件
        self.iconView = [[UIImageView alloc]init];
        self.nameLbl = [UILabel labelWithFont:[UIFont systemFontOfSize:14]];
        self.approveIconView = [[UIImageView alloc]init];
        self.memberIconView = [[UIImageView alloc]init];
        self.timeLbl = [UILabel labelWithFont:[UIFont systemFontOfSize:11] andTextColor:UIColor.orangeColor];
        self.sourceLbl = [UILabel labelWithFont:[UIFont systemFontOfSize:11]];
        
        // 设置界面
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    // 添加子控件
    [self addSubview:self.iconView];
    [self addSubview:self.nameLbl];
    [self addSubview:self.memberIconView];
    [self addSubview:self.approveIconView];
    [self addSubview:self.timeLbl];
    [self addSubview:self.sourceLbl];
    
    // 控件布局
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(StatusCellMargin);
        make.left.equalTo(self.mas_left).offset(StatusCellMargin);
        make.width.equalTo(@StatusCellTopViewIconWidth);
        make.height.equalTo(@StatusCellTopViewIconWidth);
    }];
    [self.approveIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconView.mas_right);
        make.centerY.equalTo(self.iconView.mas_bottom);
    }];
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_top);
        make.left.equalTo(self.iconView.mas_right).offset(StatusCellMargin);
    }];
    [self.memberIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLbl.mas_top);
        make.left.equalTo(self.nameLbl.mas_right).offset(StatusCellMargin);
    }];
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.iconView.mas_bottom);
        make.left.equalTo(self.iconView.mas_right).offset(StatusCellMargin);
    }];
    [self.sourceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.timeLbl.mas_bottom);
        make.left.equalTo(self.timeLbl.mas_right).offset(StatusCellMargin);
    }];
}


@end
