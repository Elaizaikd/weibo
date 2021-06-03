#import "StatusCellBottomView.h"
#import <Masonry/Masonry.h>
#import "UIButton+init.h"
@interface StatusCellBottomView()

@property (nonatomic, strong) UIButton* praiseBtn;
@property (nonatomic, strong) UIButton* commentBtn;
@property (nonatomic, strong) UIButton* forawrdBtn;
@property (nonatomic, strong) UIView* sepView1;
@property (nonatomic, strong) UIView* sepView2;

@end
@implementation StatusCellBottomView

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化控件
        self.forawrdBtn = [UIButton buttonWithTile:@"转发" andTitleColor:UIColor.blackColor andImageName:@"timeline_icon_retweet"];
        self.commentBtn = [UIButton buttonWithTile:@"评论" andTitleColor:UIColor.blackColor andImageName:@"timeline_icon_comment"];
        self.praiseBtn = [UIButton buttonWithTile:@"赞" andTitleColor:UIColor.blackColor andImageName:@"timeline_icon_unlike"];
        
        self.sepView1 = [[UIView alloc]init];
        self.sepView1.backgroundColor = UIColor.redColor;
        
        self.sepView2 = [[UIView alloc]init];
        self.sepView2.backgroundColor = UIColor.redColor;
        
        // 设置界面
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.forawrdBtn];
    [self addSubview:self.sepView1];
    [self addSubview:self.commentBtn];
    [self addSubview:self.sepView2];
    [self addSubview:self.praiseBtn];
    
    [self.forawrdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
    }];
    [self.sepView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.forawrdBtn.mas_right);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height).multipliedBy(0.5);
        make.width.equalTo(@0.5);
    }];
    
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.forawrdBtn.mas_right);
        make.width.equalTo(self.forawrdBtn.mas_width);
    }];
    [self.sepView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentBtn.mas_right);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height).multipliedBy(0.5);
        make.width.equalTo(@0.5);
    }];
    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.commentBtn.mas_right);
        make.right.equalTo(self.mas_right);
        make.width.equalTo(self.commentBtn.mas_width);
    }];
}

@end
