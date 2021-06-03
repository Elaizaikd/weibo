#import "StatusCell.h"
#import "StatusCellTopView.h"
#import "StatusCellBottomView.h"
#import <Masonry/Masonry.h>
#import "StatusViewModel.h"
#import "UILabel+init.h"
#import "Status.h"
#import "Common.h"
#import "StatusPicsView.h"

@interface StatusCell()
@property (nonatomic, strong) StatusCellTopView* topView;
@end

@implementation StatusCell

#pragma mark 计算cell行高
-(CGFloat)rowHeight:(StatusViewModel*)vm{
    self.viewModel = vm;
    [self.contentView layoutIfNeeded];
    return CGRectGetMaxY(self.bottomView.frame);
}

#pragma mark - 控件赋值
- (void)setViewModel:(StatusViewModel *)viewModel{
    self.topView.viewModel = viewModel;
    self.textContentLbl.text = viewModel.status.text;
    self.picsView.viewModel = viewModel;
    // 计算完刷新更新布局
    [self.picsView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.picsView.bounds.size.height));
    }];
}

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.topView = [[StatusCellTopView alloc]init];
        self.textContentLbl = [UILabel labelWithFont:[UIFont systemFontOfSize:16]];
        self.picsView = [[StatusPicsView alloc]init];
        self.bottomView = [[StatusCellBottomView alloc]init];
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置界面布局
- (void)setupUI{
    [self.contentView addSubview:self.topView];
    [self.contentView addSubview:self.textContentLbl];
    [self.contentView addSubview:self.picsView];
    [self.contentView addSubview:self.bottomView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@(StatusCellTopViewIconWidth+StatusCellMargin));
    }];
    
    [self.textContentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom).offset(StatusCellMargin);
        make.left.equalTo(self.contentView.mas_left).offset(StatusCellMargin);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picsView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
    }];
}
@end
