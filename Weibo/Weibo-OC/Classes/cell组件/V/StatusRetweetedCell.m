#import "StatusRetweetedCell.h"
#import "UILabel+init.h"
#import <Masonry/Masonry.h>
#import "StatusCellBottomView.h"
#import "Common.h"
#import "StatusPicsView.h"
#import "StatusViewModel.h"
@interface StatusRetweetedCell()

@property(nonatomic, strong)UIButton* backgroudBtn;
@property(nonatomic, strong)UILabel* retweetedLbl;

@end

@implementation StatusRetweetedCell

#pragma mark - 控件赋值
- (void)setViewModel:(StatusViewModel *)viewModel{
    self.retweetedLbl.text = viewModel.retweetedString;
    [super setViewModel: viewModel];
}

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroudBtn = [[UIButton alloc]init];
        self.backgroudBtn.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        self.retweetedLbl = [UILabel labelWithFont:[UIFont systemFontOfSize:16]];
        [self setupUI2];
    }
    return self;
}

#pragma mark - 设置界面布局
- (void)setupUI2{
    [super setupUI];

    [self.contentView insertSubview:self.backgroudBtn belowSubview:(UIView*)self.picsView];
    [self.contentView insertSubview:self.retweetedLbl aboveSubview:self.backgroudBtn];
    
    [self.backgroudBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textContentLbl.mas_bottom).offset(StatusCellMargin);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.bottomView.mas_top);
    }];
    [self.retweetedLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroudBtn.mas_top).offset(StatusCellMargin);
        make.left.equalTo(self.backgroudBtn.mas_left).offset(StatusCellMargin);
    }];
    
    [self.picsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.retweetedLbl.mas_bottom).offset(StatusCellMargin);
        make.left.equalTo(self.contentView.mas_left).offset(StatusCellMargin);
        make.width.equalTo(self.contentView.mas_width).offset(-2*StatusCellMargin);
        make.height.equalTo(@30);
    }];
}
@end
